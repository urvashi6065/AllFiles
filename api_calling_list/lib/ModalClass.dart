class ModalClass{
  final int? userId;
  final int? id;
  final String? title;

  ModalClass({required this.userId,required this.id,required this.title});
  factory ModalClass.fromapi(Map map){
    return ModalClass(userId: map['userId'], id: map['id'], title: map['title']);
  }
}