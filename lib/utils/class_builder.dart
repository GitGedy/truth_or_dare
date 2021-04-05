import 'package:truth_or_dare/screens/catagory/catagory_screen.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/about.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/customize.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/game.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/home.dart';
import 'package:truth_or_dare/screens/pages_in_drawer/users.dart';



typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<About>(() => About());
    register<Customize>(() => Customize());
    register<Users>(() => Users());
    //register<CatagoryPage>(() => CatagoryPage());
    register<Home>(() => Home());
    register<Game>(() => Game());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
