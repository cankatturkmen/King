import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/utils/database_helper.dart';
import 'package:project/models/modes.dart';
import 'package:sqflite/sqflite.dart';

class NewGame extends StatefulWidget {
  @override
  _NewGameState createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  String player1;
  String player2;
  String player3;
  String player4;
  var formkey = GlobalKey<FormState>();
  List<Modes> allModes;
  DatabaseHelper databaseHelper;

  @override
  void initState() {
    super.initState();
    allModes = List<Modes>();
    databaseHelper = DatabaseHelper();
    databaseHelper.getGameModes().then((modeMapList) {
      for (Map readMap in modeMapList) {
        allModes.add(Modes.fromMap(readMap));
      }
      setState(() {});
    });
  }

  /*List<RadioListTile<int>> createModes() {
    List<RadioListTile<int>> modes = [];
    return allModes
        .map((modes) => RadioListTile<int>(
              value: modes.modeID,
              title: Text(modes.modeName),
            ))
        .toList();
  } */

  SharedPreferences mySharedPreferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
