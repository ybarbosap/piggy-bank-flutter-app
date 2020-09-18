import 'package:bloc/bloc.dart';
import 'package:cofrinho_app/src/shared/models/operation_model.dart';
import 'package:cofrinho_app/src/shared/services/db/db_service_interface.dart';
import 'package:equatable/equatable.dart';

part 'operation_state.dart';

class OperationCubit extends Cubit<OperationState> {
  OperationCubit(this.dbService) : super(OperationInitial());

  final IDbService dbService;

  Future<void> clearOperations(int id) async {
    emit(OperationLoading());
    await dbService.dellAllOperations(id);
    emit(OperationInitial());
  }

  Future<void> getOperations(int id) async {
    emit(OperationLoading());
    var data = await dbService.getAllOperations(id);
    if (data.length > 0) {
      emit(OperationSuccess(data));
    } else {
      emit(OperationInitial());
    }
  }
}
