import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class scareen extends StatefulWidget {
  const scareen({Key? key}) : super(key: key);

  @override
  State<scareen> createState() => _scareenState();
}

class _scareenState extends State<scareen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arjuna Visada Yoga'),
      ),
    );
  }
}
