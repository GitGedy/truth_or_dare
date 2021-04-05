import 'package:flutter/material.dart';
import 'package:truth_or_dare/screens/splash/components/body.dart';
import 'package:truth_or_dare/size_config.dart';



class SplashScreen extends StatefulWidget {

  static String routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}



