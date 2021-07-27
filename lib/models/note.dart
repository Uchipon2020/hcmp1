class Note {
//OK
  int _id;
  String _date; //更新日
  int _priority; //定期・ドッグフラグ
  String _1_height; //身長 *
  String _2_weight; //体重 *
  String _3_waist; //腹囲 *
  String _4_right_eye; //右視力 *
  String _5_left_eye; //左視力 *
  String _6_hearing_right_1000; //聴力右1000Hz *
  String _7_hearing_left_1000; // *
  String _8_hearing_right_4000; //*
  String _9_hearing_left_4000; //*
  String _10_x_ray; //レントゲン
  String _11_low_blood_pressure; //下血圧 *
  String _12_high_blood_pressure; //上血圧 *
  String _13_red_blood; //貧血検査・赤血球数 *
  String _14_hemoglobin; //貧血検査・血色素量 *
  String _15_got; //肝機能検査 *
  String _16_gpt; //肝機能検査 *
  String _17_gtp; //ガンマ  *
  String _18_ldl; //血中資質検査 *
  String _19_hdl; //*
  String _20_neutral_fat; //中性脂肪 *
  String _21_blood_glucose; //血統空腹時
  String _22_hA1c; //血統A1c
  String _23_ecg; //心電図
  String _24_on_the_day; //受診日
  String _25_urine; //尿蛋白
  String _26_sugar; //尿糖

  Note(
    this._priority, [
    this._1_height,
    this._2_weight,
    this._3_waist,
    this._4_right_eye,
    this._5_left_eye,
    this._6_hearing_right_1000,
    this._7_hearing_left_1000,
    this._8_hearing_right_4000,
    this._9_hearing_left_4000,
    this._10_x_ray,
    this._11_low_blood_pressure,
    this._12_high_blood_pressure,
    this._13_red_blood,
    this._14_hemoglobin,
    this._15_got,
    this._16_gpt,
    this._17_gtp,
    this._18_ldl,
    this._19_hdl,
    this._20_neutral_fat,
    this._21_blood_glucose,
    this._22_hA1c,
    this._23_ecg,
    this._24_on_the_day,
    this._25_urine,
    this._26_sugar,
  ]);

  Note.withId(
    this._id,
    this._date,
    this._priority, [
    this._1_height,
    this._2_weight,
    this._3_waist,
    this._4_right_eye,
    this._5_left_eye,
    this._6_hearing_right_1000,
    this._7_hearing_left_1000,
    this._8_hearing_right_4000,
    this._9_hearing_left_4000,
    this._10_x_ray,
    this._11_low_blood_pressure,
    this._12_high_blood_pressure,
    this._13_red_blood,
    this._14_hemoglobin,
    this._15_got,
    this._16_gpt,
    this._17_gtp,
    this._18_ldl,
    this._19_hdl,
    this._20_neutral_fat,
    this._21_blood_glucose,
    this._22_hA1c,
    this._23_ecg,
    this._24_on_the_day,
    this._25_urine,
    this._26_sugar,
  ]);

  int get id => _id;
  String get height_1 => _1_height;
  String get weight_2 => _2_weight;
  String get waist_3 => _3_waist;
  String get right_eye_4 => _4_right_eye;
  String get left_eye_5 => _5_left_eye;
  String get hearing_right_1000_6 => _6_hearing_right_1000;
  String get hearing_left_1000_7 => _7_hearing_left_1000;
  String get hearing_right_4000_8 => _8_hearing_right_4000;
  String get hearing_left_4000_9 => _9_hearing_left_4000;
  String get x_ray_10 => _10_x_ray;
  String get low_blood_pressure_11 => _11_low_blood_pressure;
  String get high_blood_pressure_12 => _12_high_blood_pressure;
  String get red_blood_13 => _13_red_blood;
  String get hemoglobin_14 => _14_hemoglobin;
  String get got_15 => _15_got;
  String get gpt_16 => _16_gpt;
  String get gtp_17 => _17_gtp;
  String get ldl_18 => _18_ldl;
  String get hdl_19 => _19_hdl;
  String get neutral_fat_20 => _20_neutral_fat;
  String get blood_glucose_21 => _21_blood_glucose;
  String get hA1c_22 => _22_hA1c;
  String get ecg_23 => _23_ecg;
  String get on_the_day_24 => _24_on_the_day;
  String get urine_25 => _25_urine;
  String get sugar_26 => _26_sugar;
  int get priority => _priority;
  String get date => _date;
  set height_1(String newHeight) {
    if (newHeight.length <= 255) {
      this._1_height = newHeight;
    }
  }

  set weight_2(String newWeight) {
    if (newWeight.length <= 255) {
      this._2_weight = newWeight;
    }
  }

  set waist_3(String newWaist) {
    if (newWaist.length <= 255) {
      this._3_waist = newWaist;
    }
  }

  set right_eye_4(String newREye) {
    if (newREye.length <= 255) {
      this._4_right_eye = newREye;
    }
  }

  set left_eye_5(String newLEye) {
    if (newLEye.length <= 255) {
      this._5_left_eye = newLEye;
    }
  }

  set hearing_right_1000_6(String newHearing_right_1000) {
    if (newHearing_right_1000.length <= 255) {
      this._6_hearing_right_1000 = newHearing_right_1000;
    }
  }

  set hearing_left_1000_7(String newHearing_left_1000) {
    if (newHearing_left_1000.length <= 255) {
      this._7_hearing_left_1000 = newHearing_left_1000;
    }
  }

  set hearing_right_4000_8(String newHearing_right_4000) {
    if (newHearing_right_4000.length <= 255) {
      this._8_hearing_right_4000 = newHearing_right_4000;
    }
  }

  set hearing_left_4000_9(String newHearing_left_4000) {
    if (newHearing_left_4000.length <= 255) {
      this._9_hearing_left_4000 = newHearing_left_4000;
    }
  }

  set x_ray_10(String newX_ray) {
    if (newX_ray.length <= 255) {
      this._10_x_ray = newX_ray;
    }
  }

  set low_blood_pressure_11(String newLBP) {
    if (newLBP.length <= 255) {
      this._11_low_blood_pressure = newLBP;
    }
  }

  set high_blood_pressure_12(String newHBP) {
    if (newHBP.length <= 255) {
      this._12_high_blood_pressure = newHBP;
    }
  }

  set red_blood_13(String newRed_blood) {
    if (newRed_blood.length <= 255) {
      this._13_red_blood = newRed_blood;
    }
  }

  set hemoglobin_14(String newHemoglobin) {
    if (newHemoglobin.length <= 255) {
      this._14_hemoglobin = newHemoglobin;
    }
  }

  set got_15(String newGot) {
    if (newGot.length <= 255) {
      this._15_got = newGot;
    }
  }

  set gpt_16(String newGpt) {
    if (newGpt.length <= 255) {
      this._16_gpt = newGpt;
    }
  }

  set gtp_17(String newGtp) {
    if (newGtp.length <= 255) {
      this._17_gtp = newGtp;
    }
  }

  set ldl_18(String newLdl) {
    if (newLdl.length <= 255) {
      this._18_ldl = newLdl;
    }
  }

  set hdl_19(String newHdl) {
    if (newHdl.length <= 255) {
      this._19_hdl = newHdl;
    }
  }

  set neutral_fat_20(String newNeutral_fat) {
    if (newNeutral_fat.length <= 255) {
      this._20_neutral_fat = newNeutral_fat;
    }
  }

  set blood_glucose_21(String newBlood_glucose) {
    if (newBlood_glucose.length <= 255) {
      this._21_blood_glucose = newBlood_glucose;
    }
  }

  set hA1c_22(String newHA1c) {
    if (newHA1c.length <= 255) {
      this._22_hA1c = newHA1c;
    }
  }

  set ecg_23(String newEcg) {
    if (newEcg.length <= 255) {
      this._23_ecg = newEcg;
    }
  }

  set on_the_day_24(String newOTD) {
    if (newOTD.length <= 255) {
      this._24_on_the_day = newOTD;
    }
  }

  set urine_25(String newUrine) {
    if (newUrine.length <= 255) {
      this._25_urine = newUrine;
    }
  }

  set sugar_26(String newSugar) {
    if (newSugar.length <= 255) {
      this._26_sugar = newSugar;
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
    map['height'] = _1_height;
    map['weight'] = _2_weight;
    map['right_eye'] = _4_right_eye;
    map['left_eye'] = _5_left_eye;
    map['hearing_right_1000'] = _6_hearing_right_1000;
    map['hearing_left_1000'] = _7_hearing_left_1000;
    map['hearing_right_4000'] = _8_hearing_right_4000;
    map['hearing_left_4000'] = _9_hearing_left_4000;
    map['x_ray'] = _10_x_ray;
    map['low_blood_pressure'] = _11_low_blood_pressure;
    map['high_blood_pressure'] = _12_high_blood_pressure;
    map['red_blood'] = _13_red_blood;
    map['hemoglobin'] = _14_hemoglobin;
    map['got'] = _15_got;
    map['gpt'] = _16_gpt;
    map['gtp'] = _17_gtp;
    map['ldl'] = _18_ldl;
    map['hdl'] = _19_hdl;
    map['neutral_fat'] = _20_neutral_fat;
    map['blood_glucose'] = _21_blood_glucose;
    map['hA1c'] = _22_hA1c;
    map['ecg'] = _23_ecg;
    map['on_the_day'] = _24_on_the_day;
    map['urine'] = _25_urine;
    map['sugar'] = _26_sugar;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._1_height = map['height'];
    this._2_weight = map['weight'];
    this._4_right_eye = map['right_eye'];
    this._5_left_eye = map['left_eye'];
    this._6_hearing_right_1000 = map['hearing_right_1000'];
    this._7_hearing_left_1000 = map['hearing_left_1000'];
    this._8_hearing_right_4000 = map['hearing_right_4000'];
    this._9_hearing_left_4000 = map['hearing_left_4000'];
    this._10_x_ray = map['x_ray'];
    this._11_low_blood_pressure = map['low_blood_pressure'];
    this._12_high_blood_pressure = map['high_blood_pressure'];
    this._13_red_blood = map['red_blood'];
    this._14_hemoglobin = map['hemoglobin'];
    this._15_got = map['got'];
    this._16_gpt = map['gpt'];
    this._17_gtp = map['gtp'];
    this._18_ldl = map['ldl'];
    this._19_hdl = map['hdl'];
    this._20_neutral_fat = map['neutral_fat'];
    this._21_blood_glucose = map['blood_glucose'];
    this._22_hA1c = map['hA1c'];
    this._23_ecg = map['ecg'];
    this._24_on_the_day = map['on_the_day'];
    this._25_urine = map['urine'];
    this._26_sugar = map['sugar'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
}
