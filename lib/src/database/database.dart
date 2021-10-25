import 'package:bytebank/src/database/repository/contact_repo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
export 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  String path = await getDatabasesPath();

  path = join(path, 'bytebank.db');

  return await openDatabase(
    path,
    onCreate: (db, version) {
      switch (version) {
        case 1:
          db.execute(ContactRepo.tableSql);
          break;
      }
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
