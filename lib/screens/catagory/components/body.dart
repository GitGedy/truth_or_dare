import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../drawer.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String Catagory_string = '';
  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StaggeredGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        _buildTile(
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(
                        // color: Colors.teal,
                        //shape: CircleBorder(),
                        child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset("assets/images/family.png"),
                    )),
                    Padding(padding: EdgeInsets.only(bottom: 5)),
                    Text('Family',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0)),
                  ]),
            ), onTap: () {
          gotoGame(String String_value) async {
            sharedPreferences = await SharedPreferences.getInstance();
            sharedPreferences.setString('catagory', String_value);
            sharedPreferences.commit();
            Navigator.pop(context);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => MainWidget()));
          }
        }),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                      // color: Colors.teal,
                      //shape: CircleBorder(),
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset("assets/images/friends.png"),
                  )),
                  Padding(padding: EdgeInsets.only(bottom: 5)),
                  Text('Friends',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0)),
                ]),
          ),
        ),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                      // color: Colors.teal,
                      //shape: CircleBorder(),
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset("assets/images/couples.png"),
                  )),
                  Padding(padding: EdgeInsets.only(bottom: 5)),
                  Text('Couples',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0)),
                ]),
          ),
        ),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                      // color: Colors.teal,
                      //shape: CircleBorder(),
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset("assets/images/kids.png"),
                  )),
                  Padding(padding: EdgeInsets.only(bottom: 5)),
                  Text('Kids',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0)),
                ]),
          ),
        ),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                      // color: Colors.teal,
                      //shape: CircleBorder(),
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset("assets/images/crazy.png"),
                  )),
                  Padding(padding: EdgeInsets.only(bottom: 5)),
                  Text('Crazy',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0)),
                ]),
          ),
        ),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                      // color: Colors.teal,
                      //shape: CircleBorder(),
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset("assets/images/office.png"),
                  )),
                  Padding(padding: EdgeInsets.only(bottom: 5)),
                  Text('Co Workers',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0)),
                ]),
          ),
        ),

        
      ],
      staggeredTiles: [
        //StaggeredTile.extent(2, 120.0),
        StaggeredTile.extent(1, 220.0),
        StaggeredTile.extent(1, 220.0),
        StaggeredTile.extent(1, 220.0),
        StaggeredTile.extent(1, 220.0),
        StaggeredTile.extent(1, 220.0),
        StaggeredTile.extent(1, 220.0),
      ],
    ));
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }
}
