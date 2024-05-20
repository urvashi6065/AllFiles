import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_p/modalClass.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      isloading=true;
    });
    loadJson().then((value) {
      setState(() {
        isloading=false;
      });
    });
    super.initState();
  }

  ModalClass? object;
  bool isloading=false;
 Future loadJson() async {
    var data=await rootBundle.loadString('assets/jsonFile.json');
    print(data);
    var convet=jsonDecode(data);
    print(convet);
    object=ModalClass.fromjson(convet);
  }

  Map<String,dynamic> mapData={
   'id':101,
    'name':'test'
  };
 List<Map<String,dynamic>> listDayta=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: (isloading==true)?CircularProgressIndicator():Column(
        children: [
          Text(object!.id!.toString()),
          // Text(object!.name!),
          Text(object!.username!),
          Text(object!.address!.geo!.lng!,style: TextStyle(fontSize: 50),),
          Text(object!.address!.geo!.lat!,style: TextStyle(fontSize: 50),),
          // Text(object!.course!),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        loadJson();
      },child: Icon(Icons.add),),
    );
  }
}
