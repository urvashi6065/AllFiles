import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jsonlist8/ModalClass.dart';

class ApiRespones {
  Hits? object;
  List<Hits> listData=[];

  Future loadJsonData(String categorie) async {
    var data = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=43095640-0f6ff07b212d1f501db3ca643&q=${categorie}&image_type=photo&pretty=true'));
    print(data.body);
    var convert = jsonDecode(data.body)['hits'];
    print(convert);
    for (var e in convert) {
      object=Hits.fromApi(e);
      listData.add(object!);
    }
     return listData;
  }
}
