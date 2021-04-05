import 'package:flutter/material.dart';
import 'package:truth_or_dare/screens/drawer.dart';
import 'package:truth_or_dare/screens/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truth_or_dare/utils/class_builder.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  String splash='';
  SharedPreferences sharedPreferences;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  String splash='';
  String value;

  SharedPreferences sharedPreferences;

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    getStatus();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: value =='no'?SplashScreen():value =='yes'?MainWidget():SplashScreen(),
    );
  }

  getStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      splash = sharedPreferences.getString("splash");
      if (splash != null) {
        if (splash=='yes') {
          
          value = 'yes';

        }
        else {
          value = 'no';
        }
      }
      else {
          value = 'null';
        }
    });


  }

}

