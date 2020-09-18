import 'package:bloc/bloc.dart';
import 'package:cofrinho_app/src/shared/services/db/db_service_interface.dart';
import 'package:equatable/equatable.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this.dbService) : super(AddInitial());
  final IDbService dbService;

  int bankId;
  String typeOperation;

  void setType(String type) => typeOperation = type;
  void setId(int id) => bankId = id;

  void setDropItem(String value) => emit(AddInitialValue(value));

  Future<int> createOperation(String value) async {
    assert(bankId != null);
    assert(state is AddInitialValue);
    var piggy = await dbService.getPiggyBank(bankId);

    var parsing = value.replaceAll(RegExp(r','), '');
    var v = double.parse(parsing);

    if (state.props[0] == "Withdraw" || state.props[0] == "Saque") {
      if (piggy.balance >= v) {
        v *= -1;
      } else {
        return null;
      }
    }
    var data = {
      "type": state.props[0],
      "date": DateTime.now().toIso8601String().split("T")[0] ??
          DateTime.now().toIso8601String(),
      "value": v,
      "piggy_bank_id": bankId
    };
    var id = await dbService.createOperation(data);
    if (id >= 0) {
      emit(AddSuccess());
    }
    return id;
  }
}
