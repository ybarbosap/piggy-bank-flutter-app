import 'package:bloc/bloc.dart';
import 'package:cofrinho_app/src/modules/bank/bank_page.dart';
import 'package:equatable/equatable.dart';

part 'drop_menu_state.dart';

class DropMenuCubit extends Cubit<DropMenuState> {
  DropMenuCubit() : super(DropMenuInitial(null));

  void setMenuState(DropMenu value) => emit(DropMenuInitial(value));
}
