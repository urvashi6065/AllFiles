import 'package:flutter/material.dart';
import 'package:pixabay/ApiCall.dart';

import 'ModelClass.dart';
import 'Screens/Categories.dart';
import 'Screens/Detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Categorie(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? categorie;
  const MyHomePage({super.key, required this.title, required this.categorie});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<ModelClass> listData=[];

@override
  void initState() {
    // TODO: implement initState
  ApiClass().loadPixabayApi(widget.categorie!).then((value) {
    setState(() {
      listData=value;
    });
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pixabay Data'),
      ),
      body: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (context,int index){
        return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Detail(image: listData[index].previewURL,)));
            },
            child: Image.network(listData[index].previewURL!));
      }),
    );
  }
}
