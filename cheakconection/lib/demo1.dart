import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo1 extends StatefulWidget {
  const Demo1({Key? key}) : super(key: key);

  @override
  State<Demo1> createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Cheak Conection :'),
      ),
    );
  }
}
