import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_api/models/ProductModel.dart';
import 'package:getx_api/services/ApiService.dart';

class ProductController extends GetxController{

  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;
@override
void onInit(){
  fetchProducts();
  super.onInit();
}

void fetchProducts () async {
  try{
isLoading(true);
 
 var products = await ApiService.fetchProducts();
 if(products != null){
   productList.assignAll(products);
 }
  }
  finally {
    isLoading(false);
  }

}

}