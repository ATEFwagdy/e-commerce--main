import 'package:dio/dio.dart';
import 'package:e_commerce/models/catgory_Model.dart';
class CatgoryApi{
CatgoryModel? catgoryLaptop;
CatgoryModel? catgoryMobile;
CatgoryModel? catgoryGrocery;
CatgoryModel? catgoryMan;
CatgoryModel? catgoryWoman;
CatgoryModel? catgorySunGlasses;
CatgoryModel? catgorySports;
CatgoryModel? catgoryMotocycle;
CatgoryModel? catgoryFurniture;
CatgoryModel? catgoryKitchen;
getLaptops()async{
 try{
   Response response = await Dio().get(
       "https://dummyjson.com/products/category/laptops",
       queryParameters:{
         "select" : "id,title,description,category,price,thumbnail"
       }
   );
   catgoryLaptop = CatgoryModel.fromJson(response.data);
   return catgoryLaptop;
 }catch(e){
   if(e is DioException){
     print(e.response);
   }
 }
}
getMobiles()async{
  try{
    Response response = await Dio().get(
        "https://dummyjson.com/products/category/smartphones",
        queryParameters:{
          "select" : "id,title,description,category,price,thumbnail"
        }
    );
    catgoryMobile = CatgoryModel.fromJson(response.data);
    return catgoryMobile;
  }catch(e){
    if(e is DioException){
      print(e.response);
    }
  }
}
getGrocerys()async{
  try{
    Response response = await Dio().get(
        "https://dummyjson.com/products/category/groceries",
        queryParameters:{
          "select" : "id,title,description,category,price,thumbnail"
        }
    );
    catgoryGrocery = CatgoryModel.fromJson(response.data);
    return catgoryGrocery;
  }catch(e){
    if(e is DioException){
      print(e.response);
    }
  }
}
getMans()async{
  try{
    Response response = await Dio().get(
        "https://dummyjson.com/products/category/mens-shirts",
        queryParameters:{
          "select" : "id,title,description,category,price,thumbnail"
        }
    );
    catgoryMan = CatgoryModel.fromJson(response.data);
    return catgoryMan;
  }catch(e){
    if(e is DioException){
      print(e.response);
    }
  }
}
getWomans()async{
  try{
    Response response = await Dio().get(
        "https://dummyjson.com/products/category/womens-dresses",
        queryParameters:{
          "select" : "id,title,description,category,price,thumbnail"
        }
    );
    catgoryWoman = CatgoryModel.fromJson(response.data);
    return catgoryWoman;
  }catch(e){
    if(e is DioException){
      print(e.response);
    }
  }
}
getSunGlasses()async{
  try{
    Response response = await Dio().get(
        "https://dummyjson.com/products/category/sunglasses",
        queryParameters:{
          "select" : "id,title,description,category,price,thumbnail"
        }
    );
    catgorySunGlasses = CatgoryModel.fromJson(response.data);
    return catgorySunGlasses;
  }catch(e){
    if(e is DioException){
      print(e.response);
    }
  }
}
getSportsTools()async{
  try{
    Response response = await Dio().get(
        "https://dummyjson.com/products/category/sports-accessories",
        queryParameters:{
          "select" : "id,title,description,category,price,thumbnail"
        }
    );
    catgorySports = CatgoryModel.fromJson(response.data);
    return catgorySports;
  }catch(e){
    if(e is DioException){
      print(e.response);
    }
  }
}
getMotocycle()async{
  try{
    Response response = await Dio().get(
        "https://dummyjson.com/products/category/motorcycle",
        queryParameters:{
          "select" : "id,title,description,category,price,thumbnail"
        }
    );
    catgoryMotocycle = CatgoryModel.fromJson(response.data);
    return catgoryMotocycle;
  }catch(e){
    if(e is DioException){
      print(e.response);
    }
  }
}
getFurniture()async{
  try{
    Response response = await Dio().get(
        "https://dummyjson.com/products/category/furniture",
        queryParameters:{
          "select" : "id,title,description,category,price,thumbnail"
        }
    );
    catgoryFurniture = CatgoryModel.fromJson(response.data);
    return catgoryFurniture;
  }catch(e){
    if(e is DioException){
      print(e.response);
    }
  }
}
getKitchen()async{
  try{
    Response response = await Dio().get(
        "https://dummyjson.com/products/category/kitchen-accessories",
        queryParameters:{
          "select" : "id,title,description,category,price,thumbnail"
        }
    );
    catgoryKitchen = CatgoryModel.fromJson(response.data);
    return catgoryKitchen;
  }catch(e){
    if(e is DioException){
      print(e.response);
    }
  }
}

}