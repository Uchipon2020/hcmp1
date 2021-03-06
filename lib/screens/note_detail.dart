import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/material/icon_button.dart' show IconButton;
import 'package:health_care_mania_prottype/models/note.dart';
import 'package:health_care_mania_prottype/utils/database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;
  String formatted;

  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  static var _priorities = ['定期健康診断', '人間ドック'];

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Note note;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController rEyeController = TextEditingController();
  TextEditingController lEyeController = TextEditingController();
  TextEditingController lBpController = TextEditingController();
  TextEditingController hBpController = TextEditingController();
  TextEditingController onTheDayController = TextEditingController();
  TextEditingController hR1000Controller = TextEditingController();
  TextEditingController hL1000Controller = TextEditingController();
  TextEditingController hR4000Controller = TextEditingController();
  TextEditingController hL4000Controller = TextEditingController();
  TextEditingController xRayController = TextEditingController();
  TextEditingController rBController = TextEditingController();
  TextEditingController hEmoController = TextEditingController();
  TextEditingController gOtController = TextEditingController();
  TextEditingController gPtController = TextEditingController();
  TextEditingController gTpController = TextEditingController();
  TextEditingController lDlController = TextEditingController();
  TextEditingController hDlController = TextEditingController();
  TextEditingController nFatController = TextEditingController();
  TextEditingController bGluController = TextEditingController();
  TextEditingController hA1cController = TextEditingController();
  TextEditingController eCgController = TextEditingController();
  TextEditingController urineController = TextEditingController();
  TextEditingController sugarController = TextEditingController();

  NoteDetailState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;

    heightController.text = note.height_1;
    weightController.text = note.weight_2;
    rEyeController.text = note.right_eye_4;
    lEyeController.text = note.left_eye_5;
    hR1000Controller.text = note.hearing_right_1000_6;
    hL1000Controller.text = note.hearing_left_1000_7;
    hR4000Controller.text = note.hearing_right_4000_8;
    hL4000Controller.text = note.hearing_left_4000_9;
    xRayController.text = note.x_ray_10;
    lBpController.text = note.low_blood_pressure_11;
    hBpController.text = note.high_blood_pressure_12;
    rBController.text = note.red_blood_13;
    hEmoController.text = note.hemoglobin_14;
    gOtController.text = note.got_15;
    gPtController.text = note.gpt_16;
    gTpController.text = note.gtp_17;
    lDlController.text = note.ldl_18;
    hDlController.text = note.hdl_19;
    nFatController.text = note.neutral_fat_20;
    bGluController.text = note.blood_glucose_21;
    hA1cController.text = note.hA1c_22;
    eCgController.text = note.ecg_23;
    onTheDayController.text = note.on_the_day_24;
    urineController.text = note.urine_25;
    sugarController.text = note.sugar_26;

    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: Scaffold(
        // GestureDetector(

        /*WillPopScope(
        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        },*/

        //前の画面に戻らせないプログラムwill pop Scopeらしいが、エラーjのラインが出て、効果もよくわからないため、保留

        appBar: AppBar(
          title: Text(appBarTitle),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Write some code to control things, when user press back button in AppBar
                moveToLastScreen();
              }),
        ),

        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // First element　定期健康診断か人間ドックかプルダウンで選ぶ

              ListTile(
                title: DropdownButton(
                    items: _priorities.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    style: textStyle,
                    value: getPriorityAsString(note.priority),
                    onChanged: (valueSelectedByUser) {
                      setState(() {
                        debugPrint('User selected $valueSelectedByUser');
                        updatePriorityAsInt(valueSelectedByUser);
                      });
                    }),
              ),

              // 8 Element　受診日
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: Icon(Icons.calendar_today_outlined),
                    ),
                    Expanded(
                      child: TextField(
                        controller: onTheDayController,
                        style: textStyle,
                        enabled: true,
                        onSubmitted: (value) {
                          debugPrint('calender_push');
                          updateOTD();
                        },
                        decoration: InputDecoration(
                            labelText: '受診日',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                  ],
                ),
              ),

              // Second Element　身長入力
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 2.5),
                child: TextField(
                  textAlign: TextAlign.right,
                  controller: heightController,
                  onChanged: (value) {
                    debugPrint('Something changed in Title Text Field');
                    updateHeight();
                  },
                  //style: textStyle,

                  decoration: InputDecoration(
                      labelText: '身長',
                      suffix: Text(' cm'),
                      icon: Icon(Icons.accessibility),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),

              // Third Element　体重入力
              Padding(
                padding: EdgeInsets.only(top: 2.5, bottom: 10.0),
                child: TextField(
                  controller: weightController,
                  textAlign: TextAlign.right,
                  onChanged: (value) {
                    debugPrint('Something changed in Description Text Field');
                    updateWeight();
                  },
                  decoration: InputDecoration(
                      labelText: '体重',
                      suffix: Text(' kg'),
                      icon: Icon(Icons.accessibility),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),

              //視力横並び表示-------------------
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // 3 Element　（右）視力入力
                      child: TextField(
                        controller: rEyeController,
                        /*onTap: () {
                          debugPrint('EYES');
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus &&
                              currentFocus.focusedChild != null) {
                            currentFocus.focusedChild.unfocus();
                          }
                          showPicker0();
                        },*/
                        onSubmitted: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateREye();
                        },
                        decoration: InputDecoration(
                          labelText: '右視力',
                          icon: Icon(Icons.remove_red_eye),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      // 5 Element　（左）視力入力
                      child: TextField(
                        controller: lEyeController,
                        /*onTap: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus &&
                              currentFocus.focusedChild != null) {
                            currentFocus.focusedChild.unfocus();
                          }
                          showPicker1();
                        },*/
                        onSubmitted: (value) {
                          debugPrint('Something changed in 視力 Text Field');
                          updateLEye();
                        },
                        decoration: InputDecoration(
                          labelText: '左視力',
                          icon: Icon(Icons.remove_red_eye),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //聴力1000Hz

              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 2.5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // 3 Element　聴力1000Hz　右
                      child: TextField(
                        controller: hR1000Controller,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateHearing_r_1000();
                        },
                        decoration: InputDecoration(
                          labelText: '右聴力1000',
                          icon: Icon(Icons.hearing),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      // 5 Element　聴力1000　左
                      child: TextField(
                        controller: hL1000Controller,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateHearing_l_1000();
                        },
                        decoration: InputDecoration(
                          labelText: '左聴力1000',
                          icon: Icon(Icons.hearing),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //聴力4000Hz

              Padding(
                padding: EdgeInsets.only(top: 2.5, bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // 3 Element　聴力4000Hz　右
                      child: TextField(
                        controller: hR4000Controller,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateHearing_r_4000();
                        },
                        decoration: InputDecoration(
                          labelText: '右聴力4000',
                          icon: Icon(Icons.hearing),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      // 5 Element　聴力4000　左
                      child: TextField(
                        controller: hL4000Controller,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateHearing_l_4000();
                        },
                        decoration: InputDecoration(
                          labelText: '左聴力4000',
                          icon: Icon(Icons.hearing),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //血圧横並び表示----------------
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // 6 Element　血圧（LOW）
                      child: TextField(
                        controller: lBpController,
                        textAlign: TextAlign.right,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateLBp();
                        },
                        decoration: InputDecoration(
                            labelText: '血圧Low',
                            suffix: Text(' mmHg'),
                            icon: Icon(Icons.arrow_downward),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      // 7 Element　血圧（High）
                      child: TextField(
                        controller: hBpController,
                        textAlign: TextAlign.right,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateHBp();
                        },
                        decoration: InputDecoration(
                            labelText: '血圧High',
                            suffix: Text(' mmHg'),
                            icon: Icon(Icons.arrow_upward),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                  ],
                ),
              ),

              // x線検査
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  controller: xRayController,
                  onChanged: (value) {
                    debugPrint('Something changed in Title Text Field');
                    updateXray();
                  },
                  decoration: InputDecoration(
                      labelText: 'レントゲン検査所見',
                      icon: Icon(Icons.content_paste),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),

              // 心電図検査

              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  controller: eCgController,
                  onChanged: (value) {
                    debugPrint('Something changed in Title Text Field');
                    updateEcg();
                  },
                  decoration: InputDecoration(
                      labelText: '心電図検査所見',
                      labelStyle: textStyle,
                      icon: Icon(Icons.accessibility),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),

              /*
                //赤血球数・血色素量----------------
                /
                 -------------------------------------- */
              Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 2.5),
                  child: Row(children: <Widget>[
                    Text('血液検査'),
                    Expanded(
                      child: Divider(
                        height: 40,
                        thickness: 3,
                        color: Colors.black,
                        indent: 16,
                        endIndent: 16,
                      ),
                    )
                  ])),

              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 2.5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // 6 Element　赤血球数
                      child: TextField(
                        controller: rBController,
                        textAlign: TextAlign.right,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateRedblood();
                        },
                        decoration: InputDecoration(
                            labelText: '赤血球数',
                            suffix: Text(' 万/μL'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      // 7 Element　血色素量
                      child: TextField(
                        controller: hEmoController,
                        textAlign: TextAlign.right,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateHemo();
                        },
                        decoration: InputDecoration(
                            labelText: '血色素量',
                            suffix: Text(' g/dL'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                  ],
                ),
              ),

              //肝機能検査　横並び３つ----------------
              Padding(
                padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // ＧＯＴ
                      child: TextField(
                        controller: gOtController,
                        textAlign: TextAlign.right,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateGot();
                        },
                        decoration: InputDecoration(
                            labelText: 'ＧＯＴ',
                            suffix: Text(' U/L'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      // ＧＰＴ
                      child: TextField(
                        controller: gPtController,
                        textAlign: TextAlign.right,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateGpt();
                        },
                        decoration: InputDecoration(
                            labelText: 'ＧＰＴ',
                            suffix: Text(' U/L'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      // ガンマ
                      child: TextField(
                        controller: gTpController,
                        textAlign: TextAlign.right,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateGtp();
                        },
                        decoration: InputDecoration(
                            labelText: 'ガンマGTP',
                            suffix: Text(' U/L'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                  ],
                ),
              ),

              //ＬＤＬとＨＤＬ----------------
              Padding(
                padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // LDL
                      child: TextField(
                        controller: lDlController,
                        textAlign: TextAlign.right,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateLdl();
                        },
                        decoration: InputDecoration(
                            labelText: 'ＬＤＬ',
                            suffix: Text(' mg/dL'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      // ＨＤＬ
                      child: TextField(
                        controller: hDlController,
                        textAlign: TextAlign.right,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateHdl();
                        },
                        decoration: InputDecoration(
                            labelText: 'ＨＤＬ',
                            suffix: Text(' mg/dL'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      // 中性脂肪
                      child: TextField(
                        controller: nFatController,
                        textAlign: TextAlign.right,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateNeutralfat();
                        },
                        decoration: InputDecoration(
                            labelText: '中性脂肪',
                            suffix: Text(' mg/dL'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                  ],
                ),
              ),

              //血糖検査

              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // 空腹時血糖
                      child: TextField(
                        controller: bGluController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.right,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateBloodglucose();
                        },
                        decoration: InputDecoration(
                          labelText: '空腹時血糖',
                          suffix: Text(' mg/dL'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      // A1c
                      child: TextField(
                        controller: hA1cController,
                        textAlign: TextAlign.right,
                        onChanged: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateHA1c();
                        },
                        decoration: InputDecoration(
                          labelText: 'hA1c',
                          suffix: Text(' %'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 2.5),
                  child: Row(children: <Widget>[
                    Text('尿検査'),
                    Expanded(
                      child: Divider(
                        height: 40,
                        thickness: 3,
                        color: Colors.black,
                        indent: 16,
                        endIndent: 16,
                      ),
                    )
                  ])),

              //尿検査
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 2.5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // 尿検査　蛋白　Urine
                      child: TextField(
                        controller: urineController,
                        textAlign: TextAlign.center,
                        /*onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          showPicker3();
                        },*/
                        onSubmitted: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateUrine();
                        },
                        decoration: InputDecoration(
                          labelText: '尿蛋白',
                          labelStyle: textStyle,
                          //suffix: Text(' mg/dL'),
                          //icon: Icon(Icons.hearing),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      // 尿検査　尿糖　sugar
                      child: TextField(
                        controller: sugarController,
                        textAlign: TextAlign.center,
                        /*onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          showPicker4();
                        },*/
                        onSubmitted: (value) {
                          debugPrint(
                              'Something changed in Description Text Field');
                          updateSugar();
                        },
                        decoration: InputDecoration(
                          labelText: '尿糖',
                          //suffix: Text(' mg/dL'),
                          //icon: Icon(Icons.hearing),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /* 5 Element　保存と削除　横並び表示
                *
                *
                * ---------------------------------------------- */
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint("Save button clicked");
                            _save();
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Delete',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint("Delete button clicked");
                            _delete();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Convert the String priority in the form of integer before saving it to Database
  void updatePriorityAsInt(String value) {
    switch (value) {
      case '定期健康診断':
        note.priority = 1;
        break;
      case '人間ドック':
        note.priority = 2;
        break;
    }
  }

  // Convert int priority to String priority and display it to user in DropDown
  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0]; // 'High'
        break;
      case 2:
        priority = _priorities[1]; // 'Low'
        break;
    }
    return priority;
  }

  // Update the title of Note object
  void updateHeight() {
    note.height_1 = heightController.text;
  }

  // Update the title of Note object
  void updateWeight() {
    note.weight_2 = weightController.text;
  }

  // Update the right_eyes of Note object
  void updateREye() {
    note.right_eye_4 = rEyeController.text;
  }

  // Update the left_eyes of Note object
  void updateLEye() {
    note.left_eye_5 = lEyeController.text;
  }

  void updateHearing_r_1000() {
    note.hearing_right_1000_6 = hR1000Controller.text;
  }

  void updateHearing_l_1000() {
    note.hearing_left_1000_7 = hL1000Controller.text;
  }

  void updateHearing_r_4000() {
    note.hearing_right_4000_8 = hR4000Controller.text;
  }

  void updateHearing_l_4000() {
    note.hearing_left_4000_9 = hL4000Controller.text;
  }

  void updateXray() {
    note.x_ray_10 = xRayController.text;
  }

  void updateRedblood() {
    note.red_blood_13 = rBController.text;
  }

  void updateHemo() {
    note.hemoglobin_14 = hEmoController.text;
  }

  void updateGot() {
    note.got_15 = gOtController.text;
  }

  void updateGpt() {
    note.gpt_16 = gPtController.text;
  }

  void updateGtp() {
    note.gtp_17 = gTpController.text;
  }

  void updateLdl() {
    note.ldl_18 = lDlController.text;
  }

  void updateHdl() {
    note.hdl_19 = hDlController.text;
  }

  void updateNeutralfat() {
    note.neutral_fat_20 = nFatController.text;
  }

  void updateBloodglucose() {
    note.blood_glucose_21 = bGluController.text;
  }

  void updateHA1c() {
    note.hA1c_22 = hA1cController.text;
  }

  void updateEcg() {
    note.ecg_23 = eCgController.text;
  }

  void updateUrine() {
    note.urine_25 = urineController.text;
  }

  void updateSugar() {
    note.sugar_26 = sugarController.text;
  }

  // Update the low_blood_pressure of Note object
  void updateLBp() {
    note.low_blood_pressure_11 = lBpController.text;
  }

  // Update the high_blood_pressure of Note object
  void updateHBp() {
    note.high_blood_pressure_12 = hBpController.text;
  }

  // Update the on_the_day of Note object
  void updateOTD() {
    note.on_the_day_24 = onTheDayController.text;
  }
/*
  void showPicker0() {
    final list = [
      '2.0',
      '1.5',
      '1.0',
      '0.9',
      '0.8',
      '0.7',
      '0.6',
      '0.5',
      '0.4',
      '0.3',
      '0.2',
      '0.1',
      '0.1以下',
      'A',
      'B',
      'C',
      'D'
    ];
    final _pickerItems = list.map((item) => Text(item)).toList();
    var selectedIndex = 5;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 230,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CupertinoPicker(
              itemExtent: 35,
              scrollController: FixedExtentScrollController(
                initialItem: 5,
              ),
              backgroundColor: Colors.white,
              children: _pickerItems,
              onSelectedItemChanged: (int index) {
                selectedIndex = index;
              },
            ),
          ),
        );
      },
    ).then((_) {
      if (selectedIndex != null) {
        note.right_eye = list[selectedIndex];
        setState(() => rEyeController.text = note.right_eye);
        rEyeController.value = TextEditingValue(text: list[selectedIndex]);
      }
    });
  }

  void showPicker1() {
    final list = [
      '2.0',
      '1.5',
      '1.0',
      '0.9',
      '0.8',
      '0.7',
      '0.6',
      '0.5',
      '0.4',
      '0.3',
      '0.2',
      '0.1',
      '0.1以下',
      'A',
      'B',
      'C',
      'D'
    ];
    final _pickerItems = list.map((item) => Text(item)).toList();
    var selectedIndex = 5;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 230,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CupertinoPicker(
              itemExtent: 35,
              scrollController: FixedExtentScrollController(
                initialItem: 5,
              ),
              backgroundColor: Colors.white,
              children: _pickerItems,
              onSelectedItemChanged: (int index) {
                selectedIndex = index;
              },
            ),
          ),
        );
      },
    ).then((_) {
      if (selectedIndex != null) {
        note.left_eye = list[selectedIndex].toString();
        setState(() => lEyeController.text = note.left_eye);
        lEyeController.value = TextEditingValue(text: list[selectedIndex]);
      }
    });
  }

  void showPicker3() {
    final list = [
      '  ',
      ' ＋ ',
      '　―　',
      '　±　',
    ];
    final _pickerItems = list.map((item) => Text(item)).toList();
    var selectedIndex = 5;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 230,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CupertinoPicker(
              itemExtent: 35,
              backgroundColor: Colors.white,
              children: _pickerItems,
              onSelectedItemChanged: (int index) {
                selectedIndex = index;
              },
            ),
          ),
        );
      },
    ).then((_) {
      if (selectedIndex != null) {
        note.urine = list[selectedIndex].toString();
        setState(() => urineController.text = note.urine);
        urineController.value = TextEditingValue(text: list[selectedIndex]);
      }
    });
  }

  void showPicker4() {
    final list = [
      '   ',
      ' ＋ ',
      '　―　',
      '　±　',
    ];
    final _pickerItems = list.map((item) => Text(item)).toList();
    var selectedIndex = 5;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 230,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CupertinoPicker(
              itemExtent: 35,
              backgroundColor: Colors.white,
              children: _pickerItems,
              onSelectedItemChanged: (int index) {
                selectedIndex = index;
              },
            ),
          ),
        );
      },
    ).then((_) {
      if (selectedIndex != null) {
        note.sugar = list[selectedIndex].toString();
        setState(() => sugarController.text = note.sugar);
        sugarController.value = TextEditingValue(text: list[selectedIndex]);
      }
    });
  }

 */

  Future<void> _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: new DateTime.now().add(new Duration(days: 720)));
    if (selected != null) {
      note.on_the_day_24 = DateFormat.yMMMd().format(selected);
      setState(() => onTheDayController.text = note.on_the_day_24);
      debugPrint('$onTheDayController.text');
    }
  }

  // Save data to database
  void _save() async {
    moveToLastScreen();

    note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (note.id != null) {
      // Case 1: Update operation
      result = await helper.updateNote(note);
    } else {
      // Case 2: Insert Operation
      result = await helper.insertNote(note);
    }

    if (result != 0) {
      // Success
      _showAlertDialog('状況', '保存完了！！');
    } else {
      // Failure
      _showAlertDialog('状況', '問題発生・保存されませんでした');
    }
  }

  void _delete() async {
    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
    // the detail page by pressing the FAB of NoteList page.
    if (note.id == null) {
      _showAlertDialog('状況', '削除データなし');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await helper.deleteNote(note.id);
    if (result != 0) {
      _showAlertDialog('状況', 'データ削除完了');
    } else {
      _showAlertDialog('状況', '問題発生・データ削除不可');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
