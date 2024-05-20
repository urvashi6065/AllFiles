import 'dart:convert';

class ModelClass{
  final int id;
  final int userId;
  final String date;
  final List<Products> products;

  ModelClass({required this.id,required this.userId,required this.date,required this.products});
  
  factory ModelClass.fromjson(Map map){
    return ModelClass(id: map['id'], userId: map['userId'], date: map['date'], products: List<Products>.from(map['products'].map((x)=>Products.fromjson(x))));
  }
}

class Products{
  final int productId;
  final int quantity;

  Products({required this.productId, required this.quantity});
  
  factory Products.fromjson(Map map){
    return Products(productId: map['productId'], quantity: map['quantity']);
  }
}

class FavoriteModel{

}