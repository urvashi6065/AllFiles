import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



bool isplaying=false;
  AudioPlayer audioPlayer=new AudioPlayer();
  Duration duration=new Duration();
Duration position=new Duration();




@override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 200,
          slider(),
        child: (isplaying==true)?IconButton(onPressed: (){
          setState(() {
            isplaying=false;
          });
        }, icon: Icon(Icons.pause_circle,size: 60,),):
        IconButton(onPressed: (){
          setState(() {
            isplaying=true;
          });
        }, icon: Icon(Icons.play_circle,size: 60,)),
      ),
    );
  }
  slider(){
    return Slider.adaptive(
        min: 0.0,







        
        max: duration.inSeconds.toDouble(),
        value: position.inSeconds.toDouble(), onChanged: (double value){
       setState(() {

       });
    });
  }
}
