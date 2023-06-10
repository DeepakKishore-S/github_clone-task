// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'branch_bloc.dart';

abstract class BranchEvent extends Equatable {
  const BranchEvent();

  @override
  List<Object> get props => [];
}

@immutable
class InitializeBranchEvent extends BranchEvent {
  final String token;
  final String owner;
  final String repo;

  const InitializeBranchEvent({
    required this.owner,
    required this.repo,
    required this.token,
  });
}

@immutable
class SelectBranchEvent extends BranchEvent {
  final String uri;
  final String token;
  final int selectedIndex;
  final String? sha;
  final String owner;
  final String repo;
  const SelectBranchEvent({
    required this.uri,
    required this.token,
    required this.selectedIndex,
    required this.sha,
    required this.owner,
    required this.repo,
  });
}

@immutable
class GoToHomeViewEvent extends BranchEvent {
  const GoToHomeViewEvent();
}
