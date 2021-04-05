import 'dart:async';
import 'dart:io' as io;

import 'package:flutter/widgets.dart';
import 'package:truth_or_dare/database/model/user.dart';
import 'package:truth_or_dare/database/model/games.dart';
import 'package:truth_or_dare/database/initial_data.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  String user_sql = '''
INSERT INTO User (
    playername
  ) VALUES (?)
''';


  String game_sql = '''
INSERT INTO Games (
    game,type,catagory
  ) VALUES (?,?,?)
''';

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }



  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, playername TEXT)");

    await db.execute(
        "CREATE TABLE Games(id INTEGER PRIMARY KEY, game TEXT, type TEXT, catagory TEXT)");

    user_data.forEach((element) async {
          await db.rawInsert(user_sql, [element['playername']]);
});

    game_data.forEach((element) async {
          await db.rawInsert(game_sql, [element['game'],element['type'],element['catagory']]);
});

  }

  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toMap());
    return res;
  }

    Future<int> saveGame(Games games) async {
    var dbClient = await db;
    int res = await dbClient.insert("Games", games.toMap());
    return res;
  }

  Future<List<User>> getUser() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    List<User> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user =
          new User(list[i]["playername"]);
      user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }


    Future<List<Games>> getGames() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Games');
    List<Games> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var games =
          new Games(list[i]["game"],list[i]["type"],list[i]["catagory"]);
      games.setGameId(list[i]["id"]);
      employees.add(games);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deleteUsers(User user) async {
    var dbClient = await db;

    int res =
        await dbClient.rawDelete('DELETE FROM User WHERE id = ?', [user.id]);
    return res;
  }


  Future<int> deleteGames(Games games) async {
    var dbClient = await db;

    int res =
        await dbClient.rawDelete('DELETE FROM Games WHERE id = ?', [games.id]);
    return res;
  }

  Future<bool> update(User user) async {
    var dbClient = await db;
    int res =   await dbClient.update("User", user.toMap(),
        where: "id = ?", whereArgs: <int>[user.id]);

    return res > 0 ? true : false;
  }

  Future<bool> updateGame(Games games) async {
    var dbClient = await db;
    int res =   await dbClient.update("Games", games.toMap(),
        where: "id = ?", whereArgs: <int>[games.id]);

    return res > 0 ? true : false;
  }

}
