import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:github_clone/features/home/model/organization_data/organization_data.dart';
import 'package:github_clone/features/home/model/organization_repository/organization_repository.dart';
import 'package:github_clone/features/home/repository/home_service.dart';
import 'package:github_clone/utils/api_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial(isLoading: true)) {
    on<InitializeHomeEvent>(initializeHomeEvent);
    on<SelectOrganizationEvent>(selectOrganizationEvent);
    on<GoToProjectViewEvent>(goToProjectViewEvent);
    on<BackToHomeViewEvent>(backToHomeViewEvent);
    on<LogOutEvent>(logOutEvent);
  }

  List<OrganizationData> _organizations = [];
  List<OrganizationRepository> _organizationRepository = [];
  int _selectedOrganizationIndex = 0;
  int _selectedProjectIndex = 0;

  List<OrganizationData> get organizations => _organizations;
  List<OrganizationRepository> get organizationRepository =>
      _organizationRepository;
  int? get selectedOrganizationIndex => _selectedOrganizationIndex;
  int? get selectedProjectIndex => _selectedProjectIndex;

  Future<FutureOr<void>> initializeHomeEvent(
    InitializeHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeInitial(
      isLoading: true,
    ));
    final data = await HomeService.getUserOrganizations(
      token: event.token,
    );
    if (data is Success) {
      _organizations = data.response as List<OrganizationData>;
      if (_organizations.isNotEmpty) {
        final ApiStaus organizationRepositoryData =
            await HomeService.getOrganizationRepos(
          organizationName: _organizations[0].login!,
          token: event.token,
        );
        if (organizationRepositoryData is Success) {
          _selectedOrganizationIndex = 0;
          _organizationRepository = organizationRepositoryData.response
              as List<OrganizationRepository>;
          emit(HomeInitial(
            isLoading: false,
            organizations: data.response as List<OrganizationData>,
          ));
        }
      }
      // organizationRepository = _organizations.isNotEmpty? _organizations[0]:
      emit(HomeInitial(
        isLoading: false,
        organizations: data.response as List<OrganizationData>,
      ));
    } else if (data is Failure) {
      emit(
        HomeInitial(
          isLoading: false,
          error: data,
        ),
      );
    }
  }

  Future<FutureOr<void>> selectOrganizationEvent(
    SelectOrganizationEvent event,
    Emitter<HomeState> emit,
  ) async {
    _organizationRepository = [];
    emit(
      const HomeInitial(
        isLoading: true,
      ),
    );
    _selectedOrganizationIndex = event.selectedIndex;
    final ApiStaus response = await HomeService.getOrganizationRepos(
      organizationName: _organizations[event.selectedIndex].login!,
      token: event.token,
    );
    if (response is Success) {
      _organizationRepository =
          response.response as List<OrganizationRepository>;
      emit(
        const HomeInitial(
          isLoading: false,
        ),
      );
    } else if (response is Failure) {
      emit(
        HomeInitial(
          error: response,
          isLoading: false,
        ),
      );
    }
  }

  Future<FutureOr<void>> logOutEvent(
    LogOutEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      const HomeInitial(
        isLoading: true,
      ),
    );
    final ApiStaus response = await HomeService.signOut();
    if (response is Success) {
      emit(
        const UnAuthenticatedState(
          isLoading: false,
        ),
      );
    } else if (response is Failure) {
      emit(
        HomeInitial(
          error: response,
          isLoading: false,
        ),
      );
    }
  }

  FutureOr<void> goToProjectViewEvent(
    GoToProjectViewEvent event,
    Emitter<HomeState> emit,
  ) {
    
    _selectedProjectIndex = event.selectedIndex;
    emit(ProjectViewState(
      isLoading: false,
      selectedIndex: event.selectedIndex,
    ));
  }

  FutureOr<void> backToHomeViewEvent(
    BackToHomeViewEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      const HomeViewsState(
        isLoading: false,
      ),
    );
  }
}
