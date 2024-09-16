import 'package:dio/dio.dart';
import 'package:e_commerce/models/product_Model.dart';

class ProductApi{
  ProductModel? productModel;
  getProduct()async{
   try{
     Response  response  = await Dio().get(
         "https://dummyjson.com/products",
         queryParameters:{
           "select" : "id,title,description,category,price,thumbnail"
         }
     );
     productModel = ProductModel.fromJson(response.data);
     return productModel;
   }catch(e){
     if(e is DioException){
       print(e.response);
     }
   }
  }
}