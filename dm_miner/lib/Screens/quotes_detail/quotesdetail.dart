import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../quotes_model/Quotes_Model.dart';

class QuoteDetail extends StatefulWidget {
  final String? quoteName;
  final List<QuotesModel> quoteModel;

  const QuoteDetail(
      {Key? key, required this.quoteName, required this.quoteModel})
      : super(key: key);

  @override
  State<QuoteDetail> createState() => _QuoteDetailState();
}

class _QuoteDetailState extends State<QuoteDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(CupertinoIcons.back)),
          title: Text(
            widget.quoteName!,
            style: TextStyle(fontFamily: "PoetsenOne-Regular"),
          ),
        ),
        body: ListView.builder(
            itemCount: widget.quoteModel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 260,
                            width: 380,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color: Colors.red,
                                image: DecorationImage(
                                    image: AssetImage(
                                        widget.quoteModel[index].image!),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    widget.quoteModel[index].quotes!,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: "PoetsenOne-Regular",
                                        color: Colors.white,
                                        fontSize: 17),
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.heart)),
                              Text('Like'),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.download)),
                              Text('Save'),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.wallpaper)),
                              Text('Set as'),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.share)),
                              Text('Share'),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
