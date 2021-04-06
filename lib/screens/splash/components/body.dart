import 'package:flutter/material.dart';
import 'package:truth_or_dare/constants.dart';
import 'package:truth_or_dare/screens/catagory/catagory_screen.dart';
import 'package:truth_or_dare/size_config.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../drawer.dart';
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  SharedPreferences sharedPreferences;
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text":
          "This application is Truth or Dare game which is built based on Ethiopians Moral and Cultural Aspects.",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "Dare your friends to do something they afraid the most or ask them secret they hide from you.",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Spend your time with the family to collide the most.",
      "image": "assets/images/splash_5.png"
    },
    
    {
      "text": "Add your custom truth or dare questions.",
      "image": "assets/images/splash_4.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        gotoMain();
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  gotoMain() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('splash', 'yes');
    sharedPreferences.setString('catagory', 'Family');
    sharedPreferences.commit();
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => MainWidget()));
  }
}
