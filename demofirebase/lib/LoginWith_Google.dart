import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WithGoogle extends StatefulWidget {
  const WithGoogle({Key? key}) : super(key: key);

  @override
  State<WithGoogle> createState() => _WithGoogleState();
}

class _WithGoogleState extends State<WithGoogle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in with google'),
      ),
    );
  }
}
