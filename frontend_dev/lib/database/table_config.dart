import 'package:sqflite/sqflite.dart';
import 'package:frontend_dev/database/database.dart';

String databaseName = "InkYear";

/// 创建配置表
void createConfigTable() async {
  final String sql =
      "CREATE TABLE 'CONFIG' ("
      "id INTEGER, nickname TEXT, "
      "email TEXT, password TEXT, "
      "isSetup INTEGER, "
      "PRIMARY KEY(id) "
      ")";

  Database db = await openDatabase(
      await createDatabase(databaseName),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(sql);
      }
  );

  print("Create table CONFIG successfully!");
  await db.close();
}

/// 更新启动
void updateSetup(String email, int isSetup) async {
  int id;

  final String sql = "UPDATE CONFIG SET "
      "isSetup = '$isSetup' "
      "WHERE email = '$email' ";

  Database db = await openDatabase(await createDatabase(databaseName));

  await db.transaction((txn) async {
    id = await txn.rawUpdate(sql);
  });
  print(id);

  await db.close();
}

/// 查询启动
Future<int> querySetup(String email) async {
  List<Map<String, dynamic>> results;
  int isSetup;

  final String sql = "SELECT * FROM CONFIG WHERE email = '$email' ";

  Database db = await openDatabase(await createDatabase(databaseName));

  results = await db.rawQuery(sql);
  print(results);

  isSetup = results[0]["isSetup"];
  print("isSetup: $isSetup");

  await db.close();

  return isSetup;
}