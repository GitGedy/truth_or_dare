import 'package:truth_or_dare/database/database_hepler.dart';
import 'package:truth_or_dare/database/model/games.dart';

import 'dart:async';


abstract class GameContract {
  void screenUpdate();
}

class GamePresenter {

  GameContract _view;

  var db = new DatabaseHelper();

  GamePresenter(this._view);


  delete(Games games) {
    var db = new DatabaseHelper();
    db.deleteGames(games);
    updateScreen();
  }

  Future<List<Games>> getGames() {
    return db.getGames();
  }

  updateScreen() {
    _view.screenUpdate();

  }


}
