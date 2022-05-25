import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/Controllers/ProductController.dart';
import 'package:getx_api/constants/Colors.dart';
import 'package:getx_api/constants/TextStrings.dart';
import 'package:http/http.dart' as http;
class ProductListView extends StatelessWidget {
final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(TextStrings.fetchApiData),centerTitle: true,),
      body: Obx((){
        if(productController.isLoading.value)
        return Center(child:CircularProgressIndicator());
        else
        return ListView.builder(itemCount: productController.productList.length, 
        itemBuilder: (context, index){
          return Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    margin: EdgeInsets.all(15),
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network('https://cdn.britannica.com/35/222035-050-C68AD682/makeup-cosmetics.jpg?q=60',
                    width: 150,
                    height: 100,
                    fit: BoxFit.fill,
                     // color: AppColor.geyColor,
                    //  colorBlendMode: BlendMode.color,
                      )
                      ),
                  ),
                  Flexible(child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productController.productList[index].name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text(productController.productList[index].brand, style: TextStyle(fontSize: 15, color: AppColor.tealColor),),
                      Text(productController.productList[index].description, style: TextStyle(fontSize: 15, ), maxLines: 4,)

                    ],
                  ))
                ],
              )
            ],
          );
        },);
      }),
      
    );
  }
}