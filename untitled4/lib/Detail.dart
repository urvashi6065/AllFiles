import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/ModelClass.dart';

class Detail extends StatefulWidget {
  final List<Products> lists;
  const Detail({Key? key, required this.lists}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail'),),
      body: ListView.builder(
           itemCount: widget.lists.length,
          itemBuilder: (context,index){
        return Center(
          child: Column(
            children: [
              Text(widget.lists[index].productId.toString()),
              SizedBox(height: 20,),
              Text(widget.lists[index].quantity.toString())
            ],
          ),
        );
      }),
    );
  }
}
