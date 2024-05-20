import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixabay/main.dart';

class Categorie extends StatefulWidget {

  const Categorie({Key? key}) : super(key: key);

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<String> Categorieslist = [
    'backgrounds',
    'fashion',
    'nature',
    // 'science',
    // 'education',
    // 'feelings',
    // 'health',
    // 'people',
    // 'religion',
    // 'places',
    // 'animals',
    // 'industry',
    // 'computer',
    // 'food',
    // 'sports',
    // 'transportation',
    // 'travel',
    // 'buildings',
    // 'business',
    // 'music'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GridView.builder(
        itemCount: Categorieslist.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
          itemBuilder: (context,int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage(title: 'title', categorie: Categorieslist[index],)));
                },
                child: Text(Categorieslist[index],style: TextStyle(fontSize: 15),)),
          );
          }),
    );
  }
}
