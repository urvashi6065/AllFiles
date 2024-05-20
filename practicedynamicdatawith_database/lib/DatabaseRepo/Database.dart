import 'package:practicedynamicdatawith_database/StudentModel/ModelClass.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseRepo {
  //Create DataBase or Open DataBase Function....
  static Future createDb() async {
    return await openDatabase('StudentDb.db', version: 1,
        onCreate: (Database db, version) {
          return createTable(db);
        });
  }

  //Create Table Function....
  static Future createTable(Database db) {
    return db.execute(
        'create table Student(id Integer primary key autoincrement,name Text not null,course Text not null)');
  }

  //Data Insert Function....
  static Future insertData(nameController, courseController) async {
    Database db = await DataBaseRepo.createDb();
    var data = {'name': nameController, 'course': courseController};
    // print(data);
    int id = await db.insert('Student', data);
    print(id);
  }

  //Data Get Function....
  static Future getData() async {
    List<StudentModelClass> studentList = [];

    Database db = await DataBaseRepo.createDb();
    var data = await db.query('Student');
    for (var e in data) {
      studentList.add(StudentModelClass.fromjson(e));
    }
    return studentList;
  }

  //Delete Data Function....
  static Future deleteData(int id) async {
    Database db = await DataBaseRepo.createDb();
    db.delete('Student', where: "id=?", whereArgs: [id]);
  }

  //Update Data Function....
  static Future updateData(String name, String course, int id) async {
    Database db = await DataBaseRepo.createDb();
    var data = {'name': name, 'course': course};
    int id1 = await db.update('Student', data, where: "id=?", whereArgs: [id]);
    print(id1);
  }

  //Searching Data Function....
  static Future searchingData(int id) async {
    // List<StudentModelClass> studentList = [];
    StudentModelClass? object;
    Database db = await DataBaseRepo.createDb();
    var data =await db.query('Student',where: "id=?",whereArgs: [id]);
    print(data);
    object=StudentModelClass.fromjson(data.first);
    // for(var e in data){
    //   studentList.add(StudentModelClass.fromjson(e));
    //   print('For loop');
    // }
    return object;
  }
}
