import 'package:bhgvatgeeta/Screens/ApiLoad.dart';
import 'package:flutter/material.dart';

import 'ModelClass.dart';

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
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<JsonModel> list = [];

  @override
  void initState() {
    // TODO: implement initState

    JsonData().loadJsonData().then((value) {
      list = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.white),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'अधियायों की सुचि',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'अध्याय',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        toolbarHeight: 100,
      ),
      body: ListView.builder(
        itemCount: list.length,
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(list[index].adhiyay,style: TextStyle(fontSize: 20),),
            ],
          ),
        );
      })
      // drawer: Drawer(
      //   // child: ,
      //   surfaceTintColor: Colors.white,
      //   child: DrawerHeader(child: Image(image: AssetImage('assets/images/img.png')),
      //
      //   ),
      // ),
      // body: GridView.builder(
      //     gridDelegate:
      //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //     itemBuilder: (context, index) {
      //       return Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Stack(
      //           children: [
      //              Container(
      //               height: 300,
      //               width: 200,
      //               decoration: BoxDecoration(
      //                 color: Colors.red,
      //                 borderRadius: BorderRadius.circular(15),
      //                 image: DecorationImage(image: AssetImage('assets/images/img.png'))
      //               ),
      //             ),
      //             // Image(image: AssetImage())
      //           ],
      //
      //         ),
      //       );
      //     }),
      // body: ListView.builder(
      //     itemCount: 30,
      //     itemBuilder: (context,index){
      //       Container(
      //         height: 300,
      //         width: 200,
      //         color: Colors.red,
      //
      //       );
      //   // return ListTile(
      //   //   // leading: Text(list[index].shlok1[index].number[index].i),
      //   // );
      // }),
    );
  }
}
