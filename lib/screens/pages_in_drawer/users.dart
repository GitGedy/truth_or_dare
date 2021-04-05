import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/users/add_user_dialog.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/users/home_presenter.dart';

import 'package:truth_or_dare/screens/pages_in_drawer/users/list.dart';
import 'package:truth_or_dare/database/model/user.dart';

import 'dart:io';

class Users extends KFDrawerContent {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> implements HomeContract {
  HomePresenter homePresenter;

  @override
  void initState() {
    super.initState();
    homePresenter = new HomePresenter(this);
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
              'User Database',
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

  Future _openAddUserDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddUserDialog().buildAboutDialog(context, this, false, null),
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
        onPressed: _openAddUserDialog,
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
                  onPressed: _openAddUserDialog,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.black,
                  ),
                  onPressed: (){
                    setState(() {
                      
                    });
                  },
                ),
              ],
            ),
            Expanded(
                child: FutureBuilder<List<User>>(
              future: homePresenter.getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                var data = snapshot.data;
                return snapshot.hasData
                    ? new UserList(data, homePresenter)
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
