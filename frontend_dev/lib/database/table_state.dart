import 'package:sqflite/sqflite.dart';
import 'package:frontend_dev/database/database.dart';

String databaseName = "InkYear";
enum States {mental, physical, skill, sense, others}
List<String> states = ['mental', 'physical', 'skill', 'sense', 'others'];


/// 创建状态表
void createStateTable() async {
  final String sql =
      "CREATE TABLE 'STATE' ("
      "year INTEGER, month INTEGER, day INTEGER, "
      "total INTERGER, "
      "mental INTEGER, physical INTEGER, skill INTEGER, sense INTEGER, "
      "others INTEGER, "
      // "card_id INTEGER, card_type TEXT, "
      "PRIMARY KEY (year, month, day) "
      // "FOREIGN KEY (card_id, card_type) REFERENCES Card(id, type), "
      ")";

  Database db = await openDatabase(
      await createDatabase(databaseName),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(sql);
      }
  );

  print("Create table STATE successfully!");
  await db.close();
}

/// 添加状态条
void addState() async {
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  int mental = 250;
  int physical = 250;
  int skill = 250;
  int sense = 250;
  int others = 250;
  int total = mental + physical + skill + sense + others;

  int id;

  final String sql = "INSERT INTO STATE(year, month, day, total, "
      "mental, physical, skill, sense, others) "
      "VALUES('$year', '$month', '$day', '$total', "
      "'$mental', '$physical', '$skill', '$sense', '$others')";

  Database db = await openDatabase(await createDatabase(databaseName));

  await db.transaction((txn) async {
    id = await txn.rawInsert(sql);
  });
  print('$id: add finished');

  await db.close();
}

/// 更新总状态值
void updateTotalState({int value = 0}) async {
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;

  int mental = await querySingleState(States.mental.index);
  int physical = await querySingleState(States.physical.index);
  int skill = await querySingleState(States.skill.index);
  int sense = await querySingleState(States.sense.index);
  int others = await querySingleState(States.others.index);
  int total = mental + physical + skill + sense + others + value;

  int id;

  final String sql = "UPDATE STATE SET "
      "total = '$total' "
      "WHERE year = '$year' AND month = '$month' AND day = '$day' ";

  Database db = await openDatabase(await createDatabase(databaseName));

  await db.transaction((txn) async {
    id = await txn.rawUpdate(sql);
  });
  print('$id: update finished');

  await db.close();
}

/// 更新单状态值
void updateSingleState(int tag, int value) async {
  // TODO: 枚举对应表
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;

  int id;

  final String sql = "UPDATE State SET "
      "'${states[tag]}' = '$value' "
      "WHERE year = '$year' AND month = '$month' AND day = '$day' ";

  Database db = await openDatabase(await createDatabase(databaseName));

  await db.transaction((txn) async {
    id = await txn.rawUpdate(sql);
  });
  print('$id: update finished');

  await updateTotalState();

  await db.close();
}

/// 查询总状态
Future<int> queryTotalState() async {
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;

  List<Map<String, dynamic>> results;
  int total = 0;

  final String sql = "SELECT * FROM STATE WHERE year = '$year' AND month = '$month' AND day = '$day'";

  Database db = await openDatabase(await createDatabase(databaseName));

  results = await db.rawQuery(sql);
  print(results);

  total = results[0]['total'];
  print('total: $total');

  await db.close();

  return total;
}

/// 查询单状态
Future<int> querySingleState(int tag) async {
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;

  List<Map<String, dynamic>> results;
  int single;

  final String sql = "SELECT * FROM STATE WHERE year = '$year' AND month = '$month' AND day = '$day'";

  Database db = await openDatabase(await createDatabase(databaseName));

  results = await db.rawQuery(sql);
  print(results);

  single = results[0]['${states[tag]}'];
  print('tag$tag: $single');

  await db.close();

  return single;
}

/// 查询全记录
Future<List<Map<String, dynamic>>> queryState() async {
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;

  List<Map<String, dynamic>> results;

  final String sql = "SELECT * FROM STATE WHERE year = '$year' AND month = '$month' AND day = '$day'";

  Database db = await openDatabase(await createDatabase(databaseName));

  results = await db.rawQuery(sql);
  print(results);

  await db.close();

  return results;
}