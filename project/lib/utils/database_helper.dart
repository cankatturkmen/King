import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:project/models/games.dart';
import 'package:project/models/players.dart';
import 'package:synchronized/synchronized.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  /* String _gamesTable = "games";
  String _gameID = "id";
  Players _player1 = "player1";
  Players _player2 = "player2";
  Players _player3 = "player3";
   Players _player4 = "player4"; */

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    } else {
      return _databaseHelper;
    }
  }

  DatabaseHelper._internal();

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  Future<Database> _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "appDB.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "proj.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
// open the database
    return await openDatabase(path, readOnly: false);
  }

  getGameModes() async {
    var db = await _getDatabase();
    var result = await db.query("Modes");
    print(result);
  }

  getGames() async {
    var db = await _getDatabase();
    var result = await db.query("Games");
    print(result);
  }

  Future<int> addPlayers(
    Players player1,
    Players player2,
    Players player3,
    Players player4,
  ) async {
    var db = await _getDatabase();

    Games newgame = new Games();
    newgame.gameDate = DateTime.now();
    var result = await db.insert('Games', newgame.toMap());

    player1.gameID = result;
    player2.gameID = result;
    player3.gameID = result;
    player4.gameID = result;
    await db.insert("Players", player1.toMap());
    await db.insert("Players", player2.toMap());
    await db.insert("Players", player3.toMap());
    await db.insert("Players", player4.toMap());
    return result;
  }

  Future<List<Map<String, dynamic>>> getPlayers() async {
    var db = await _getDatabase();
    var result = await db.query('Players', orderBy: 'playerID DESC');
    print(result);
    return result;
  }
}
