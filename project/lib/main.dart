import 'package:flutter/material.dart';
import 'package:project/models/modes.dart';
import 'package:project/menubutton.dart';
import 'package:project/models/players.dart';
import 'package:project/newgame.dart';
import 'package:project/settings.dart';
import 'package:project/utils/database_helper.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void main() {
  runApp(KingApp());
}

class KingApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var databaseHelper = DatabaseHelper();
    databaseHelper.getGameModes();
    databaseHelper.getPlayers();
    databaseHelper.getGames();

    return MaterialApp(
      debugShowCheckedModeBanner: false,


      title: 'King Yaz-Boz Change2.0',

      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "King Yaz Boz",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              MenuButtons(
                buttonText: "Yeni Oyun",
                textColor: Colors.white,
                butonColor: Colors.green,
                radius: 16,
                buttonIcon: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                onPressed: () {
                  enterPlayerNames(context);
                },
              ),
              MenuButtons(
                buttonText: "Son Oyun",
                textColor: Colors.white,
                butonColor: Colors.redAccent,
                radius: 16,
                onPressed: () {},
              ),
              MenuButtons(
                buttonText: "Eski Oyunlar",
                textColor: Colors.white,
                butonColor: Colors.teal,
                radius: 16,
                buttonIcon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              MenuButtons(
                buttonText: "Ayarlar",
                textColor: Colors.white,
                butonColor: Colors.grey,
                radius: 16,
                buttonIcon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
              ),
              MenuButtons(
                  buttonText: "Hakkimizda",
                  textColor: Colors.white,
                  butonColor: Colors.grey,
                  radius: 16,
                  buttonIcon: Icon(
                    Icons.book,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  })
            ],
          ),
        ));
  }

  void enterPlayerNames(BuildContext context) {
    DatabaseHelper databaseHelper = DatabaseHelper();
    String player1name;
    String player2name;
    String player3name;
    String player4name;
    var formkey = GlobalKey<FormState>();
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            contentPadding: EdgeInsets.all(25),
            title: Text(
              "Oyuncularin Adlarini Giriniz",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            children: <Widget>[
              Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        cursorColor: Colors.amberAccent,
                        onSaved: (context) {
                          player1name = context;
                        },
                        decoration: InputDecoration(
                            hoverColor: Colors.amber,
                            focusColor: Colors.amber,
                            labelText: "1. Oyuncu Ismi",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        validator: (player1name) {
                          if (player1name.length == 0) {
                            return "Lutfen bir isim giriniz";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          onSaved: (context) {
                            player2name = context;
                          },
                          decoration: InputDecoration(
                            labelText: "2. Oyuncu Ismi",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          validator: (player2name) {
                            if (player2name.length == 0) {
                              return "Lutfen bir isim giriniz";
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          onSaved: (context) {
                            player3name = context;
                          },
                          decoration: InputDecoration(
                            labelText: "3. Oyuncu Ismi",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          validator: (player3name) {
                            if (player3name.length == 0) {
                              return "Lutfen bir isim giriniz";
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          onSaved: (context) {
                            player4name = context;
                          },
                          decoration: InputDecoration(
                            labelText: "4. Oyuncu Ismi",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          validator: (player4name) {
                            if (player4name.length == 0) {
                              return "Lutfen bir isim giriniz";
                            }
                          }),
                    ),
                  ],
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  FloatingActionButton(
                      onPressed: () {
                        if (formkey.currentState.validate()) {
                          formkey.currentState.save();

                          databaseHelper.addPlayers(
                              Players(playerName: player1name, gameID: 1),
                              Players(playerName: player2name, gameID: 1),
                              Players(playerName: player3name, gameID: 1),
                              Players(playerName: player4name, gameID: 1));
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text("Oyun Olusturuldu"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewGame()),
                          );
                        }
                      },
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                ],
              )
            ],
          );
        });
  }
}
