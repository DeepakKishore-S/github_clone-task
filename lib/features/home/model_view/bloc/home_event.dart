// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

@immutable
class InitializeHomeEvent extends HomeEvent {
  final String token;
  const InitializeHomeEvent(
    this.token,
  );
}

@immutable
class SelectOrganizationEvent extends HomeEvent {
  final int selectedIndex;
  final String token;
  const SelectOrganizationEvent({
    required this.selectedIndex,
    required this.token,
  });
}

@immutable
class LogOutEvent extends HomeEvent {
  const LogOutEvent();
}

@immutable
class GoToProjectViewEvent extends HomeEvent {
  final int selectedIndex;
  const GoToProjectViewEvent(
    this.selectedIndex,
  );
}

class BackToHomeViewEvent extends HomeEvent {
  const BackToHomeViewEvent();
}
