import 'package:bloc/bloc.dart';
import 'package:cofrinho_app/src/shared/models/piggy_bank_model.dart';
import 'package:cofrinho_app/src/shared/services/db/db_service_interface.dart';
import 'package:equatable/equatable.dart';

part 'bank_state.dart';

class BankCubit extends Cubit<BankState> {
  BankCubit(this.dbService) : super(BankInitial());

  final IDbService dbService;

  Future<void> updateTile(String title, int id) async {
    var edited = await dbService.updateTitle(title, id);
    if (edited >= 0) {
      getBankDetail(id);
    }
  }

  Future<void> getBankDetail(int id) async {
    emit(BankLoading());
    var model = await dbService.getPiggyBank(id);
    if (model != null) {
      emit(BankSuccess(model));
    } else {
      emit(BankFailure());
    }
  }
}
