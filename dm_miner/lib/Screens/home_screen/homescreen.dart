import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../jsonfunction/json.dart';
import '../../quotes_model/Quotes_Model.dart';
import '../quotes_detail/quotesdetail.dart';
import '../setting_screen/Setting_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<QuotesCate> quotesList = [];

  @override
  void initState() {
    JsonClass().jsonData().then((value) {
      setState(() {
        quotesList = value;
      });
    });
    super.initState();
  }

  List<Color> colorList = [
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.red.shade900,
    Colors.purpleAccent,
    Colors.pinkAccent.shade200
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Best Quotes & Status',
          style: TextStyle(fontFamily: "PoetsenOne-Regular"),
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SettingScreen()));
          }, icon: Icon(Icons.settings)),
        ],
      ),
      body: GridView.builder(
          itemCount: quotesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.6),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => QuoteDetail(
                            quoteName: quotesList[index].categories,
                            quoteModel: quotesList[index].quotesModel!,
                          )));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: colorList[index],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          quotesList[index].categories!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "PoetsenOne-Regular"),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                quotesList[index].emoji!,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
