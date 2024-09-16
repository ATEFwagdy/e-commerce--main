import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/shared/appColor.dart';
import 'package:e_commerce/shared/appPadding.dart';
import 'package:e_commerce/shared/appSized.dart';
import 'package:e_commerce/shared/appString.dart';
import 'package:e_commerce/shared/appStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../models/catgory_Model.dart';
import '../../servises/Api/catgorysApi.dart';
import '../itemPage.dart';
class FurniturCatgory extends StatefulWidget {
  const FurniturCatgory({super.key});
  @override
  State<FurniturCatgory> createState() => _FurniturCatgoryState();
}
class _FurniturCatgoryState extends State<FurniturCatgory> {
  bool isLoading = true;
  CatgoryModel? catgoryList;
  getMobileProducts() async {
  catgoryList = await CatgoryApi().getFurniture();
  setState(() {
    isLoading = false;
  });
}

  @override
  void initState() {
  getMobileProducts();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppString.furitureText,
          style:AppStyle.catgoryText2,
        ),
      ),
      body: isLoading
          ? Center(
          child: CircularProgressIndicator(color:AppColor.ButtonClick),
      )
          : ListView.builder(
           physics:BouncingScrollPhysics(),
           itemCount: catgoryList!.products!.length,
           itemBuilder: (context, i) {
           return InkWell(
             onTap:(){
               Navigator.of(context).push(MaterialPageRoute(builder:(context){
                 return ItemScreen(
                   img:"${catgoryList!.products![i].thumbnail}",
                   title:"${catgoryList!.products![i].title}",
                   des:"${catgoryList!.products![i].description}",
                   price:"${catgoryList!.products![i].price}",
                 );
               }));
             },
             child: Card(
              child: Row(
                children: [
                  CachedNetworkImage(
                    height: 150,
                    imageUrl: "${catgoryList!.products![i].thumbnail}",
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Row(
                          children:[
                            Expanded(
                              child: Text(
                                softWrap: true,
                                "${catgoryList!.products![i].title}",
                                style:AppStyle.catgoryTitle
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right:AppPadding.padding1),
                              child: Container(
                                width:40,
                                height:40,
                                decoration:BoxDecoration(
                                    color:AppColor.ButtonClick,
                                    borderRadius:BorderRadius.circular(10)
                                ),
                                child: IconButton(
                                  onPressed:(){},
                                  icon:Icon(
                                    Icons.add,
                                    color:AppColor.whiteColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          softWrap: true,
                          "${catgoryList!.products![i].description}",
                          style:AppStyle.catgoryDesc
                        ),
                        Row(
                          mainAxisSize:MainAxisSize.min,
                          children: [
                            Text(
                              softWrap: true,
                              "${catgoryList!.products![i].price}\$",
                              style:AppStyle.catgoryPrice
                            ),
                            SizedBox(
                              width:Appsized.sizedBox4,
                            ),
                            Expanded(
                              child: RatingBar.builder(
                                itemSize:30,
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount:3,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color:AppColor.ratingColor,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
                       ),
           );
        },
      ),
    );
  }
}
