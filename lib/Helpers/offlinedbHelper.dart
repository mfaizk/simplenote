import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class OfflinedbHelper extends ChangeNotifier {
  String title;
  String data;

  addTodo(String title, String data) async {
    var dbPath = await getDatabasesPath();
    String path = dbPath + "/todos";
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE TODOS(id INTEGER PRIMARY KEY AUTO_INCREMENT,title VARACHAR(100) NOT NULL,data VARCHAR(1000) NOT NULL)');
      },
    );
    await db.transaction((txn) async {
      await txn
          .rawInsert('INSERT INTO TODOS(title,data)VALUES($title,$data)')
          .then((value) => print(value));
    });
  }
}
