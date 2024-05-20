// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:weatherapp/Screen/Home_Screen/ModelClass.dart';
//
// class ApiClass {
//
//
//   Future loadApiData() async {
//     PostModal? object;
//     try {
//       http.Response data = await http.get(Uri.parse(
//           'https://api.weatherapi.com/v1/current.json?key=b6432a8a454847f6b9e84730240204&q=ahmedabad&aqi=no'));
//       print(data.body);
//       // if (data.statusCode == 200) {
//         var convert = jsonDecode(data.body);
//         object = PostModal.fromjson(convert);
//         print("convert");
//         print(convert);
//       // } else {
//       //   print('Loading procces');
//       // }
//       return object;
//     }  catch (e) {
//       // TODO
//       throw e;
//     }
//   }
// }

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Screen/Home_Screen/ModelClass.dart';

class ApiRepo {
  PostModal? pm;
  List<PostModal> postList=[];

  Future loadJsonData() async {
    http.Response res = await http
        .get(Uri.parse('https://api.weatherapi.com/v1/current.json?key=b6432a8a454847f6b9e84730240204&q=ahmedabad&aqi=no'));
    // print(res.body);

    var d = jsonDecode(res.body);
    // print(d);

    // for(var e in d){
    //   pm = PostModal.fromJson(e);
    //   postList.add(pm!);
    // }
    return postList;
  }
}