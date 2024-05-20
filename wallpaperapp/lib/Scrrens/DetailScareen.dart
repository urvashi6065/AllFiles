import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScareen extends StatefulWidget {
  const DetailScareen({Key? key}) : super(key: key);

  @override
  State<DetailScareen> createState() => _DetailScareenState();
}

class _DetailScareenState extends State<DetailScareen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: 45,
            decoration: BoxDecoration(
              color: Color(0xff6959C4),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Icon(CupertinoIcons.back,size: 25,color:Colors.white,),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 450,
            width: double.infinity,
            color: Colors.white,
            child: Center(
              child: Container(
                height: 350,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xff6959C4),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
