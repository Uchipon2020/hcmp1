import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_care_mania_prottype/models/note.dart';
import 'package:health_care_mania_prottype/screens/note_detail.dart';
import 'package:health_care_mania_prottype/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';


class NoteList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
//定義しただけ
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
//初回必ず発動。すべてのデータ読み込み
    if (noteList == null) {
      noteList = <Note>[];
      updateListView();// =>70
    }

    return Scaffold(

      appBar: AppBar(
        title: Text('MY HEALTHCARE DATA'),
      ),

      body: getNoteListView(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(Note(1,''), '新規登録');
        },

        tooltip: '新規登録',

        child: Icon(Icons.add),

      ),
    );
  }
//10
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
              backgroundColor: getPriorityColor(this.noteList[position].priority),
              child: getPriorityIcon(this.noteList[position].priority),
            ),

            title: Text('受診日 : ' + this.noteList[position].on_the_day),
            subtitle: Text('更新日' + this.noteList[position].date),

           trailing: GestureDetector(
              child: Icon(Icons.account_balance_wallet, color: Colors.grey,),
              onTap: () {
                //_delete(context, noteList[position]);
                debugPrint("ListTile Tapped");
                navigateToDetail(this.noteList[position],'参照・訂正');
              },
            ),

          onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail(this.noteList[position],'参照・訂正');
            },
          ),
        );
      },
    );
  }

  // 20 Return
  // s the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        //type = "定期";
        return Colors.red;
        break;
      case 2:
        //type = "その他";
        return Colors.yellow;
        break;

      default:
        return Colors.yellow;
    }
  }

  // 30 Returns the priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;

      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }
//40
  void _delete(BuildContext context, Note note) async {

    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, '削除完了');
      updateListView();
    }
  }
//50
  void _showSnackBar(BuildContext context, String message) {

    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
//60
  void navigateToDetail(Note note, String height) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, height);
    }));

    if (result == true) {
      updateListView();
    }
  }
//70
  void updateListView() {
// 配列の設定 dbFuture Databaseという型はいきなり使える？
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();

    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();

      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
