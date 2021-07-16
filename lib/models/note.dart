class Note {
  int _id;
  String _onTheDay;
  String _height;
  String _date;
  String _weight;
  String _bmi;
  String _right_eyes;
  String _left_eyes;
  String _blood_pressure_low;
  String _blood_pressure_high;
  String _urine;
  String _sugar;
  String _right_ear_1000;
  String _left_ear_1000;
  String _right_ear_4000;
  String _left_ear_4000;
  String _ecg;
  String _x_ray;
  int _priority;

  Note(this._onTheDay, this._date, this._priority,
      [this._height,
      this._weight,
      this._bmi,
      this._right_eyes,
      this._left_eyes,
      this._right_ear_1000,
      this._left_ear_1000,
      this._right_ear_4000,
      this._left_ear_4000,
      this._blood_pressure_low,
      this._blood_pressure_high,
      this._urine,
      this._sugar,
      this._ecg,
      this._x_ray]);

  Note.withId(this._id, this._onTheDay, this._date, this._priority,
      [this._height,
      this._weight,
      this._bmi,
      this._right_eyes,
      this._left_eyes,
      this._right_ear_1000,
      this._left_ear_1000,
      this._right_ear_4000,
      this._left_ear_4000,
      this._blood_pressure_low,
      this._blood_pressure_high,
      this._urine,
      this._sugar,
      this._ecg,
      this._x_ray]);

  int get id => _id;
  String get onTheDay => _onTheDay;
  String get height => _height;
  int get priority => _priority;
  String get date => _date;
  String get weight => _weight;
  String get bmi => _bmi;
  String get right_eyes => _right_eyes;
  String get left_eyes => _left_eyes;
  String get right_ear_1000 => _right_ear_1000;
  String get left_ear_1000 => _left_ear_1000;
  String get right_ear_4000 => _right_ear_4000;
  String get left_ear_4000 => _left_ear_4000;
  String get blood_pressure_low => _blood_pressure_low;
  String get blood_pressure_high => _blood_pressure_high;
  String get urine => _urine;
  String get sugar => _sugar;
  String get ecg => _ecg;
  String get x_ray => _x_ray;
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

  set weight(String newWeight) {
    if (newWeight.length <= 225) {
      this._weight = newWeight;
    }
  }

  set bmi(String newBmi) {
    if (newBmi.length <= 225) {
      this._bmi = newBmi;
    }
  }

  set right_eyes(String newRight_eye) {
    if (newRight_eye.length <= 225) {
      this._right_eyes = newRight_eye;
    }
  }

  set left_eyes(String newLeft_eyes) {
    if (newLeft_eyes.length <= 225) {
      this._left_eyes = newLeft_eyes;
    }
  }

  set right_ear_1000(String newRightEar1) {
    if (newRightEar1.length <= 225) {
      this._right_ear_1000 = newRightEar1;
    }
  }

  set left_ear_1000(String newLeftEar1) {
    if (newLeftEar1.length <= 255) {
      this._right_ear_1000 = newLeftEar1;
    }
  }

  set right_ear_4000(String newRightEar4) {
    if (newRightEar4.length <= 255) {
      this._right_ear_4000 = newRightEar4;
    }
  }

  set left_ear_4000(String newLeftEar4) {
    if (newLeftEar4.length <= 255) {
      this._left_ear_4000 = newLeftEar4;
    }
  }

  set blood_pressure_low(String newBlood_pressure_l) {
    if (newBlood_pressure_l.length <= 255) {
      this._blood_pressure_low = newBlood_pressure_l;
    }
  }

  set blood_pressure_hight(String newBlood_pressure_h) {
    if (newBlood_pressure_h.length <= 255) {
      this._blood_pressure_high = newBlood_pressure_h;
    }
  }

  set urine(String newUrine) {
    if (newUrine.length <= 255) {
      this._urie = newUrine;
    }
  }

  set sugar(String newSugar) {
    if (newSugar.length <= 255) {
      this._sugar = newSugar;
    }
  }

  set ecg(String newEcg) {
    if (newEcg.length <= 255) {
      this._ecg = newEcg;
    }
  }

  set x_ray(String newX_ray) {
    if (newX_ray.length <= 255) {
      this._x_ray = newX_ray;
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
    map['onTheDay'] = _onTheDay;
    map['height'] = _height;
    map['priority'] = _priority;
    map['date'] = _date;
    map['weight'] = _weight;
    map['bmi'] = _bmi;
    map['right_eyes'] = _right_eyes;
    map['left_eyes'] = _left_eyes;
    map['right_ear_1000'] = _right_ear_1000;
    map['left_ear_1000'] = _left_ear_1000;
    map['right_ear_4000'] = _right_ear_4000;
    map['left_ear_4000'] = _left_ear_4000;
    map['blood_pressure_low'] = _blood_pressure_low;
    map['blood_pressure_high'] = _blood_pressure_high;
    map['urine'] = _urine;
    map['sugar'] = _sugar;
    map['ecg'] = _ecg;
    map['x_ray'] = _x_ray;

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
    this._bmi = map['bmi'];
    this._right_eyes = map['right_eyes'];
    this._left_eyes = map['left_eyes'];
    this._right_ear_1000 = map['right_ear_1000'];
    this._left_ear_1000 = map['left_ear_1000'];
    this._right_ear_4000 = map['right_ear_4000'];
    this._left_ear_4000 = map['left_ear_4000'];
    this._blood_pressure_low = map['blood_pressure_low'];
    this._blood_pressure_high = map['blood_pressure_high'];
    this._urine = map['urine'];
    this._sugar = map['sugar'];
    this._ecg = map['ecg'];
    this._x_ray = map['x_ray'];

    return;
  }
}
