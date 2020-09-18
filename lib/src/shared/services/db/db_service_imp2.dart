import 'dart:io';

import 'package:cofrinho_app/src/shared/models/piggy_bank_model.dart';
import 'package:cofrinho_app/src/shared/models/operation_model.dart';
import 'package:cofrinho_app/src/shared/services/db/db_service_interface.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

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
  DbService._internal();
  factory DbService() {
    _instance ??= DbService._internal();
    return _instance;
  }

  static DbService _instance;

  Database db;

  Future<Database> _open() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'piggyBank.db';
    return await openDatabase(
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
    var piggy = await getPiggyBank(id, false);
    assert(db != null);
    piggy.balance += value;
    await db.update(TABLE_PIGGY_BANK, {"balance": piggy.balance},
        where: "$COLUMN_ID = ?", whereArgs: [id]);
  }

  @override
  Future<int> createOperation(Map<String, dynamic> data) async {
    db ??= await _open();
    var op = await db.insert(TABLE_OPERATION, data);
    await updateBalance(data["piggy_bank_id"], data["value"]);
    await close();
    return op;
  }

  @override
  Future<int> createPiggyBank(Map<String, dynamic> data) async {
    db ??= await _open();
    var id = await db.insert(TABLE_PIGGY_BANK, data);
    await close();
    return id;
  }

  @override
  Future<int> dellAllOperations(int id) async {
    db ??= await _open();
    var idremoved = await db.delete(TABLE_OPERATION,
        where: "$COLUMN_PIGGY_BANK_ID = ?", whereArgs: [id]);
    await db.update(TABLE_PIGGY_BANK, {"balance": 0.00},
        where: "$COLUMN_ID = ?", whereArgs: [id]);
    await close();
    return idremoved;
  }

  @override
  Future<int> dellPiggyBank(int id) async {
    db ??= await _open();
    await db.delete(TABLE_OPERATION,
        where: "$COLUMN_PIGGY_BANK_ID = ?", whereArgs: [id]);
    var idremoved = await db
        .delete(TABLE_PIGGY_BANK, where: "$COLUMN_ID = ?", whereArgs: [id]);
    await close();
    return idremoved;
  }

  @override
  Future<List<OperationModel>> getAllOperations(int id) async {
    db ??= await _open();
    var query = await db.query(
      TABLE_OPERATION,
      where: "$COLUMN_PIGGY_BANK_ID = ?",
      whereArgs: [id],
    );
    await close();
    return List.generate(
      query.length,
      (index) => OperationModel.fromMap(query[index]),
    );
  }

  @override
  Future<List<PiggyBankModel>> getAllPiggyBanks() async {
    db ??= await _open();
    var query = await db.query(TABLE_PIGGY_BANK);
    await close();
    return List.generate(
      query.length,
      (index) => PiggyBankModel.fromMap(query[index]),
    );
  }

  @override
  Future<PiggyBankModel> getPiggyBank(int id, [bool closedb]) async {
    db ??= await _open();
    assert(id != null);
    var query = await db.query(
      TABLE_PIGGY_BANK,
      where: "$COLUMN_ID = ?",
      whereArgs: [id],
    );
    var model = PiggyBankModel.fromMap(query[0]);
    closedb ?? await close();
    return model ?? null;
  }

  @override
  Future<void> close() async {
    await db.close();
    db = null;
  }

  @override
  Future<int> updateTitle(String title, int id) async {
    db ??= await _open();
    return await db.update(TABLE_PIGGY_BANK, {"title": title},
        where: "$COLUMN_ID = ?", whereArgs: [id]);
  }
}
