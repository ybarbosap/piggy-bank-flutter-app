import '../../../shared/models/operation_model.dart';
import '../../../shared/models/piggy_bank_model.dart';

abstract class IDbService {
  Future<int> createPiggyBank(Map<String, dynamic> data);
  Future<PiggyBankModel> getPiggyBank(int id);
  Future<List<PiggyBankModel>> getAllPiggyBanks();
  Future<int> updateTitle(String title, int id);
  Future<int> dellPiggyBank(int id);
  Future<int> createOperation(Map<String, dynamic> data);
  Future<List<OperationModel>> getAllOperations(int id);
  Future<int> dellAllOperations(int id);
  //Future open();
  Future<void> close();
}
