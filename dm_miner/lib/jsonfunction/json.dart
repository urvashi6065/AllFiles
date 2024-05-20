import 'dart:convert';

import 'package:flutter/services.dart';

import '../quotes_model/Quotes_Model.dart';

class JsonClass{
  QuotesCate? object;
  List<QuotesCate> quotesList=[];
  Future jsonData() async {
    var data=await rootBundle.loadString('assets/jsonfile.json');
    print(data);
    var convert=jsonDecode(data);
    print(convert);
    for(var e in convert){
      object=QuotesCate.fromjson(e);
      quotesList.add(object!);
    }
    return quotesList;
  }
}