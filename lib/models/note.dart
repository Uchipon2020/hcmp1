
class Note {
//OK
  int _id;
  String _height;//身長 *
  String _weight;//体重 *
  String _waist;//腹囲 *
  String _right_eye;//右視力 *
  String _left_eye;//左視力 *
  String _hearing_right_1000;//聴力右1000Hz *
  String _hearing_left_1000;  // *
  String _hearing_right_4000; //*
  String _hearing_left_4000; //*
  String _x_ray;//レントゲン
  String _low_blood_pressure;//下血圧 *
  String _high_blood_pressure;//上血圧 *
  String _red_blood;//貧血検査・赤血球数 *
  String _hemoglobin;//貧血検査・血色素量 *
  String _got;//肝機能検査 *
  String _gpt;//肝機能検査 *
  String _gtp;//ガンマ  *
  String _ldl;//血中資質検査 *
  String _hdl; //*
  String _neutral_fat;//中性脂肪 *
  String _blood_glucose;//血統空腹時
  String _hA1c;//血統A1c
  String _ecg;//心電図
  String _on_the_day;//受診日
  String _date;//更新日
  int _priority;//定期・ドッグフラグ

  Note(this._priority, [this._height, this._weight, this._waist,
    this._right_eye, this._left_eye,
    this._hearing_right_1000, this._hearing_left_1000,
    this._hearing_right_4000, this._hearing_left_4000,
    this._x_ray,
    this._red_blood, this._hemoglobin,
    this._got, this._gpt, this._gtp, this._ldl, this._hdl, this._neutral_fat,
    this._blood_glucose, this._hA1c,
    this._ecg,
    this._low_blood_pressure,this._high_blood_pressure,this._on_the_day]);

  Note.withId(this._id, this._date, this._priority,[this._height, this._weight, this._waist,
    this._right_eye, this._left_eye,
    this._hearing_right_1000, this._hearing_left_1000,
    this._hearing_right_4000, this._hearing_left_4000,
    this._x_ray,
    this._red_blood, this._hemoglobin,
    this._got, this._gpt, this._gtp, this._ldl, this._hdl, this._neutral_fat,
    this._blood_glucose, this._hA1c,
    this._ecg,
    this._low_blood_pressure,this._high_blood_pressure,this._on_the_day]);

  int get id => _id;

  String get height => _height;

  String get weight => _weight;

  String get waist => _waist;

  String get right_eye => _right_eye;

  String get left_eye => _left_eye;

  String get hearing_right_1000 => _hearing_right_1000;

  String get hearing_left_1000 => _hearing_left_1000;

  String get hearing_right_4000 => _hearing_right_4000;

  String get hearing_left_4000 => _hearing_left_4000;

  String get x_ray => _x_ray;

  String get red_blood => _red_blood;

  String get hemoglobin => _hemoglobin;

  String get got => _got;

  String get gpt => _gpt;

  String get gtp => _gtp;

  String get ldl => _ldl;

  String get hdl => _hdl;

  String get neutral_fat => _neutral_fat;

  String get blood_glucose => _blood_glucose;

  String get hA1c => _hA1c;

  String get ecg => _ecg;

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

  set weist(String newWeist){
    if (newWeist.length <= 255){
      this._waist = newWeist;
    }
  }

  set hearing_right_1000(String newHearing_right_1000){
    if (newHearing_right_1000.length <=255){
      this._hearing_right_1000 = newHearing_right_1000;
    }
  }
  set hearing_left_1000(String newHearing_left_1000){
    if (newHearing_left_1000.length <=255){
      this._hearing_left_1000 = newHearing_left_1000;
    }
  }
  set hearing_right_4000(String newHearing_right_4000){
    if (newHearing_right_4000.length <=255){
      this._hearing_right_4000 = newHearing_right_4000;
    }
  }
  set hearing_left_4000(String newHearing_left_4000){
    if (newHearing_left_4000.length <=255){
      this._hearing_left_4000 = newHearing_left_4000;
    }
  }

  set x_ray(String newX_ray){
    if (newX_ray.length <= 255){
      this._x_ray = newX_ray;
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

  set red_blood(String newRed_blood){
    if (newRed_blood.length <= 255){
      this._red_blood = newRed_blood;
    }
  }

  set hemoglobin(String newHemoglobin){
    if(newHemoglobin.length <= 255){
      this._hemoglobin = newHemoglobin;
    }
  }

  set got(String newGot){
    if(newGot.length <=255){
      this._got = newGot;
    }
  }

  set gpt(String newGpt){
    if(newGpt.length  <= 255){
      this._gpt = newGpt;
    }
  }

  set gtp(String newGtp){
    if(newGtp.length <= 255){
      this._gtp = newGtp;
    }
  }

  set ldl(String newLdl){
    if(newLdl.length <= 255){
      this._ldl = newLdl;
    }
  }

  set hdl(String newHdl){
    if (newHdl.length <= 255){
      this._hdl = newHdl;
    }
  }

  set neutral_fat(String newNeutral_fat){
    if (newNeutral_fat.length <= 255){
      this._neutral_fat = newNeutral_fat;
    }
  }

  set blood_glucose(String newBlood_glucose){
    if (newBlood_glucose.length <= 255){
      this._blood_glucose = newBlood_glucose;
    }
  }

  set hA1c(String newHA1c){
    if (newHA1c.length <= 255){
      this._hA1c = newHA1c;
    }
  }

  set ecg(String newEcg){
    if (newEcg.length <= 255){
      this._ecg = newEcg;
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
    map['hearing_right_1000'] = _hearing_right_1000;
    map['hearing_left_1000'] = _hearing_left_1000;
    map['hearing_right_4000'] = _hearing_right_4000;
    map['hearing_left_4000'] = _hearing_left_4000;
    map['x_ray'] = _x_ray;
    map['low_blood_pressure'] = _low_blood_pressure;
    map['high_blood_pressure'] = _high_blood_pressure;
    map['red_blood'] = _red_blood;
    map['hemoglobin'] = _hemoglobin;
    map['got'] = _got;
    map['gpt'] = _gpt;
    map['gtp'] = _gtp;
    map['ldl'] = _ldl;
    map['hdl'] = _hdl;
    map['neutral_fat'] = _neutral_fat;
    map['blood_glucose'] = _blood_glucose;
    map['ecg'] = _ecg;
    map['hA1c'] = _hA1c;
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
    this._hearing_right_1000 = map['hearing_right_1000'];
    this._hearing_left_1000 = map['hearing_left_1000'];
    this._hearing_right_4000 = map['hearing_right_4000'];
    this._hearing_left_4000 = map['hearing_left_4000'];
    this._x_ray = map['x_ray'];
    this._red_blood = map['red_blood'];
    this._hemoglobin = map['hemoglobin'];
    this._got = map['got'];
    this._gpt = map['gpt'];
    this._gtp = map['gtp'];
    this._ldl = map['ldl'];
    this._hdl = map['hdl'];
    this._neutral_fat = map['neutral_fat'];
    this._blood_glucose = map['blood_glucose'];
    this._ecg = map['ecg'];
    this._hA1c = map['hA1c'];
    this._low_blood_pressure = map['low_blood_pressure'];
    this._high_blood_pressure =  map['high_blood_pressure'];
    this._on_the_day = map['on_the_day'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
}