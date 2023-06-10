// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final bool isLoading;
  final Failure? error;
  const HomeState({
    required this.isLoading,
    this.error,
  });

  @override
  List<Object> get props => [isLoading];
}

class HomeInitial extends HomeState {
  final List<OrganizationData>? organizations;
  const HomeInitial({
    required super.isLoading,
    super.error,
    this.organizations,
  });
  @override
  List<Object> get props => [isLoading];
}

class ProjectViewState extends HomeState {
  final int selectedIndex;
  const ProjectViewState({
    required super.isLoading,
    required this.selectedIndex,
  });
}

class UnAuthenticatedState extends HomeState {
  const UnAuthenticatedState({required super.isLoading});
}

class HomeViewsState extends HomeState {
  const HomeViewsState({required super.isLoading});
}
