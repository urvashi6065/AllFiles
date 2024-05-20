
import 'dart:convert';




import 'package:api_calling_list/ModalClass.dart';
import 'package:http/http.dart'as http;
class Api{

  ModalClass? object;
  List<ModalClass> listData=[];
  Future loadMultipleData() async {
    var data=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    print(data.body);
    var list=jsonDecode(data.body);
    print(list);

    for(var e in list){
      object=ModalClass.fromapi(e);
      listData.add(object!);
    }
    return listData;
  }
}