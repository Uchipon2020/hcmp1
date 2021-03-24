import 'package:flutter/material.dart';
import 'package:helth_care_mania_prottype/screens/note_list.dart';
import 'package:helth_care_mania_prottype/screens/note_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'HelthcareMania',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple
      ),
      home: NoteList(),
    );
  }
}