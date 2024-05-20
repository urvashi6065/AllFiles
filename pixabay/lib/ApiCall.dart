import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pixabay/ModelClass.dart';

class ApiClass {
  ModelClass? object;
  List<ModelClass> listData=[];
  Future loadPixabayApi(String Categorie) async {
    var data =await http.get(Uri.parse(
        'https://pixabay.com/api/?key=43095640-0f6ff07b212d1f501db3ca643&q=${Categorie}&image_type=photo&pretty=true'));
    print(data.body);
    var covert=jsonDecode(data.body)['hits'];
    print(covert);
    for(var e in covert){
      object=ModelClass.fromapi(e);
      listData.add(object!);
    }
    return listData;
  }
}
