import 'package:flutter/material.dart';

import 'package:truth_or_dare/screens/catagory/components/body.dart';
import 'package:truth_or_dare/size_config.dart';

import '../../constants.dart';
import 'package:kf_drawer/kf_drawer.dart';


class CatagoryPage extends KFDrawerContent {
  CatagoryPage({
    Key key,
  });

  @override
  _CatagoryPageState createState() => _CatagoryPageState();
}

class _CatagoryPageState extends State<CatagoryPage> {
  @override
  Widget build(BuildContext context) {
   /* SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>
          [
            Container
              (
              margin: EdgeInsets.only(right: 20.0),
              child: Row
                (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,size: 30,)
                ],
              ),
            )
          ],
        title: Text('Home', style: TextStyle(fontSize: 30),),
      backgroundColor: kPrimaryColor,),
      body: Body(),
    );*/

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Users'),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
