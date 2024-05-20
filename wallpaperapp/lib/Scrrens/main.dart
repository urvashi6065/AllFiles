import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../demo.dart';
import 'DetailScareen.dart';

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
        home: MyHomePage(
          title: 'd',
        ));
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Hello\nDiscover the Wather',
              style: TextStyle(fontSize: 20),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(CupertinoIcons.moon),
                  ),
                ],
              ),
            ),
          ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailScareen()));
                      },
                      child: Container(
                        height: 160,
                        width: 340,
                        decoration: BoxDecoration(
                            color: Color(0xff6959C4),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),

                  Center(
                    child: Container(
                      height: 160,
                      width: 340,
                      decoration: BoxDecoration(
                          color: Color(0xff6959C4),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Center(
      //         child: Row(
      //           children: [
      //             Container(
      //               height: 160,
      //               width: 340,
      //               decoration: BoxDecoration(
      //                   color: Color(0xff6959C4),
      //                   borderRadius: BorderRadius.circular(25)),
      //               child: Row(
      //                 children: [
      //                   Padding(
      //                     padding: const EdgeInsets.all(20.0),
      //                     child: Column(
      //                       children: [
      //                         Text('Palestine',style: TextStyle(fontSize: 17,color: Colors.white),),
      //                         Text('Gaza',style: TextStyle(fontSize: 17,color: Colors.white),),
      //                         SizedBox(height: 15,),
      //                         Text('Sunny',style: TextStyle(fontSize: 17,color: Colors.white),),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(height: 25,),
      //       Padding(
      //         padding: const EdgeInsets.all(10.0),
      //         child: Text('Around the world',style: TextStyle(fontSize: 17),),
      //       ),
      //       // SizedBox(height: 10,),
      //       Center(
      //         child: Container(
      //           height: 160,
      //           width: 340,
      //           decoration: BoxDecoration(
      //               color: Color(0xff6959C4),
      //               borderRadius: BorderRadius.circular(25)),
      //           child: Row(
      //             children: [
      //               Column(
      //                 children: [
      //                   Text('Palestine',style: TextStyle(fontSize: 17,color: Colors.white),),
      //                   Text('Gaza',style: TextStyle(fontSize: 17,color: Colors.white),),
      //                   SizedBox(height: 15,),
      //                   Text('Sunny',style: TextStyle(fontSize: 17,color: Colors.white),),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ), // body: Padding(
      //   padding: const EdgeInsets.all(15.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Center(
      //         child: Container(
      //           height: 160,
      //           width: 340,
      //           decoration: BoxDecoration(
      //             color: Color(0xff6959C4),
      //             borderRadius: BorderRadius.circular(25)
      //           ),
      //           child: Padding(
      //             padding: const EdgeInsets.all(20.0),
      //             child: Column(
      //               // mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text('Palestine',style: TextStyle(fontSize: 17,color: Colors.white),),
      //                 Text('Gaza',style: TextStyle(fontSize: 17,color: Colors.white),),
      //                 SizedBox(height: 15,),
      //                 Text('Sunny',style: TextStyle(fontSize: 17,color: Colors.white),),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       Text('')
      //     ],
      //   ),
      // ),
      // drawer: Drawer(),
    );
  }
}
