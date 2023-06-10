import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:github_clone/features/porject/model/branch_data/branch_data.dart';
import 'package:github_clone/features/porject/model/commit_data/commit_data.dart';
import 'package:github_clone/features/porject/repository/project_service.dart';
import 'package:github_clone/utils/api_status.dart';

part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  BranchBloc() : super(const BranchInitial(isLoading: true)) {
    on<InitializeBranchEvent>(initializeBranchEvent);
    on<GoToHomeViewEvent>(goToHomeViewEvent);
    on<SelectBranchEvent>(selectBranchEvent);
  }
  List<BranchData> _branches = [];
  int _selectedBranchIndex = 0;
  List<CommitData> _commitData = [];

  List<BranchData> get branches => _branches;
  int? get selectedBranchIndex => _selectedBranchIndex;
  List<CommitData> get commitData => _commitData;

  Future<FutureOr<void>> initializeBranchEvent(
    InitializeBranchEvent event,
    Emitter<BranchState> emit,
  ) async {
    emit(const BranchInitial(
      isLoading: true,
    ));
    final ApiStaus data = await ProjectService.getProjectBranches(
      token: event.token,
      owner: event.owner,
      repo: event.repo,
    );
    if (data is Success) {
      _branches = data.response as List<BranchData>;
      if (_branches.isNotEmpty) {
        final ApiStaus commitData = await ProjectService.getBranchCommits(
            owner: event.owner,
            repo: event.repo,
            token: event.token,
            branch: branches[0].commit!.sha ?? "");
        if (commitData is Success) {
          _commitData = commitData.response as List<CommitData>;
          emit(BranchInitial(
              isLoading: false, branches: data.response as List<BranchData>));
        }
      }
      emit(BranchInitial(
        isLoading: false,
        branches: data.response as List<BranchData>,
      ));
    } else if (data is Failure) {
      emit(
        BranchInitial(
          isLoading: false,
          error: data,
        ),
      );
    }
  }

  FutureOr<void> goToHomeViewEvent(
    GoToHomeViewEvent event,
    Emitter<BranchState> emit,
  ) {
    emit(
      const HomeViewState(
        isLoading: false,
      ),
    );
  }

  Future<FutureOr<void>> selectBranchEvent(
    SelectBranchEvent event,
    Emitter<BranchState> emit,
  ) async {
    emit(const BranchInitial(
      isLoading: true,
    ));
    _selectedBranchIndex = event.selectedIndex;
    final ApiStaus response = await ProjectService.getBranchCommits(
      owner: event.owner,
      repo: event.repo,
      token: event.token,
      branch: event.sha ?? "",
      // uri: event.uri,
    );
    if (response is Success) {
      _commitData = response.response as List<CommitData>;
      emit(const BranchInitial(
        isLoading: false,
      ));
    } else if (response is Failure) {
      emit(BranchInitial(
        error: response,
        isLoading: false,
      ));
    }
  }
}
