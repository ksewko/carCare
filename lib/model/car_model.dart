class CarRepair {
  // class properties
  int _id;
  String _title;
  String _actor;
  String _desc;
  int _releasedYear;

  // Constructor
  CarRepair(this._title, this._actor, this._releasedYear, [this._desc]);
  CarRepair.withId(this._id, this._title, this._actor, this._releasedYear,
      [this._desc]);

  // getters
  int get id => _id;
  String get title => _title;
  String get actor => _actor;
  String get description => _desc;
  int get releasedYear => _releasedYear;

  // setters
  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set actor(String newActor) {
    if (newActor.length <= 255) {
      _actor = newActor;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _desc = newDescription;
    }
  }

  set releasedYear(int newReleasedYear) => _releasedYear = newReleasedYear;

  Map<String, dynamic> toMap() {
    var movieMap = Map<String, dynamic>();
    movieMap['title'] = _title;
    movieMap['description'] = _desc;
    movieMap['actor'] = _actor;
    movieMap['releasedYear'] = _releasedYear;
    if (_id != null) {
      movieMap['id'] = _id;
    }
    return movieMap;
  }
}
