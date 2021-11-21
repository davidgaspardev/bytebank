import 'package:bytebank/src/database/database.dart';
import 'package:bytebank/src/helpers/abstractions/repository.dart';
import 'package:bytebank/src/models/deposit_data.dart';

class DepositRepo extends Repository<DepositData> {
  static const tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_value REAL, '
      '$_dateTime VARCHAR(30))';
  static const _id = 'id';
  static const _tableName = 'deposits';
  static const _value = 'value';
  static const _dateTime = 'dateTime';

  Database? db;

  @override
  Future<int> create(DepositData data) async {
    db ??= await createDatabase();
    
    final depositMap = data.toMap();

    return await db!.insert(_tableName, depositMap);
  }

  @override
  Future<List<DepositData>> readAll() async {
    db ??= await createDatabase();
    
    var deposits = <DepositData>[];

    for (Map<String, dynamic> row in await db!.query(_tableName)) {
      deposits.add(DepositData(
        value: row[_value],
        dateTime: DateTime.tryParse(row[_dateTime]) ?? DateTime.now(),
      ));
    }

    return deposits;
  }
}
