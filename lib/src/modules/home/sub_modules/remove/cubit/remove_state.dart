part of 'remove_cubit.dart';

abstract class RemoveState extends Equatable {
  const RemoveState();

  @override
  List<Object> get props => [];
}

class RemoveInitial extends RemoveState {
  @override
  List<Object> get props => [];
}

class RemoveLoading extends RemoveState {
  @override
  List<Object> get props => [];
}

class RemoveSuccess extends RemoveState {
  @override
  List<Object> get props => [];
}

class GetSuccess extends RemoveState {
  GetSuccess(this.data);
  final List<PiggyBankModel> data;

  @override
  List<Object> get props => [data];
}

class RemoveFailure extends RemoveState {}
