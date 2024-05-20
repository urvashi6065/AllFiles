import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pageviewandbottomnavigationbaradvance/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Intro_Scareen.dart';

class Splash_Scareen extends StatefulWidget {
  const Splash_Scareen({Key? key}) : super(key: key);

  @override
  State<Splash_Scareen> createState() => _Splash_ScareenState();
}

class _Splash_ScareenState extends State<Splash_Scareen> {
  bool isintro=false;
  @override
  void initState() {
    // TODO: implement initState
     getDataIntro();
    Timer(Duration(seconds: 2), () {
      if(isintro==true){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MyHomePage(title: 'title')), (route) => false);
      }else{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Intro_Scareen()), (route) => false);
      }
    });

    super.initState();
  }
  getDataIntro() async {
    SharedPreferences IntroVarShare=await SharedPreferences.getInstance();
   isintro= IntroVarShare.getBool('isIntro')??false;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Scareen',style: TextStyle(fontSize: 40),),
      ),
    );
  }
}
