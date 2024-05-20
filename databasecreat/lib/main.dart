import 'package:databasecreat/Database/DatabaseClass.dart';
import 'package:flutter/material.dart';

import 'ModelClass/studentModel.dart';

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
  List<StudentModel> studentList=[];

@override
  void initState() {
    // TODO: implement initState
  getData();
    super.initState();
  }

  getData(){
    DatabaseRepo.getRecord().then((value) {
      setState(() {
        studentList=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Darabase Create'),
     ),
     body: ListView.builder(
         itemCount: studentList.length,
         itemBuilder:(context,index){
       return Column(

         children: [
           Text(studentList[index].name)
         ],
       );
     }),
     floatingActionButton: FloatingActionButton(onPressed: () async {
      await DatabaseRepo.insertRecord();
        getData();
     },child: Icon(Icons.add),),
   );
  }
}
