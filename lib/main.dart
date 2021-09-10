import 'package:flutter/material.dart';
import 'package:health_care_mania_prottype/screens/note_list.dart';
//import 'package:flutter_stetho/flutter_stetho.dart';

void main() {
 //Stetho.initialize();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Health Care Mania',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.orange
      ),
      home: NoteList(),
    );
  }
}