import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/customize/add_game_dialog.dart';
import 'package:truth_or_dare/database/model/games.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/customize/game_presenter.dart';

import '../../../constants.dart';


class GameList extends StatelessWidget {
  List<Games> country;
  GamePresenter gamePresenter;

  GameList(
    List<Games> this.country,
    GamePresenter this.gamePresenter, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: country == null ? 0 : country.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            //color: Colors.redl
            child: new Container(
              color: kPrimaryColor,
                child: new Center(
                  child: new Row(
                    children: <Widget>[
                      new CircleAvatar(
                        radius: 30.0,
                        child: new Icon(Icons.games),
                        backgroundColor: Colors.white,
                      ),
                      new Expanded(
                        child: new Padding(
                          padding: EdgeInsets.all(15.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                               "Game Name: " + country[index].game ,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white),
                              ),

                              new Text(
                               "Game Type: " + country[index].type ,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white),
                              ),

                              new Text(
                               "Game Catagory: " + country[index].catagory ,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white),
                              ),
                             
                            ],
                          ),
                        ),
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                         new IconButton(
                              icon: const Icon(
                                Icons.edit,
                               color: Colors.white
                              ),
                              onPressed: () {
                                edit(country[index], context);
                                displayRecord();
                              },
                            ),

                          new IconButton(
                            icon: const Icon(Icons.delete_forever,
                                color: Colors.white),
                            onPressed: (){
                               gamePresenter.delete(country[index]);
                               gamePresenter.updateScreen();
                               displayRecord();
                            }
                               
                                
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0)),
          );
        });
  }

  displayRecord() {
    gamePresenter.updateScreen();
  }
  edit(Games games, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddGameDialog().buildAboutDialog(context, this, true, games),
    );
    gamePresenter.updateScreen();
  }

  String getShortName(Games games) {
    String shortName = "";
    if (!games.game.isEmpty) {
      shortName = games.game.substring(0, 1) + ".";
    }

    return shortName;
  }
}
