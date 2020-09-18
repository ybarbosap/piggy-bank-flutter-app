import 'package:bloc/bloc.dart';
import 'package:cofrinho_app/src/shared/services/db/db_service_interface.dart';
import 'package:equatable/equatable.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this.dbService) : super(AddInitial());

  final IDbService dbService;

  Future<void> create(String title) async {
    final data = {"balance": 0.0, "title": title};
    var insert = await dbService.createPiggyBank(data);
    if (insert > 0) {
      emit(AddSuccess());
    } else {
      emit(AddFailure());
    }
  }
}
