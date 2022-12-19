import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:health_care_mania_prottype/models/model.dart';
import 'package:health_care_mania_prottype/screens/model_detai_screenl.dart';
import 'package:health_care_mania_prottype/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Model> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = <Model>[];
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('MY HEALTHCARE DATA'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(Model(1, ''), '新規登録');
        },
        tooltip: '新規登録',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    //TextStyle titleStyle = Theme.of(context).textTheme.subtitle1;
    //String type;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 5.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  getPriorityColor(this.noteList[position].priority),
              child: getPriorityIcon(this.noteList[position].priority),
            ),
            //title: Text('受診日 : ' + this.noteList[position].on_the_day_24),
            subtitle: Text('更新日' + this.noteList[position].date),

            trailing: GestureDetector(
              child: Icon(Icons.auto_stories, color: Colors.grey,),
              onTap: () {
                _delete(context, noteList[position]);
                debugPrint("ListTile Tapped");
                navigateToDetail(this.noteList[position],'参照・訂正');
              },
            ),

           onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail(this.noteList[position], '参照・訂正');
            },
          ),
        );
      },
    );
  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        //type = "定期健康診断";
        return Colors.green;
        break;
      case 2:
        //type = "人間ドック";
        return Colors.orange;
        break;
      case 3:
        return Colors.yellow;
        break;

      default:
        return Colors.amber;
    }
  }

  // Returns the priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;
      case 3:
        return Icon(Icons.keyboard_arrow_left);

      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  void _delete(BuildContext context, Model note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, '削除完了');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Model note, String height) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ItemDetail(note, height);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then(
            (database) {
              Future<List<Model>> noteListFuture = databaseHelper.getNoteList();
              noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
