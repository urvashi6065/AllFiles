import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ApiRepo/ApiCallFunction.dart';
import 'ModelClass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModal> pm = [];

  @override
  void initState() {
    // TODO: implement initState
    ApiRepo().loadJsonData().then((value) {
      pm = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        // itemCount: pm.length,
        itemBuilder: (context, index) {
          return Center(child: Text('hii'));
          // print(pm[index].location!.lon.toString());
        },
      ),
    );
  }
}
