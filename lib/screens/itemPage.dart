import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/shared/appSized.dart';
import 'package:e_commerce/shared/appString.dart';
import 'package:e_commerce/shared/appStyle.dart';
import 'package:e_commerce/widgets/buildDividerContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../shared/appColor.dart';
import '../shared/appPadding.dart';
class ItemScreen extends StatefulWidget {
  final String img;
  final String title;
  final String des;
  final String price;
  const ItemScreen({super.key, required this.img, required this.title, required this.des, required this.price});
  @override
  State<ItemScreen> createState() => _ItemScreenState();
}
class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children:[
          Row(
           children:[
             Padding(
               padding: EdgeInsets.only(bottom:AppPadding.padding11),
               child:IconButton(
                 onPressed:(){
                   Navigator.of(context).pop();
                 },
                 icon:Icon(
                   Icons.arrow_back,
                   color:AppColor.blackColor,
                   size:28,
                 ),
               ),
             ),
             Column(
               children:[
                 Padding(
                   padding: const EdgeInsets.only(top:AppPadding.padding12),
                   child: Text(
                     AppString.itemText,
                     style:AppStyle.itemText,
                   ),
                 ),
                 CachedNetworkImage(
                   imageUrl:"${widget.img}",
                 ),
               ],
             ),
             Padding(
               padding:  EdgeInsets.only(bottom:AppPadding.padding11,left:AppPadding.padding3),
               child: Icon(
                 Icons.help_outline_outlined,
                 size:28,
               ),
             )
           ],
         ),
          SizedBox(
            height:Appsized.sizedBox2,
          ),
          Padding(
            padding: EdgeInsets.only(left:AppPadding.padding2),
            child: Text(
              "${widget.title}",
              style:AppStyle.itemText2
            ),
          ),
          SizedBox(
            height:Appsized.sizedBox2,
          ),
          Padding(
            padding: EdgeInsets.only(left:AppPadding.padding2),
            child: Text(
              AppString.itemText2,
              style:AppStyle.itemText3
            ),
          ),
          SizedBox(
            height:Appsized.sizedBox1,
          ),
          Padding(
            padding: EdgeInsets.only(left:AppPadding.padding2,right:AppPadding.padding2),
            child: Text(
              "${widget.des}",
              style:AppStyle.itemText4
            ),
          ),
          SizedBox(
            height:Appsized.sizedBox2,
          ),
          Padding(
            padding: EdgeInsets.only(right:AppPadding.padding3,left:AppPadding.padding3),
            child: BuildDividerContainer(),
          ),
          SizedBox(
            height:Appsized.sizedBox3,
          ),
          Padding(
            padding: EdgeInsets.only(left:AppPadding.padding2),
            child: Text(
              AppString.itemText3,
              style:AppStyle.itemText3
            ),
          ),
          SizedBox(
            height:Appsized.sizedBox2,
          ),
          Padding(
            padding: EdgeInsets.only(right:AppPadding.padding3,left:AppPadding.padding2),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children:[
                Text(
                  "${widget.price}\$",
                  style:AppStyle.itemText2,
                ),
                RatingBar.builder(
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
              ],
            ),
          ),
          SizedBox(
            height:Appsized.sizedBox3,
          ),
          Padding(
            padding: const EdgeInsets.only(right:AppPadding.padding3,left:AppPadding.padding3),
            child: BuildDividerContainer(),
          ),
          SizedBox(
            height:Appsized.sizedBox6
          ),
          InkWell(
            onTap:(){},
            child: Padding(
              padding: EdgeInsets.only(right:AppPadding.padding3,left:AppPadding.padding3),
              child:Container(
                decoration:BoxDecoration(
                  color:AppColor.ButtonClick,
                  borderRadius:BorderRadius.circular(15),
                ),
                child:Padding(
                  padding: EdgeInsets.all(AppPadding.padding3),
                  child: Center(
                    child: Text(
                       AppString.cartText,
                        style:AppStyle.itemText5
                    ),
                  ),
                ),
              )
            ),
          ),
        ],
      )
    );
  }
}
