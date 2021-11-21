import 'package:bytebank/src/database/repository/contact_repo.dart';
import 'package:bytebank/src/database/repository/deposit_repo.dart';
import 'package:bytebank/src/database/repository/transfer_repo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
export 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  String path = await getDatabasesPath();

  path = join(path, 'bytebank.db');

  return await openDatabase(
    path,
    onCreate: (db, version) async {
      switch (version) {
        case 1:
          await db.execute(ContactRepo.tableSql);
          await db.execute(TransferRepo.tableSql);
          await db.execute(DepositRepo.tableSql);
          break;
      }
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
