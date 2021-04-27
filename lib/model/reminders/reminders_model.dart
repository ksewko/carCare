class Reminders {
  int _id;
  String _title;
  String _desc;
  String _date;
  int _priority, _color;

  Reminders(this._title, this._date, this._priority, this._color, [this._desc]);

  Reminders.withId(
      this._id, this._title, this._date, this._priority, this._color,
      [this._desc]);

  int get id => _id;

  String get title => _title;

  String get desc => _desc;

  int get priority => _priority;
  int get color => _color;
  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set desc(String newDesc) {
    if (newDesc.length <= 255) {
      this._desc = newDesc;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 3) {
      this._priority = newPriority;
    }
  }

  set color(int newColor) {
    if (newColor >= 0 && newColor <= 9) {
      this._color = newColor;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['desc'] = _desc;
    map['priority'] = _priority;
    map['color'] = _color;
    map['date'] = _date;

    return map;
  }

  // Extract a Note object from a Map object
  Reminders.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._desc = map['desc'];
    this._priority = map['priority'];
    this._color = map['color'];
    this._date = map['date'];
  }
}
