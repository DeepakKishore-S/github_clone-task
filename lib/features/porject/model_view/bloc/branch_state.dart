// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'branch_bloc.dart';

abstract class BranchState extends Equatable {
  final bool isLoading;
  final Failure? error;
  const BranchState({
    required this.isLoading,
    this.error,
  });

  @override
  List<Object> get props => [isLoading];
}

class BranchInitial extends BranchState {
  final List<BranchData>? branches;
  const BranchInitial({
    this.branches,
    super.error,
    required super.isLoading,
  });
}

class HomeViewState extends BranchState {
  const HomeViewState({required super.isLoading});
}
