import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pageviewandbottomnavigationbaradvance/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro_Scareen extends StatefulWidget {
  const Intro_Scareen({Key? key}) : super(key: key);

  @override
  State<Intro_Scareen> createState() => _Intro_ScareenState();
}

class _Intro_ScareenState extends State<Intro_Scareen> {
  PageController pageController=PageController();
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intro Scareen'),
      ),
      body: Center(
        child: PageView(
          controller: pageController,
          onPageChanged: (value){
            setState(() {
              index=value;
            });
            print(value);
          },
          children: [
            Column(
              children: [
                Text('Page 1'),
                ElevatedButton(onPressed: (){
                  setState(() {
                    pageController.jumpToPage(index+1);
                  });
                }, child: Text('Next')),
              ],
            ),
            Column(
              children: [
                Text('Page 2'),
                ElevatedButton(onPressed: (){
                  pageController.jumpToPage(index+1);
                }, child: Text('Next')),
                ElevatedButton(onPressed: (){
                  pageController.jumpToPage(index-1);
                }, child: Text('Privious')),
              ],
            ),
            Column(
              children: [
                Text('Page 3'),
                ElevatedButton(onPressed: () async {
                  SharedPreferences SharedVar=await SharedPreferences.getInstance();
                  SharedVar.setBool('isIntro', true);
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MyHomePage(title: 'title')), (route) => false);
                }, child: Text('Next')),
                ElevatedButton(onPressed: (){
                  pageController.jumpToPage(index-1);
                }, child: Text('Privious')),

              ],
            ),
          ],
        ),
      ),
      // body: Align(
      //     alignment: Alignment.bottomRight,
      //     child: TextButton(onPressed: () async {
      //       SharedPreferences IntroVarShare=await SharedPreferences.getInstance();
      //       IntroVarShare.setBool('IsIntro', true);
      //       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MyHomePage(title: 'title')), (route) => false);
      //     }, child: Text('Next',style: TextStyle(fontSize: 25),))),
    );
  }
}
