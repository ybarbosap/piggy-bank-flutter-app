part of 'home_controller_cubit.dart';

abstract class HomeControllerState extends Equatable {
  const HomeControllerState();
  @override
  List<Object> get props => [];
}

class HomeControllerInitial extends HomeControllerState {}

class HomeControllerIsLoading extends HomeControllerState {}

class HomeControllerSuccess extends HomeControllerState {
  HomeControllerSuccess(this.data) : super();
  final List<PiggyBankModel> data;

  @override
  List<Object> get props => [data];
}

class HomeControllerFailure extends HomeControllerState {
  HomeControllerFailure(this.errorMessage) : super();

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
