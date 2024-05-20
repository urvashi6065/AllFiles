import 'package:api_calling_list/api/ApiDart.dart';
import 'package:flutter/material.dart';

import 'ModalClass.dart';

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
List<ModalClass> listData=[];
bool isloading=false;

  @override
  void initState() {
    setState(() {
      isloading=true;
    });
    Api().loadMultipleData().then((value) {
      setState(() {
        listData=value;
        isloading=false;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api Calling List'),),
      body: (isloading==true)?CircularProgressIndicator():ListView.builder(
          itemCount: listData.length,
          itemBuilder: (context,index){
        return ListTile(
          leading: Text(listData[index].userId.toString()),
           subtitle: Text(listData[index].id.toString()),
           title: Text(listData[index].title!),
           // subtitle: Text(listData[index].id!.toString()),
        );
      })
    );
  }
}
