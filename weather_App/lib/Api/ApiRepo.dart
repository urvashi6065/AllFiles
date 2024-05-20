import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Screens/Home/Home_screen.dart';
import 'package:weather_app/Screens/Home/ModelClass.dart';
import 'package:weather_app/Screens/Home/second.dart';

class ApiClass {
  PostModal? object;

  Future loadApiData(String city,context) async {
    var data =await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=b6432a8a454847f6b9e84730240204&q=${city}&days=1&aqi=no&alerts=no'));
    print(data.body);
    print(data.statusCode);

      if(data.statusCode==200){
        var convert=jsonDecode(data.body);
        print(convert);
        object=PostModal.fromJson(convert);
      }
    return object;
  }
}
