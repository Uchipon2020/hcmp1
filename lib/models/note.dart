class Note {
  int _id;
  String _onTheDay;
  String _height;
  String _date;
  String _weight;
  int _priority;

  Note(this._onTheDay, this._date, this._priority,
      [this._height, this._weight]);

  Note.withId(this._id, this._onTheDay, this._date, this._priority,
      [this._height, this._weight]);

  int get id => _id;
  String get onTheDay => _onTheDay;
  String get height => _height;
  int get priority => _priority;
  String get date => _date;
  String get weight => _weight;

  set onTheDay(String newTitle) {
    if (newTitle.length <= 255) {
      this._onTheDay = newTitle;
    }
  }

  set height(String newDescription) {
    if (newDescription.length <= 255) {
      this._height = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  set weight(String newWeight) {
    this._weight = weight;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['onTheDay'] = _onTheDay;
    map['height'] = _height;
    map['priority'] = _priority;
    map['date'] = _date;
    map['weight'] = _weight;

    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._onTheDay = map['onTheDay'];
    this._height = map['height'];
    this._priority = map['priority'];
    this._date = map['date'];
    this._weight = map['weight'];
  }
}
