import 'package:e_commerce/shared/appColor.dart';
import 'package:e_commerce/shared/appPadding.dart';
import 'package:e_commerce/shared/appSized.dart';
import 'package:e_commerce/shared/appString.dart';
import 'package:e_commerce/shared/appStyle.dart';
import 'package:e_commerce/widgets/buildGriedView.dart';
import 'package:e_commerce/widgets/catgoryTextForm.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/buildRow.dart';
class CatgoryScreen extends StatefulWidget {
  const CatgoryScreen({super.key});
  @override
  State<CatgoryScreen> createState() => _CatgoryScreenState();
}
class _CatgoryScreenState extends State<CatgoryScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children:[
          Container(
            decoration:BoxDecoration(
              color:AppColor.ButtonClick,
              borderRadius:BorderRadius.only(
                bottomLeft:Radius.circular(15),
                bottomRight:Radius.circular(15),
              )
            ),
            height:250,
            width:double.infinity,
            child:Padding(
              padding: const EdgeInsets.only(top:35,left:10),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  Text(
                    AppString.catgoryText1,
                    style:AppStyle.catgoryText1
                  ),
                  Text(
                      AppString.catgoryText2,
                      style:AppStyle.catgoryText1
                  ),
                  SizedBox(
                    height:Appsized.sizedBox11,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:10),
                    child: SizedBox(
                      height:Appsized.sizedBox12,
                      child:CatgoryTextForm(
                          label:AppString.catgoryText3,
                          prefixIcon:Icons.search,
                          controller:searchController
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height:Appsized.sizedBox2,
          ),
          Padding(
            padding: EdgeInsets.only(right:AppPadding.padding3,left:AppPadding.padding3),
            child:BuildRowCatgory(text:AppString.catgoryText4)
          ),
          BuildGriedView(
            categoryData: [
              {
                "title": "Laptops",
                "icon": FaIcon(
                    Icons.laptop,
                    size:55,
                ),
              },
              {
                "title": "Mobiles",
                "icon": FaIcon(
                    Icons.mobile_screen_share_rounded,
                   size:55,
                ),
              },
              {
                "title": "Groceries",
                "icon": FaIcon(
                    Icons.soup_kitchen,
                   size:55,
                ),
              },
              {
                "title": "Man Clothes",
                "icon": FaIcon(
                    Icons.man,
                   size:55,
                ),
              },
              {
                "title": "Women Clothes",
                "icon": FaIcon(
                    Icons.woman,
                    size:55,
                ),
              },
              {
                "title": "Sunglasses",
                "icon": FaIcon(
                    Icons.sunny,
                    size:55,
                ),
              },
              {
                "title": "Sports Accessories",
                "icon": FaIcon(
                    Icons.sports,
                   size:55,
                ),
              },
              {
                "title": "Motorcycle",
                "icon": FaIcon(
                  Icons.bike_scooter,
                  size:55,
                ),
              },
              {
                "title": "House Furniture",
                "icon": FaIcon(
                  Icons.home_work_outlined,
                  size:55,
                ),
              },
              {
                "title": "kitchen Accessors",
                "icon": FaIcon(
                  Icons.kitchen,
                  size:55,
                ),
              },
            ],
          )
        ],
      ),
    );
  }
}
