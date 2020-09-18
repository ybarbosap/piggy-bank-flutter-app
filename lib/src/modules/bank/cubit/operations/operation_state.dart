part of 'operation_cubit.dart';

abstract class OperationState extends Equatable {
  const OperationState();

  @override
  List<Object> get props => [];
}

class OperationInitial extends OperationState {}

class OperationLoading extends OperationState {}

class OperationSuccess extends OperationState {
  OperationSuccess(this.data) : super();
  final List<OperationModel> data;

  @override
  List<Object> get props => [data];
}
