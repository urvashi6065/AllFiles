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
      theme: ThemeData.dark(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Discover The',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            Text('Weather in Your City',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Image(image: AssetImage('assets/Wather_image/image1.png'),),
            ),
            Text('Get to Know Your Weather maps and'),
            Text('radar precipitaion forcast'),
            SizedBox(height: 150,),
            InkWell(
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xffD78D1F),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text('GET STARTED')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
