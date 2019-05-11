import 'package:sqflite/sqflite.dart';
import 'package:frontend_dev/database/database.dart';

String databaseName = "InkYear";

/// 创建卡片表
void createCardTable() async {
  final String sql =
      "CREATE TABLE 'CARD' "
      "("
      "id INTEGER, type TEXT, "
      "title TEXT, tag INTEGER, content1 TEXT, content2 TEXT, "
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
void addBasicCard() async {
  int id;

  final String sql = "INSERT INTO CARD(type, title) "
      "VALUES('basic', 'Daily')";

  Database db = await openDatabase(await createDatabase(databaseName));

  await db.transaction((txn) async {
    id = await txn.rawInsert(sql);
  });
  print('$id: basic card add finished');

  await db.close();
}

/// 添加卡片
void addExtendCard1({String title, int tag, String content}) async {
  int id;

  final String sql = "INSERT INTO CARD(type, title, tag, content1) "
      "VALUES('extends', '$title', '$tag', '$content')";

  Database db = await openDatabase(await createDatabase(databaseName));

  await db.transaction((txn) async {
    id = await txn.rawInsert(sql);
  });
  print('$id: extend card 1 add finished');

  await db.close();
}

/// 添加卡片
void addExtendCard2({String title, String content1, String content2}) async {
  int id;

  final String sql = "INSERT INTO CARD(type, title, tag, content1) "
      "VALUES('extend2', '$title', 1, '$content1', '$content2')";

  Database db = await openDatabase(await createDatabase(databaseName));

  await db.transaction((txn) async {
    id = await txn.rawInsert(sql);
  });
  print('$id: extend card 2 add finished');

  await db.close();
}

/// 更新卡片
void updateExtendCard1(int id, String title, int tag, String content) async {
  int id;

  final String sql = "UPDATE CARD SET "
      "title = '$title', tag = '$tag', content1 = '$content' "
      "WHERE id = '$id' AND type = 'extend1'";

  Database db = await openDatabase(await createDatabase(databaseName));

  await db.transaction((txn) async {
    id = await txn.rawUpdate(sql);
  });
  print('$id: extend card 1 update finished');

  await db.close();
}

/// 更新卡片
void updateExtendCard2(int id, String title, String content1, String content2) async {
  int id;

  final String sql = "UPDATE CARD SET "
      "title = '$title', content1 = '$content1', content2 = '$content2' "
      "WHERE id = '$id' AND type = 'extend2'";

  Database db = await openDatabase(await createDatabase(databaseName));

  await db.transaction((txn) async {
    id = await txn.rawUpdate(sql);
  });
  print('$id: extend card 2 update finished');

  await db.close();
}

/// 查询卡片
Future<bool> queryBasicCard() async {
  List<Map<String, dynamic>> results;
  bool isExist;
  int id;
  String type;

  final String sql = "SELECT * FROM CARD where type = 'basic'";

  Database db = await openDatabase(await createDatabase(databaseName));

  results = await db.rawQuery(sql);
  print(results);

  id = results[0]["id"];
  print("id: $id");
  type = results[0]["type"];
  print("type: $type");

  await db.close();

  return isExist;
}

/// 查询卡片
Future<List<List>> queryExtend1Card() async {
  List<Map<String, dynamic>> results;
  String title;
  int tag;
  String content;

  final String sql = "SELECT * FROM CARD where type = 'extend1'";

  Database db = await openDatabase(await createDatabase(databaseName));

  results = await db.rawQuery(sql);
  print(results);

  /*title = results[0]["title"];
  print("title: $title");
  tag = results[0]["tag"];
  print("tag: $tag");
  content = results[0]["content"];
  print("content: $content");*/

  await db.close();

  return List.generate(results.length, (int index) {
    return [
      results[index]["title"],
      results[index]["tag"],
      results[index]["content"],
    ];
  });
}

/// 查询卡片
Future<List<List>> queryExtend2Card() async {
  List<Map<String, dynamic>> results;
  String title;
  String content1;
  String content2;

  final String sql = "SELECT * FROM CARD where type = 'extend2'";

  Database db = await openDatabase(await createDatabase(databaseName));

  results = await db.rawQuery(sql);
  print(results);

  /*title = results[0]["title"];
  print("title: $title");
  content1 = results[0]["content1"];
  print("content1: $content1");
  content2 = results[0]["content2"];
  print("content1: $content2");*/

  await db.close();

  return List.generate(results.length, (int index) {
    return [
      results[index]["title"],
      results[index]["content1"],
      results[index]["content2"],
    ];
  });
}