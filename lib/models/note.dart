
class Note {
//OK
  int _id;
  String _height;
  String _weight;
  String _right_eye;
  String _left_eye;
  String _low_blood_pressure;
  String _high_blood_pressure;
  String _on_the_day;
  String _date;
  int _priority;

  Note(this._priority, [this._height, this._weight,this._right_eye,this._left_eye,
    this._low_blood_pressure,this._high_blood_pressure,this._on_the_day]);

  Note.withId(this._id, this._date, this._priority, [this._height, this._weight,
    this._right_eye,this._left_eye,this._low_blood_pressure,this._high_blood_pressure,this._on_the_day]);

  int get id => _id;

  String get height => _height;

  String get weight => _weight;

  String get right_eye => _right_eye;

  String get left_eye => _left_eye;

  String get low_blood_pressure => _low_blood_pressure;

  String get high_blood_pressure => _high_blood_pressure;

  String get on_the_day => _on_the_day;

  int get priority => _priority;

  String get date => _date;

  set height(String newHeight) {
    if (newHeight.length <= 255) {
      this._height = newHeight;
    }
  }

  set weight(String newWeight) {
    if (newWeight.length <= 255) {
      this._weight = newWeight;
    }
  }

  set right_eye(String newREye) {
    if (newREye.length <= 255) {
      this._right_eye = newREye;
    }
  }

  set left_eye(String newLEye) {
    if (newLEye.length <= 255) {
      this._left_eye = newLEye;
    }
  }

  set low_blood_pressuer(String newLBP) {
    if (newLBP.length <= 255) {
      this._low_blood_pressure = newLBP;
    }
  }

  set high_blood_pressuer(String newHBP) {
    if (newHBP.length <= 255) {
      this._high_blood_pressure = newHBP;
    }
  }

  set on_the_day(String newOTD) {
    if (newOTD.length <= 255) {
      this._on_the_day = newOTD;
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

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['height'] = _height;
    map['weight'] = _weight;
    map['right_eye'] = _right_eye;
    map['left_eye'] = _left_eye;
    map['low_blood_pressure'] = _low_blood_pressure;
    map['high_blood_pressure'] = _high_blood_pressure;
    map['on_the_day'] = _on_the_day;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._height = map['height'];
    this._weight = map['weight'];
    this._right_eye = map['right_eye'];
    this._left_eye = map['left_eye'];
    this._low_blood_pressure = map['low_blood_pressure'];
    this._high_blood_pressure =  map['high_blood_pressure'];
    this._on_the_day = map['on_the_day'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
}