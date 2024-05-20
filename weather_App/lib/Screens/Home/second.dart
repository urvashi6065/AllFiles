import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Api/ApiRepo.dart';
import 'package:weather_app/Screens/Home/Home_screen.dart';
import 'package:weather_app/Screens/Home/ModelClass.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  TextEditingController cityController = TextEditingController();
  PostModal? object;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: 'City Name'),
            controller: cityController,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeScreen(cityName: cityController.text)),
                    (route) => false);
              },
              child: Text('Save'))
        ],
      ),
    );
  }
}
