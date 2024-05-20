class StudentModelClass {
  final int id;
  final String name;
  final String course;

  StudentModelClass(
      {required this.id, required this.name, required this.course});

  factory StudentModelClass.fromjson(Map map) {
    return StudentModelClass(
        id: map['id'], name: map['name'], course: map['course']);
  }
}
