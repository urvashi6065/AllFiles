import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsonlist8/main.dart';

class categorie extends StatefulWidget {
  
  const categorie({Key? key}) : super(key: key);

  @override
  State<categorie> createState() => _categorieState();
}

class _categorieState extends State<categorie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('categorie'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage(categorie: "backgrounds",)));
                },
                child: Text('backgrounds')),
            SizedBox(height: 20,),
            InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage(categorie: 'food',)));
                },
                child: Text('food')),
          ],
        ),
      ),
    );
  }
}
