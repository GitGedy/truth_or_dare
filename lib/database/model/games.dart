class Games {

  int id;
  String _game;
  String _type;
  String _catagory;


  Games(this._game,this._type,this._catagory);

  Games.map(dynamic obj) {
    this._game = obj["game"];
    this._type = obj["type"];
    this._catagory = obj["catagory"];
    
  }

  String get game => _game;
  String get type => _type;
  String get catagory => _catagory;



  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["game"] = _game;
    map["type"] = _type;
    map["catagory"] = _catagory;
 

    return map;
  }

  void setGameId(int id) {
    this.id = id;
  }
}
