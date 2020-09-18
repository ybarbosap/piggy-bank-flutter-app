part of 'bank_cubit.dart';

abstract class BankState extends Equatable {
  const BankState();

  @override
  List<Object> get props => [];
}

class BankInitial extends BankState {}

class BankLoading extends BankState {}

class BankSuccess extends BankState {
  BankSuccess(this.model) : super();
  final PiggyBankModel model;

  @override
  List<Object> get props => [model];
}

class BankFailure extends BankState {}
