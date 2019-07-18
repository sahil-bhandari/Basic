class User {

  int id;
  String _firstName;
  String _lastName;
  String _profession;

  User(this._firstName, this._lastName, this._profession);

  User.map(dynamic obj) {
    this._firstName = obj["firstname"];
    this._lastName = obj["lastname"];
    this._profession = obj["profession"];
  }

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get profession => _profession;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["firstname"] = _firstName;
    map["lastname"] = _lastName;
    map["profession"] = _profession;

    return map;
  }

  void setUserId(int id) {
    this.id = id;
  }
}