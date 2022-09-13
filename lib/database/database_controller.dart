import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DataController {
  DataController._();


  late Database database;
  static DataController?  _instance;

  factory DataController(){
    return _instance??= DataController._();
  }
  Database get databases => database;

  Future<void> implementDatabase()async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'problem_db.sql');
    database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database database) {},
      onCreate: (Database database, int version) async {
        //TODO: Create tables (users, products, cart) USING SQL
        await database.execute('CREATE TABLE users ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT NOT NULL,'
            'mobile TEXT NOT NULL,'
            'password TEXT NOT NULL,'
            'identfcation TEXT ,'
            'telephone TEXT'
            ')');

        await database.execute('CREATE TABLE problems ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'title TEXT NOT NULL,'
            'description TEXT NOT NULL,'
            'state REAL NOT NULL,'
            'date REAL NOT NULL,'
            'city TEXT NOT NULL,'
            'user_id INTEGER,'
            'FOREIGN KEY (user_id) references users(id)'
            ')');

        await database.execute('CREATE TABLE admin ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT NOT NULL,'
            'mobile TEXT NOT NULL,'
            'password TEXT NOT NULL'
            ')');
      },
      onUpgrade: (Database database, int oldVersion, int newVersion) {},
      onDowngrade: (Database database, int oldVersion, int newVersion) {},
    );
  }
}