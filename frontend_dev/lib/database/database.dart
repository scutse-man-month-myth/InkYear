import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// 创建整个数据库
Future<String> createDatabase(String databaseName) async {
  String databasesPath = await getDatabasesPath();
  String path = join(databasesPath, databaseName);

  if(await Directory(dirname(path)).exists()) {
    print("$path has existed already!");
  }
  else {
    try {
      await Directory(dirname(path)).create(recursive: true);
      print("Create database $path successfully!");
    }
    catch (e) {
      print(e);
    }
  }

  return path;
}

/// 删除整个数据库
void deleteDB(String databaseName) async {
  deleteDatabase(await createDatabase(databaseName));
  print("Delete database successfully!");
}
