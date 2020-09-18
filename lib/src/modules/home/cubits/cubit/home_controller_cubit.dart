import 'package:bloc/bloc.dart';
import 'package:cofrinho_app/src/shared/models/piggy_bank_model.dart';
import 'package:cofrinho_app/src/shared/services/db/db_service_interface.dart';
import 'package:equatable/equatable.dart';

part 'home_controller_state.dart';

class HomeControllerCubit extends Cubit<HomeControllerState> {
  HomeControllerCubit(this.dbService) : super(HomeControllerInitial());

  final IDbService dbService;

  Future<void> getBanks() async {
    emit(HomeControllerIsLoading());
    final banks = await dbService.getAllPiggyBanks();
    if (banks.length > 0) {
      emit(HomeControllerSuccess(banks));
    } else {
      emit(HomeControllerInitial());
    }
  }
}
