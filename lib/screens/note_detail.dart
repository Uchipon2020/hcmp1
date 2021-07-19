import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helth_care_mania_prottype/models/note.dart';
import 'package:helth_care_mania_prottype/utils/database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  static var _priorities = ['定期健康診断', '人間ドック'];

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle, bmi;
  Note note;
  DateTime _selectedDate;

  TextEditingController onTheDayController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController rightEyeController = TextEditingController();
  TextEditingController leftEyeController = TextEditingController();
  TextEditingController rightEar1Controller = TextEditingController();
  TextEditingController leftEar1Controller = TextEditingController();
  TextEditingController rightEar4Controller = TextEditingController();
  TextEditingController leftEar4Controller = TextEditingController();
  TextEditingController bloodLowController = TextEditingController();
  TextEditingController bloodHighController = TextEditingController();
  TextEditingController urineController = TextEditingController();
  TextEditingController sugarController = TextEditingController();
  TextEditingController ecgController = TextEditingController();
  TextEditingController x_rayController = TextEditingController();

  NoteDetailState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;

    onTheDayController.text = note.onTheDay;
    heightController.text = note.height;
    weightController.text = note.weight;
    rightEyeController.text = note.right_eyes;
    leftEyeController.text = note.left_eyes;

    return WillPopScope(
        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        },
        child: Scaffold(
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
                // First element
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

                // 受診日
                Padding(
                  padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                  child: TextField(
                    controller: onTheDayController,
                    focusNode: AlwaysDisableFocusNode(),
                    style: textStyle,
                    onTap: () {
                      _selectDate(context);
                    },
                    onChanged: (value) {
                      debugPrint('Something changed in 受信日 Text Field');
                      updateOnTheDay();
                    },
                    decoration: InputDecoration(
                        labelText: '受診日',
                        labelStyle: textStyle,
                        icon: Icon(Icons.accessibility),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),

                // 身長
                Padding(
                  padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                  child: TextField(
                    controller: heightController,
                    textAlign: TextAlign.right,
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in 身長 Text Field');
                      updateHeight();
                    },
                    decoration: InputDecoration(
                        labelText: '身長',
                        suffix: Text(' cm'),
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),

                // 体重
                Padding(
                  padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                  child: TextField(
                    controller: weightController,
                    textAlign: TextAlign.right,
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      debugPrint('Something changed in 身長 Text Field');
                      updateWeight();
                    },
                    decoration: InputDecoration(
                        labelText: '体重',
                        suffix: Text(' kg'),
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),

                //視力
                Padding(
                    padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                    child: Row(children: <Widget>[
                      Expanded(
                        child: TextField(
                          //enabled: false,
                          controller: rightEyeController,
                          style: TextStyle(),
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            showPicker1();
                          },
                          decoration: InputDecoration(
                            labelText: '視力・右',
                            icon: Icon(Icons.remove_red_eye),
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: 15.0,
                      ),
                      Expanded(
                        child: TextField(
                          //enabled: false,
                          controller: leftEyeController,
                          style: TextStyle(),
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            showPicker2();
                          },
                          decoration: InputDecoration(
                            labelText: '視力・左',
                            icon: Icon(Icons.remove_red_eye),
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ),
                    ])),

                // save & delete
                Padding(
                  padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          child: Text(
                            "Save",
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColorDark,
                            onPrimary: Colors.black,
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
                        child: ElevatedButton(
                          child: Text(
                            'Delete',
                            style: TextStyle(
                                color: Theme.of(context).primaryColorLight),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColorDark,
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
        ));
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
        priority = _priorities[0];
        break;
      case 2:
        priority = _priorities[1];
    }
    return priority;
  }

  // Update the onTheDay of Note object
  void updateOnTheDay() {
    note.onTheDay = onTheDayController.text;
  }

  // Update the height of Note object
  void updateHeight() {
    note.height = heightController.text;
  }

  //Update the Weight of Note object
  void updateWeight() {
    note.weight = weightController.text;
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
      _showAlertDialog('Status', 'Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem');
    }
  }

  void _delete() async {
    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
    // the detail page by pressing the FAB of NoteList page.
    if (note.id == null) {
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await helper.deleteNote(note.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Note Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Note');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.orange,
                onPrimary: Colors.black,
                surface: Colors.orange,
                onSurface: Colors.black,
              ),
            ),
            child: child,
          );
        });
    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      onTheDayController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: onTheDayController.text.length,
            affinity: TextAffinity.upstream));
      note.onTheDay = onTheDayController.text;
    }
  }

  //showPicker1
  void showPicker1() {
    final List list = Note.eyesData;
    final _pickerItems = list.map((item) => Text(item)).toList();
    var selectedIndex = 5;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 260,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CupertinoPicker(
              itemExtent: 40,
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
        note.right_eyes = list[selectedIndex];
        setState(() => rightEyeController.text = note.right_eyes);
      }
    });
  }

  //showPicker2
  void showPicker2() {
    final List list2 = Note.eyesData;
    final _pickerItems = list2.map((item) => Text(item)).toList();
    var selectedIndex = 5;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 260,
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
        note.left_eyes = list2[selectedIndex];
        setState(() => leftEyeController.text = note.left_eyes);
      }
    });
  }
}

class AlwaysDisableFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
