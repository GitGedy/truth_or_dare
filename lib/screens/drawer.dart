import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:truth_or_dare/screens/catagory/catagory_screen.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/game.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/home.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/users/home_presenter.dart';
import "package:truth_or_dare/utils/class_builder.dart";
import 'package:flutter/cupertino.dart';

import 'package:truth_or_dare/screens/pages_in_drawer/about.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/customize.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/users.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constants.dart';

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget>
    with TickerProviderStateMixin, HomeContract {
  KFDrawerController _drawerController;

  int _lastTimeBackButtonWasTapped;
  static const exitTimeInMillis = 2000;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('Game'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text(
            'Play Game',
            style: headingStyle,
          ),
          icon: Icon(Icons.gamepad, color: Colors.white),
          page: Game(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Catagory',
            style: headingStyle,
          ),
          icon: Icon(Icons.merge_type, color: Colors.white),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Players',
            style: headingStyle,
          ),
          icon: Icon(Icons.person_add, color: Colors.white),
          page: ClassBuilder.fromString('Users'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Customize',
            style: headingStyle,
          ),
          icon: Icon(Icons.edit, color: Colors.white),
          page: Customize(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'About',
            style: headingStyle,
          ),
          icon: Icon(Icons.developer_mode, color: Colors.white),
          page: About(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: KFDrawer(
          controller: _drawerController,
          header: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              width: MediaQuery.of(context).size.width * 0.6,
              child: Image.asset(
                'assets/images/splash_1.png',
                alignment: Alignment.center,
              ),
            ),
          ),
          footer: KFDrawerItem(
            text: Text(
              'Exit',
              style: headingStyle,
            ),
            icon: Icon(
              Icons.close,
              color: Colors.red,
            ),
            onPressed: () {
              _onAlertButtonsPressed(context);
             
            },
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(255, 255, 255, 1.0),
                Color.fromRGBO(35, 85, 85, 1)
              ],
              tileMode: TileMode.repeated,
            ),
          ),
        ),
      ),
    );
  }

  _onAlertButtonsPressed(context) {
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
          color: Colors.red,
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
      title: "Do you want to leave?",
      //desc: "Flutter is more awesome with RFlutter Alert.",
      image: Image.asset("assets/images/logo.png"),
      buttons: [
        DialogButton(
          child: Text(
            "Yes!",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            Future.delayed(const Duration(milliseconds: 1000), () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            });
          },
          color: Colors.red,
        ),
        DialogButton(
          child: Text(
            "I STAY!",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0),
          ]),
        )
      ],
    ).show();
  }

  Future<bool> _onBackPressed() {
    _onAlertButtonsPressed(context);
  }





  @override
  void screenUpdate() {
    // TODO: implement screenUpdate
  }
}
