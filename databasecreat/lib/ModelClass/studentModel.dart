class StudentModel{
  final int id;
  final String name;
  final int age;
  final String course;

  StudentModel({required this.id,required this.name,required this.age,required this.course});

  factory StudentModel.fromjson(Map map){
    return StudentModel(id: map['id'], name: map['name'], age: map['age'], course: map['course']);
  }
}
