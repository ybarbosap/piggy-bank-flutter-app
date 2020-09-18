part of 'add_cubit.dart';

abstract class AddState extends Equatable {
  const AddState();

  @override
  List<Object> get props => [];
}

class AddInitial extends AddState {}

class AddInitialValue extends AddState {
  AddInitialValue(this.value);
  final String value;

  @override
  List<Object> get props => [value];
}

class AddLoading extends AddInitial {}

class AddSuccess extends AddInitial {}
