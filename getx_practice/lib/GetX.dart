import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/modelClass.dart';

class  ThemeController extends GetxController{

  // bool isSwitch=false;
  RxBool isSwitch=false.obs;
  List<ProductModel> productList = [
    ProductModel(productname: 'T-Shirt', price: 100),
    ProductModel(productname: 'Shirt', price: 200),
    ProductModel(productname: 'Jens', price: 300),
    ProductModel(productname: 'Drees', price: 400),
    ProductModel(productname: 'Saree', price: 500),
    ProductModel(productname: 'Top', price: 600),
  ];
  List<ProductModel> cartList=[];



  set setTheme(value){
    isSwitch.value=value;

    // update();
  }
  get getTheme{
    return isSwitch.value;
  }
  get getProductList{
    return productList;
  }

}