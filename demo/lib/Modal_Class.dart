class ModalClass{
  final int? id;
  final String? Name;
  final String? Course;

  ModalClass({required this.id, required this.Name, required this.Course});

  factory ModalClass.formJson(Map map){
    return ModalClass(id: map['id'], Name: map['Name'], Course: map['Course']);
  }

}