import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

String databaseName = "InkYear";

// TODO:引导页进入按钮调用
Future<String> createDatabase(String databaseName) async {
  String databasesPath = await getDatabasesPath();
  String path = join(databasesPath, databaseName);

  if(await Directory(dirname(path)).exists()) {
    // ...
  }
  else {
    try {
      await Directory(dirname(path)).create(recursive: true);
    }
    catch (e) {
      print(e);
    }
  }

  print("Create database $path successfully!");
  return path;
}

// TODO:引导页进入按钮调用
void createTable(String table) async {
  final String sqlCreateTable = "CREATE TABLE '$table' (id INTEGER PRIMARY KEY, "
      "nickname TEXT, email TEXT, password TEXT)";

  Database db = await openDatabase(
    await createDatabase(databaseName),
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(sqlCreateTable);
    }
  );

  print("Create table $table successfully!");
  await db.close();
}

// TODO: 注册页面注册调用[增]
void addTuple(String nickname, String email, String password) async {
  int id;

  final String sqlAddTuple = "INSERT INTO USER(nickname, email, password) "
      "VALUES('$nickname', '$email', '$password')";

  Database db = await openDatabase(await createDatabase(databaseName));

  // TODO: 已有账户不添加
  await db.transaction((txn) async {
    id = await txn.rawInsert(sqlAddTuple);
  });
  print(id);

  await db.close();
}

// TODO:登录页面登录调用[查]
void queryTuple(String emailInput, String passwordInput) async {
  List<Map<String, dynamic>> results;
  String passwordStorage;
  String nickname;

  final String sqlQueryTuple = "SELECT * FROM User WHERE email = '$emailInput'";

  Database db = await openDatabase(await createDatabase(databaseName));

  results = await db.rawQuery(sqlQueryTuple);
  print(results);

  passwordStorage = results[0]["password"];
  print("passwordStorage: $passwordStorage");
  nickname = results[0]["nickname"];
  print("nickname: $nickname");
  // TODO:字符串相等判断
  if(passwordInput != passwordStorage)
    // TODO:提醒错误
    print("Password Not Correct!");
  else
    // TODO:提醒成功
    print("Welcome back, $nickname");

  await db.close();
}
