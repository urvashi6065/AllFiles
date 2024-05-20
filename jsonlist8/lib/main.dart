import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsonlist8/Api/ApiRespones.dart';
import 'package:jsonlist8/ModalClass.dart';

import 'categorie.dart';

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
      home: categorie(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String categorie;


  const MyHomePage({
    super.key, required this.categorie,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Hits? object;
  List<Hits> listData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json List'),
      ),
      body: FutureBuilder(
        future: ApiRespones().loadJsonData(widget.categorie),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(snapshot.data[index].webformatURL),
                  );
                });
          }
        },
      ),
    );
  }
}

