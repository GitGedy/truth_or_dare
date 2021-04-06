import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:truth_or_dare/constants.dart';

import 'dart:async';
import "dart:math";

import 'package:truth_or_dare/database/database_hepler.dart';
import 'package:truth_or_dare/database/initial_data.dart';
import 'package:truth_or_dare/database/model/games.dart';
import 'package:truth_or_dare/database/model/user.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/customize/list.dart';

class Game extends KFDrawerContent {
  Game({
    Key key,
  });

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  String playerRandom = '';
  String catagoryRandom = '';
  String typeRandom = '';
  String gameRandom = '';

  SharedPreferences sharedPreferences;

  DatabaseHelper dbHelper = DatabaseHelper();
  int count = 0;
  List<User> userList;
  List<Games> gameList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: profileView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, kPrimaryColor])),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 35),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text('TRUTH or DARE?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          )),
                    ),
                  ),
                ),
              ),
              NiceButton(
                radius: 15,
                width: 270,
                //background: Colors.red,
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 13),
                text: "Pick Player",
                icon: Icons.person,
                gradientColors: [kPrimary2, kPrimaryColor],
                onPressed: () async {
                  await updateListView();
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 60),
                child: Container(
                  height: 50,
                  width: 270,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(playerRandom,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              NiceButton(
                radius: 15,
                width: 270,
                //background: Colors.red,
                //padding: const EdgeInsets.all(15),
                text: "Play",
                icon: Icons.play_arrow,
                gradientColors: [(Colors.red), kPrimaryColor],
                onPressed: () {
                  _onPlayButtonsPressed(context);
                },
              ),
            ],
          ),
        ))
      ],
    );
  }

  void updateListView() {
    dbHelper.initDb();

    Future<List<User>> userListFuture = dbHelper.getUser();
    userListFuture.then((userList) {
      setState(() {
        this.userList = userList;
        this.count = userList.length;
      });
      final _random = new Random();

      setState(() {
        playerRandom = userList[_random.nextInt(userList.length)].playerName;
      });
    });
  }

  void updateGameView() {
    dbHelper.initDb();

    Future<List<Games>> gameListFuture = dbHelper.getGames();
    gameListFuture.then((gameList) {
      setState(() {
        this.gameList = gameList;
        this.count = gameList.length;
      });
      final _random = new Random();
      int x = _random.nextInt(gameList.length);
      setState(() {
        typeRandom = gameList[x].type;
        catagoryRandom = gameList[x].catagory;
        gameRandom = gameList[x].game;
        print('#########' + typeRandom + '###############');
        print('#########' + catagoryRandom + '###############');
        print('#########' + gameRandom + '###############');
      });
    });
  }

  _onPlayButtonsPressed(context) {
    var alertStyle = AlertStyle(
        animationType: AnimationType.fromTop,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        descStyle: TextStyle(fontWeight: FontWeight.bold),
        animationDuration: Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        titleStyle: TextStyle(
          color: kPrimaryColor,
          fontSize: 40,
        ),
        constraints: BoxConstraints.expand(width: 300),
        //First to chars "55" represents transparency of color
        overlayColor: Color(0x55000000),
        alertElevation: 0,
        alertAlignment: Alignment.center);

    Alert(
      context: context,
      style: alertStyle,
      //type: AlertType.warning,
      title: "Truth or Dare?",
      //desc: "Flutter is more awesome with RFlutter Alert.",
      image: Image.asset(
        "assets/images/logo.png",
        width: 85,
        height: 85,
      ),
      buttons: [
        DialogButton(
          child: Text(
            "TRUTH!",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            Navigator.pop(context);
            showLoaderDialog(context);
            pickGametype('Truth');
          },
          gradient: LinearGradient(colors: [
            (Colors.red),
            kPrimaryColor,
          ]),
        ),
        DialogButton(
          child: Text(
            "DARE!",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            Navigator.pop(context);
            showLoaderDialog(context);
            pickGametype('Dare');
          },
          gradient: LinearGradient(colors: [
            kPrimary2,
            kPrimaryColor,
          ]),
        )
      ],
    ).show();
  }

  _onPickTypeButtonsPressed(context) {
    var alertStyle = AlertStyle(
        animationType: AnimationType.fromBottom,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        descStyle: TextStyle(fontWeight: FontWeight.bold),
        animationDuration: Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        titleStyle: TextStyle(
          color: kPrimaryColor,
          fontSize: 25,
        ),
        constraints: BoxConstraints.expand(width: 300),
        //First to chars "55" represents transparency of color
        overlayColor: Color(0x55000000),
        alertElevation: 0,
        alertAlignment: Alignment.center);

    Alert(
      context: context,
      style: alertStyle,
      //type: AlertType.warning,
      title: gameRandom,
      //desc: "Flutter is more awesome with RFlutter Alert.",
      image: Image.asset(
        "assets/images/logo.png",
        width: 85,
        height: 85,
      ),
      buttons: [
        DialogButton(
          child: Text(
            "Done!",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            kPrimary2,
            kPrimaryColor,
          ]),
        )
      ],
    ).show();
  }

  pickGametype(String type_string) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('type', type_string);
    sharedPreferences.commit();
    String catagory_vv = sharedPreferences.getString("catagory");
    String type_vv = sharedPreferences.getString("type");

    print('***********' + catagory_vv.toString() + '*****************');
    print('***********' + type_vv.toString() + '*****************');

    int sec = 0;

    await Future.doWhile(() async {
      await Future.delayed(Duration(milliseconds: 500));
      sec += 1;
      if (catagoryRandom == catagory_vv && typeRandom == type_vv) {
        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('game', gameRandom);
        sharedPreferences.commit();
        Navigator.pop(context);
        _onPickTypeButtonsPressed(context);
        return false;
      }
      updateGameView();
      print("\n> elapsed $sec seconds");
      catagoryRandom = '';
      return true;
    }).timeout(Duration(seconds: 5)).then(print).catchError(print);

    print(">>> end test");
    catagoryRandom = '';
    typeRandom = '';
    return false;

    
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7),
              child: Text("Picking Game Random\nPlease Wait...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
