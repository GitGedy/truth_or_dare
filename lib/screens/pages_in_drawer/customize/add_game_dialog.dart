import 'dart:async';

import 'package:flutter/material.dart';
import 'package:truth_or_dare/database/database_hepler.dart';
import 'package:truth_or_dare/database/model/games.dart';
import 'package:truth_or_dare/database/model/user.dart';
//import 'package:truth_or_dare/database/model/games.dart';

class AddGameDialog {
  final teGame = TextEditingController();
  final teType = TextEditingController();
  final teCatagory = TextEditingController();

  Games games;

  static const TextStyle linkStyle = const TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  Widget buildAboutDialog(
      BuildContext context, _myHomePageState, bool isEdit, Games games) {
    if (games != null) {
      this.games = games;

      teGame.text = games.game;
      teType.text = games.type;
      teCatagory.text = games.catagory;
    }

    return new AlertDialog(
      title: new Text(isEdit ? 'Edit' : 'Add new Game'),
      content: new SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTextField("Enter Game Name", teGame),
            getTextField("Enter Game Type", teType),
            getTextField("Enter Game Catagory", teCatagory),
            new GestureDetector(
              onTap: () {
                addRecord(isEdit);
                _myHomePageState.displayRecord();
                Navigator.of(context).pop();
              },
              child: new Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: getAppBorderButton(isEdit ? "Update" : "Add",
                    EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    var loginBtn = new Padding(
      padding: const EdgeInsets.all(5.0),
      child: new TextFormField(
        controller: inputBoxController,
        decoration: new InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );

    return loginBtn;
  }

  Widget getAppBorderButton(String buttonLabel, EdgeInsets margin) {
    var loginBtn = new Container(
      margin: margin,
      padding: EdgeInsets.all(8.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        border: Border.all(color: const Color(0xFF28324E)),
        borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
      ),
      child: new Text(
        buttonLabel,
        style: new TextStyle(
          color: const Color(0xFF28324E),
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
    return loginBtn;
  }

  Future addRecord(bool isEdit) async {
    var db = new DatabaseHelper();
    var games = new Games(teGame.text, teType.text, teCatagory.text);

    if (isEdit) {
      games.setGameId(this.games.id);
      await db.updateGame(games);
    } else {
      await db.saveGame(games);
    }
  }
}


