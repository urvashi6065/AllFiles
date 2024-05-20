import 'package:databasecreat/ModelClass/studentModel.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo {

  static Future createDb() async {
    return await openDatabase('studentDb.db', version: 1,
        onCreate: (Database db, version) {
      return createTable(db);
    });
  }

  static Future createTable(Database db) {
    return db.execute(
        'create table Student(id Integer primary key autoincrement,name Text not null,age Integer not null,course Text not null)');
  }

  static Future insertRecord() async {
    Database db = await DatabaseRepo.createDb();
    var data = {'name': "Urvashi", 'age': 18, 'course': "Flutter"};
    int id = await db.insert('Student', data);
    print(id);
  }
  static Future getRecord() async {
    List<StudentModel> studentList=[];
    StudentModel? object;

    Database db=await DatabaseRepo.createDb();
    var data=await db.query('Student');
    print(data);
    for(var e in data){
      object=StudentModel.fromjson(e);
      studentList.add(object);
    }
    return studentList;
  }
}
