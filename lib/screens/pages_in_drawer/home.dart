import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truth_or_dare/screens/drawer.dart';

import '../../constants.dart';

class Home extends KFDrawerContent {
  Home({
    Key key,
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
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
            Text('Choose Game Catagory',
                style: TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold))
          ],
        ),
        Expanded(
            child: StaggeredGridView.count(
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
              gotoGame('Family');
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MainWidget()));
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
                ), onTap: () {
              gotoGame('Friends');
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MainWidget()));
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
                          child: Image.asset("assets/images/couples.png"),
                        )),
                        Padding(padding: EdgeInsets.only(bottom: 5)),
                        Text('Couples',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 24.0)),
                      ]),
                ), onTap: () {
              gotoGame('Couples');
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MainWidget()));
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
                          child: Image.asset("assets/images/kids.png"),
                        )),
                        Padding(padding: EdgeInsets.only(bottom: 5)),
                        Text('Kids',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 24.0)),
                      ]),
                ), onTap: () {
              gotoGame('Kids');
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MainWidget()));
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
                          child: Image.asset("assets/images/crazy.png"),
                        )),
                        Padding(padding: EdgeInsets.only(bottom: 5)),
                        Text('Crazy',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 24.0)),
                      ]),
                ), onTap: () {
              gotoGame('Crazy');
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MainWidget()));
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
                          child: Image.asset("assets/images/office.png"),
                        )),
                        Padding(padding: EdgeInsets.only(bottom: 5)),
                        Text('Co Workers',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 24.0)),
                      ]),
                ), onTap: () {
              gotoGame('Co Workers');
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MainWidget()));
            }),
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
        )),
      ],
    ));
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }

  gotoGame(String catagory_string) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('catagory', catagory_string);
    sharedPreferences.commit();
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => MainWidget()));
  }
}
