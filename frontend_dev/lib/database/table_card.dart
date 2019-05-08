import 'package:sqflite/sqflite.dart';
import 'package:frontend_dev/database/database.dart';

String databaseName = "InkYear";

/// 创建卡片表
void createCardTable() async {
  final String sql =
      "CREATE TABLE 'CARD' ("
      "id INTEGER, type TEXT,"
      "title TEXT, tag TEXT, content TEXT, "
      "PRIMARY KEY(id, type) "
      ")";

  Database db = await openDatabase(
      await createDatabase(databaseName),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(sql);
      }
  );

  print("Create table CARD successfully!");
  await db.close();
}

/// 添加卡片
void addCard(String title, String content) async {
  int id;

  final String sql = "INSERT INTO CARD(type, title, content) "
      "VALUES('plaintext', '$title', '$content')";

  Database db = await openDatabase(await createDatabase(databaseName));

  await db.transaction((txn) async {
    id = await txn.rawInsert(sql);
  });
  print(id);

  await db.close();
}

/// 更新卡片
void updateCard(String title, String content) async {
  int id;

  final String sql = "UPDATE CARD SET "
      "title = '$title', content = '$content' "
      "WHERE type = 'plaintext'";

  Database db = await openDatabase(await createDatabase(databaseName));

  await db.transaction((txn) async {
    id = await txn.rawUpdate(sql);
  });
  print(id);

  await db.close();
}

/// 查询卡片
void queryCard(int id) async {
  List<Map<String, dynamic>> results;
  String type;
  String title;
  String content;

  final String sql = "SELECT * FROM CARD";

  Database db = await openDatabase(await createDatabase(databaseName));

  results = await db.rawQuery(sql);
  print(results);

  type = results[0]["type"];
  print("type: $type");
  title = results[0]["title"];
  print("title: $title");
  content = results[0]["content"];
  print("content: $content");

  await db.close();
}
