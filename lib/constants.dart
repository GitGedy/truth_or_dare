import 'package:flutter/material.dart';
import 'package:truth_or_dare/size_config.dart';

//const kPrimaryColor = Color.fromRGBO(49, 39, 79, 30);
const kPrimaryColor = Color.fromRGBO(40, 92, 94, 10);
const kPrimary2 = Color.fromRGBO(29, 19, 59, 10);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color.fromRGBO(149, 39, 79, 30), Color.fromRGBO(49, 39, 79, 30)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(25),
  fontWeight: FontWeight.bold,
  color: Colors.white,
  height: 1.5,
);



