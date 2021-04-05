import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/users/add_user_dialog.dart';
import 'package:truth_or_dare/database/model/user.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/users/home_presenter.dart';

import '../../../constants.dart';


class UserList extends StatelessWidget {
  List<User> country;
  HomePresenter homePresenter;

  UserList(
    List<User> this.country,
    HomePresenter this.homePresenter, {
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
                        child: new Icon(Icons.person),
                        backgroundColor: Colors.white,
                      ),
                      new Expanded(
                        child: new Padding(
                          padding: EdgeInsets.all(15.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                               "Player Name: " + country[index].playerName ,
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
                               homePresenter.delete(country[index]);
                               homePresenter.updateScreen();
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
    homePresenter.updateScreen();
  }
  edit(User user, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddUserDialog().buildAboutDialog(context, this, true, user),
    );
    homePresenter.updateScreen();
  }

  String getShortName(User user) {
    String shortName = "";
    if (!user.playerName.isEmpty) {
      shortName = user.playerName.substring(0, 1) + ".";
    }

    return shortName;
  }
}
