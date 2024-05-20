import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import '../home_screen/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final LocalAuthentication bio = LocalAuthentication();
  // check_auth(){
  //   bool
  // }
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
