import 'dart:async';

// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// // import 'package:flutter_boilerplate/models/user.dart';

// class Sqlite {
//   static const String _databaseName = 'database.db';
//   static const int _databaseVersion = 1;

//   late Database _db;
  
//   static String tableUser = "user";

//   static Future<Database> _initDatabase() async {
//     return openDatabase(
//       join(await getDatabasesPath(), _databaseName),
//       // When the database is first created, create a table to store dogs.
//       onCreate: (db, version) {
//         return db.execute(
//           "CREATE TABLE $tableUser(id INTEGER PRIMARY KEY, name TEXT, username TEXT, email TEXT));"
//         );
//       },
//       // Set the version. This executes the onCreate function and provides a
//       // path to perform database upgrades and downgrades.
//       version: _databaseVersion,
//     );
//   }

//   void initSqlite() async {
//     _db = await _initDatabase();
//   }

//   // Future<void> insertUser(User user) async {
//   //   await _db.insert(tableUser, user.toMap(),
//   //       conflictAlgorithm: ConflictAlgorithm.replace);
//   // }

//   Future<void> deleteUser() async {
//     await _db.delete(tableUser);
//   }
// }