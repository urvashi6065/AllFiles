import 'dart:convert';

import 'package:demo/Modal_Class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  bool loading=false;

  ModalClass? object;

  loadJson() async {
    var data=await rootBundle.loadString('assets/jsonfile.json');
    print(data);

    var convt=jsonDecode(data);
    print(convt);

    object=ModalClass.formJson(convt);
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      loading=true;
    });
    loadJson().then((value){
      setState(() {
        loading=false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Practice',
      ),
    ),
      body: Center(
        child: (loading==true)?CircularProgressIndicator():Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(object!.id!.toString()),
            Text(object!.Name!),
            Text(object!.Course!),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          loadJson();
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
