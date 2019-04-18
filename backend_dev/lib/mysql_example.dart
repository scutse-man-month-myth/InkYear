import 'dart:async';
import 'package:mysql1/mysql1.dart';

Future main() async {
  // Open a connection
  final conn = await MySqlConnection.connect(
    new ConnectionSettings(
        host: 'localhost', // host parameter
        port: 3306, // port parameter
        user: 'root', // user name
        db: 'testdb' // database name
    ),
  );

  // Create a table
  await conn.query(
    'CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), gender varchar(8))',
  );

  // Insert some data
  var insectResult = await conn.query( // return inserted id
    'insert into users (name, gender) values (?, ?)',
    ['LotteWong', 'female'],
  );

  // Query some data
  var queryResult = await conn.query( // return selected name and gender
    'select name, gender from users where id = ?',
    [insectResult.insertId],
  );
  queryResult.forEach((var row) => print('name: ${row[0]}, gender: ${row[1]}'));

  // Update some data
  conn.query(
    'alter table testdb add phone varchar(20)',
  );

  // Delete some data
  conn.query(
    'delete from testdb',
  );

  // Close the connection
  await conn.close();
}
