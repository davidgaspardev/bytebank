import 'package:bytebank/src/database/database.dart';
import 'package:bytebank/src/helpers/abstractions/repository.dart';
import 'package:bytebank/src/models/transfer_data.dart';

class TransferRepo extends Repository<TransferData> {
  static const tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_accountNumber INTEGER, '
      '$_value REAL)';
  static const _tableName = 'transfers';
  static const _id = 'id';
  static const _accountNumber = 'account_number';
  static const _value = 'value';

  Database? db;

  @override
  Future<int> create(TransferData data) async {
    db ??= await createDatabase();

    final transferMap = <String, dynamic>{
      _accountNumber: data.accountNumber,
      _value: data.value,
    };

    return await db!.insert(_tableName, transferMap);
  }

  @override
  Future<List<TransferData>> readAll() async {
    db ??= await createDatabase();

    var transfers = <TransferData>[];

    for (Map<String, dynamic> row in await db!.query(_tableName)) {
      transfers.add(
        TransferData(
          accountNumber: row[_accountNumber],
          value: row[_value],
        ),
      );
    }

    return transfers;
  }
}
