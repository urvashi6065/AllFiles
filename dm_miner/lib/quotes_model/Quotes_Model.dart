import 'dart:convert';
import 'dart:ui';

class QuotesCate {
  final int? cateId;
  final String? categories;
  final String? emoji;
  final Color? colors;
  final List<QuotesModel>? quotesModel;

  QuotesCate(
      {required this.cateId,
      required this.categories,
      required this.emoji,
      required this.quotesModel,
      required this.colors});

  factory QuotesCate.fromjson(Map map) {
    return QuotesCate(
      cateId: map['cateId'],
      categories: map['categories'],
      emoji: map['emoji'],
      quotesModel: List<QuotesModel>.from(
          map["Quotes"].map((x) => QuotesModel.fromjson(x))), colors: map['Colors'],
    );
  }
}

class QuotesModel {
  final String? quotes;
  final String? image;

  QuotesModel({required this.quotes, required this.image});

  factory QuotesModel.fromjson(Map map) {
    return QuotesModel(quotes: map['quotes'], image: map['image']);
  }
}
