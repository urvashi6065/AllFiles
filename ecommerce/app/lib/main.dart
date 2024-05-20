import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
          "Rating bar",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.red.shade500,
      ),
      body: Center(
        child: RatingBar(
          itemCount: 5,
          initialRating: 0,
          minRating: 1,
          maxRating: 5,
          itemSize: 60,
          glow: true,tapOnlyMode: true,
          glowColor: Colors.black,
          glowRadius: 6,
          // allowHalfRating: true,
          direction: Axis.horizontal,
          ratingWidget: RatingWidget(
              full: Icon(
                CupertinoIcons.star_fill,
                color: Colors.red,
              ),
              half: Icon(
                CupertinoIcons.star,
                color: Colors.red,
              ),
              empty: Icon(
                CupertinoIcons.star_slash,
                color: Colors.red,
              )),
          onRatingUpdate: (value) {
            print(value);
          },
        ),
      ),
    );
  }
}
