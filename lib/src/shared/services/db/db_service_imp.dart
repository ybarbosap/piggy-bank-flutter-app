import 'package:cofrinho_app/src/shared/models/piggy_bank_model.dart';
import 'package:cofrinho_app/src/shared/models/operation_model.dart';
import 'package:cofrinho_app/src/shared/services/db/db_service_interface.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String COLUMN_ID = "id";

//TABLE PIGGY BANK
const String TABLE_PIGGY_BANK = "PiggyBank";
const String COLUMN_TITLE = "title";
const String COLUMN_BALANCE = "balance";

// TABLE OPERATION
const String TABLE_OPERATION = "Operation";
const String COLUMN_VALUE = "value";
const String COLUMN_TYPE = "type";
const String COLUMN_DATE = "date";
const String COLUMN_PIGGY_BANK_ID = "piggy_bank_id";

class DbService implements IDbService {
  DbService() {
    open();
  }

  Database db;

  Future open() async {
    var path = join(await getDatabasesPath(), 'piggyBank.db');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        var piggyBankSql = """
        create table $TABLE_PIGGY_BANK(
          $COLUMN_ID integer primary key autoincrement,
          $COLUMN_TITLE text not null,
          $COLUMN_BALANCE double not null)
        """;

        var operationSql = """
        create table $TABLE_OPERATION(
          $COLUMN_ID integer primary key autoincrement,
          $COLUMN_VALUE double not null,
          $COLUMN_TYPE text not null,
          $COLUMN_DATE text not null,
          $COLUMN_PIGGY_BANK_ID integer,
          FOREIGN KEY($COLUMN_PIGGY_BANK_ID) REFERENCES $TABLE_PIGGY_BANK($COLUMN_ID))
        """;
        await db.execute(piggyBankSql);
        await db.execute(operationSql);
      },
      onConfigure: (db) async {
        await db.execute("PRAGMA foreign_keys = ON");
      },
    );
  }

  Future<void> updateBalance(int id, double value) async {
    var piggy = await getPiggyBank(id);
    piggy.balance += value;
    await db.update(TABLE_PIGGY_BANK, {"balance": piggy.balance},
        where: "$COLUMN_ID = ?", whereArgs: [id]);
  }

  @override
  Future<int> createOperation(Map<String, dynamic> data) async {
    var op = await db.insert(TABLE_OPERATION, data);
    await updateBalance(data["piggy_bank_id"], data["value"]);
    return op;
  }

  @override
  Future<int> createPiggyBank(Map<String, dynamic> data) async =>
      await db.insert(TABLE_PIGGY_BANK, data);

  Future<void> _dellAllOperations(int id) async {
    await db.delete(TABLE_OPERATION,
        where: "$COLUMN_PIGGY_BANK_ID = ?", whereArgs: [id]);
  }

  @override
  Future<int> dellPiggyBank(int id) async {
    await _dellAllOperations(id);
    return await db
        .delete(TABLE_PIGGY_BANK, where: "$COLUMN_ID = ?", whereArgs: [id]);
  }

  @override
  Future<List<OperationModel>> getAllOperations(int id) async {
    var query = await db.query(
      TABLE_OPERATION,
      where: "$COLUMN_PIGGY_BANK_ID = ?",
      whereArgs: [id],
    );
    return List.generate(
      query.length,
      (index) => OperationModel.fromMap(query[index]),
    );
  }

  @override
  Future<List<PiggyBankModel>> getAllPiggyBanks() async {
    var query = await db.query(TABLE_PIGGY_BANK);
    return List.generate(
      query.length,
      (index) => PiggyBankModel.fromMap(query[index]),
    );
  }

  @override
  Future<PiggyBankModel> getPiggyBank(int id) async {
    assert(id != null);
    var query = await db.query(
      TABLE_PIGGY_BANK,
      where: "$COLUMN_ID = ?",
      whereArgs: [id],
    );
    var model = PiggyBankModel.fromMap(query[0]);
    return model ?? null;
  }

  @override
  Future<void> close() async {
    await db.close();
  }

  @override
  Future<int> updateTitle(String title, int id) async {
    return await db.update(TABLE_PIGGY_BANK, {"title": title},
        where: "$COLUMN_ID = ?", whereArgs: [id]);
  }

  @override
  Future<int> dellAllOperations(int id) async {
    db ??= await open();
    var idremoved = await db.delete(TABLE_OPERATION,
        where: "$COLUMN_PIGGY_BANK_ID = ?", whereArgs: [id]);
    await close();
    return idremoved;
  }
}
