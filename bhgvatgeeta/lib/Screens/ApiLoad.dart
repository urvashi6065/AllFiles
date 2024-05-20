

import 'dart:convert';

import 'package:bhgvatgeeta/Screens/ModelClass.dart';
import 'package:flutter/services.dart';

class JsonData{
  JsonCodec? object;
  List<JsonModel> list=[];
  Future loadJsonData() async {
    var data=await rootBundle.loadString('assets/jsonData.json');
    print(data);
    var convrt=jsonDecode(data);
    print(convrt);
    for(var e in convrt){
      object=JsonModel.fromJson(e);
      list.add(object!);
    }
    return list;
  }
}