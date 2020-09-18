import 'package:bloc/bloc.dart';
import 'package:cofrinho_app/src/shared/models/piggy_bank_model.dart';
import 'package:cofrinho_app/src/shared/services/db/db_service_interface.dart';
import 'package:equatable/equatable.dart';

part 'remove_state.dart';

class RemoveCubit extends Cubit<RemoveState> {
  RemoveCubit(this.dbService) : super(RemoveInitial());

  final IDbService dbService;

  Future<void> getBanks() async {
    emit(RemoveLoading());
    dbService.getAllPiggyBanks().then((banks) {
      if (banks.length > 0) {
        emit(GetSuccess(banks));
      } else {
        emit(RemoveInitial());
      }
    });
  }

  Future<void> delete(int id) async {
    emit(RemoveLoading());
    var remove = await dbService.dellPiggyBank(id);
    if (remove > 0) {
      getBanks();
    } else {
      emit(RemoveFailure());
    }
  }
}
