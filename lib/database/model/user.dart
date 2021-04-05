class User {

  int id;
  String _playerName;


  User(this._playerName);

  User.map(dynamic obj) {
    this._playerName = obj["playername"];
    
  }

  String get playerName => _playerName;



  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["playername"] = _playerName;
 

    return map;
  }

  void setUserId(int id) {
    this.id = id;
  }
}
