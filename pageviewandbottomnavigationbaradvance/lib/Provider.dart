
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class providerClass with ChangeNotifier{
  bool isTheme=false;

  providerClass(){
    getSharedThemeData();
  }

  set setTheme(value){
    isTheme=value;
    setSharedThemeData(value);
    notifyListeners();
  }
  get getTheme{
    return isTheme;
  }
  setSharedThemeData(value) async {
    SharedPreferences themeSharedVar=await SharedPreferences.getInstance();
    themeSharedVar.setBool('isTheme', value);
  }
  getSharedThemeData() async {
    SharedPreferences themeSharedVar=await SharedPreferences.getInstance();
    isTheme=themeSharedVar.getBool('isTheme')??false;
  }
}