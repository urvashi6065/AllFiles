import 'package:flutter/material.dart';
import 'package:pageviewandbottomnavigationbaradvance/Model_Class.dart';
import 'package:pageviewandbottomnavigationbaradvance/Provider.dart';
import 'package:provider/provider.dart';

import 'Add_Contact.dart';
import 'Cart.dart';
import 'Home.dart';
import 'Intro_Scareen.dart';
import 'Keyboard.dart';
import 'Search.dart';
import 'SplashScareen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>providerClass())
      ],
      child: Consumer<providerClass>(
        builder: (context,consumerVar,child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: (consumerVar.getTheme==true)?ThemeData.dark(useMaterial3: true,):ThemeData(useMaterial3: true),
            home: Splash_Scareen(),
          );
        }
      ),
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
  int index1=0;
  List<Widget> screenList=[
    Home(),
    Search(),
    Cart(),
    KeyB(),
  ];

  @override
  Widget build(BuildContext context) {
    final providerVar=Provider.of<providerClass>(context,listen: true);
   return Scaffold(
     appBar: AppBar(
       actions: [
         Switch(value: providerVar.getTheme, onChanged: (value){
           providerVar.setTheme=value;
         })
       ],
     ),
     body: Center(
       child: screenList[index1],
     ),
     bottomNavigationBar: BottomNavigationBar(
       onTap: (value){
         setState(() {
           index1=value;
         });
       },
       currentIndex: index1,
       items: [
       BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Colors.red),
       BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search",backgroundColor: Colors.yellow),
       BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart_outlined),label: "Cart"),
       BottomNavigationBarItem(icon: Icon(Icons.keyboard_alt),label: "Keyboard"),
     ],
     ),
   );
  }
}
