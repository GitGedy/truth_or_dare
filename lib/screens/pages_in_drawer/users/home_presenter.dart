import 'package:truth_or_dare/database/database_hepler.dart';
import 'package:truth_or_dare/database/model/user.dart';

import 'dart:async';


abstract class HomeContract {
  void screenUpdate();
}

class HomePresenter {

  HomeContract _view;

  var db = new DatabaseHelper();

  HomePresenter(this._view);


  delete(User user) {
    var db = new DatabaseHelper();
    db.deleteUsers(user);
    updateScreen();
    
  }

  Future<List<User>> getUser() {
    return db.getUser();
  }

  updateScreen() {
    _view.screenUpdate();
    
    /*vcvhcbvncbcvbcvm*/ */

  }


}
