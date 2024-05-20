import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp2/main.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search AnyThing'),
      ),
      body: Center(
        child: TextFormField(
          controller: cityController,
          onFieldSubmitted: (value) {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                builder: (context) => MyHomePage(cityName: cityController.text)), (
                route) => false);
          },
          decoration: InputDecoration(
            hintText: "Enter City",
          ),
        ),
      ),

    );
  }
}
