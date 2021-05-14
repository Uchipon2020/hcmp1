import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:health_care_mania_prottype/models/note.dart';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;                // Singleton Database

  String noteTable = 'note_table';
  String colId = 'id';
  String colHeight = 'height';
  String colWeight = 'weight';
  String colWaist = 'waist';
  String colR_Eye  ='right_eye';
  String colL_Eye = 'left_eye';
  String colHearing_right_1000 = 'hearing_right_1000';
  String colHearing_left_1000 = 'hearing_left_1000';
  String colHearing_right_4000 = 'hearing_right_4000';
  String colHearing_left_4000 = 'hearing_left_4000';
  String colX_ray = 'x_ray';
  String colL_Bp = 'low_blood_pressure';
  String colH_Bp = 'high_blood_pressure';
  String colRed_blood = 'red_blood';
  String colHemoglobin = 'hemoglobin';
  String colGot = 'got';
  String colGpt = 'gpt';
  String colGtp = 'gtp';
  String colLdl = 'ldl';
  String colHdl = 'hdl';
  String colNeutral_fat = 'neutral_fat';
  String colBlood_glucose = 'blood_glucose';
  String colHA1c = 'hA1c';
  String colEcg = 'ecg';
  String colOn_the_day ='on_the_day';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colHeight TEXT, '
        ' $colWeight TEXT, $colR_Eye TEXT, $colL_Eye TEXT, $colHearing_right_1000 TExt, $colHearing_left_1000 Text,'
        ' $colHearing_right_4000 TEXT, $colHearing_left_4000 TEXT, $colX_ray TEXT, '
        ' $colL_Bp TEXT, $colH_Bp TEXT, $colRed_blood TEXT, $colHemoglobin TEXT,'
        ' $colGot TEXT, $colGpt TEXT, $colGtp TEXT, $colLdl TEXT, $colHdl TEXT, $colNeutral_fat TEXT, '
        ' $colBlood_glucose TEXT, $colHA1c TEXT, $colEcg TEXT, '
        ' $colOn_the_day TEXT, $colPriority INTEGER, $colDate TEXT)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  // Update Operation: Update a Note object and save it to database
  Future<int> updateNote(Note note) async {
    var db = await this.database;
    var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteNote(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

  // Get number of Note objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Note>> getNoteList() async {

    var noteMapList = await getNoteMapList(); // Get 'Map List' from database
    int count = noteMapList.length;         // Count the number of map entries in db table

    // ignore: deprecated_member_use
    List<Note> noteList = <Note>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }

}