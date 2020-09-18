part of 'drop_menu_cubit.dart';

abstract class DropMenuState extends Equatable {
  const DropMenuState();

  @override
  List<Object> get props => [];
}

class DropMenuInitial extends DropMenuState {
  DropMenuInitial(this.item);
  final DropMenu item;

  @override
  List<Object> get props => [item];
}
