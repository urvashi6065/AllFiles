import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp2/weather_model/Model.dart';

class ApiCallingClass {
  WeatherModel? object;
  Future loadApiData(city) async {
    var data = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=b6432a8a454847f6b9e84730240204&q=${city}&days=1&aqi=no&alerts=no'));
    print(data.body);
    var convert = jsonDecode(data.body);
    print(convert);
    object=WeatherModel.fromJson(convert);
    return object;
  }
}
