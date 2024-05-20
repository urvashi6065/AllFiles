import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled4/ModelClass.dart';

import 'Detail.dart';

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

  ModelClass? object;
  List<ModelClass> list=[];
   loadJsonData() async {
    var data=await rootBundle.loadString('asset/jsondemo.json');
    print(data);
    var convrt=jsonDecode(data);
    print(convrt);
    for(var e in convrt){
      object=ModelClass.fromjson(e);
      setState(() {
        list.add(object!);

      });
    }
  }


  @override
  void initState() {
    loadJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Detail(lists: list[index].products,)));
                        },
                          child: Text(list[index].date)),
                    ),
                  );
                }
          ),
    );
    }
}
