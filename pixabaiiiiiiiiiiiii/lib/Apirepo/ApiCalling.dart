import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pixabaiiiiiiiiiiiii/Model/MdelClass.dart';

class ApiClass {

  HitModel? object;
  List<HitModel> hitList=[];
 Future loadApiData() async {
    var api =await http.get(Uri.parse(
        'https://pixabay.com/api/?key=43095640-0f6ff07b212d1f501db3ca643&q=yellow+flowers&image_type=photo&pretty=true'));
    print(api.body);
    var covert=jsonDecode(api.body)['hits'];
    print(covert);
    for(var e in covert){
      object=HitModel.fromjson(e);
      hitList.add(object!);
    }
    return hitList;
    // print('kjkhsjhjahd');
  }
}
