import 'package:dm_miner/Screens/provider/Provider_Screen.dart';
import 'package:dm_miner/jsonfunction/json.dart';
import 'package:dm_miner/quotes_model/Quotes_Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/home_screen/homescreen.dart';
import 'Screens/splash_screen/Splash_Screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ProviderClass())
      ],
      child: Consumer<ProviderClass>(
        builder: (context,consumerVar,child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: (consumerVar.isTheme==true)?ThemeData.dark(

              useMaterial3: true,
            ):ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home:SplashScreen()
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
        ),
      ),
    );
  }
}
