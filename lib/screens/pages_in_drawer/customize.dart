import 'dart:io';

import 'package:flutter/material.dart';

import 'package:kf_drawer/kf_drawer.dart';
import 'package:truth_or_dare/database/model/games.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/customize/list.dart';

import 'customize/add_game_dialog.dart';
import 'customize/game_presenter.dart';

class Customize extends KFDrawerContent {
  Customize({
    Key key,
  });

  @override
  _CustomizeState createState() => _CustomizeState();
}

class _CustomizeState extends State<Customize> implements GameContract {
  GamePresenter gamePresenter;

  @override
  void initState() {
    super.initState();
    gamePresenter = new GamePresenter(this);
  }

  displayRecord() {
    setState(() {});
  }

  Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment =
        Platform.isIOS ? CrossAxisAlignment.center : CrossAxisAlignment.center;

    return new InkWell(
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: <Widget>[
            new Text(
              'Games Database',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _openAddGameDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddGameDialog().buildAboutDialog(context, this, false, null),
    );

    setState(() {});
  }

  List<Widget> _buildActions() {
    return <Widget>[
      new IconButton(
        icon: const Icon(
          Icons.group_add,
          color: Colors.white,
        ),
        onPressed: _openAddGameDialog,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // Action(),
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
                IconButton(
                  icon: const Icon(
                    Icons.group_add,
                    color: Colors.black,
                  ),
                  onPressed: _openAddGameDialog,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ],
            ),
            Expanded(
                child: FutureBuilder<List<Games>>(
              future: gamePresenter.getGames(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                var data = snapshot.data;
                return snapshot.hasData
                    ? new GameList(data, gamePresenter)
                    : new Center(child: new CircularProgressIndicator());
              },
            )),
          ],
        ),
      ),
    );
  }

  @override
  void screenUpdate() {
    // TODO: implement screenUpdate
  }
}


