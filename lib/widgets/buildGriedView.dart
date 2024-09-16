import 'package:e_commerce/screens/catgoryScreens/furnitureCatgory.dart';
import 'package:e_commerce/screens/catgoryScreens/groceryCatgory.dart';
import 'package:e_commerce/screens/catgoryScreens/lapCatgory.dart';
import 'package:e_commerce/screens/catgoryScreens/manCatgory.dart';
import 'package:e_commerce/screens/catgoryScreens/mobileCatgory.dart';
import 'package:e_commerce/screens/catgoryScreens/motorcycleCatgory.dart';
import 'package:e_commerce/screens/catgoryScreens/sportsCatgory,dart.dart';
import 'package:e_commerce/screens/catgoryScreens/sunglassesCatgory.dart';
import 'package:e_commerce/screens/catgoryScreens/womanCatgory.dart';
import 'package:e_commerce/shared/appColor.dart';
import 'package:e_commerce/shared/appSized.dart';
import 'package:e_commerce/shared/appStyle.dart';
import 'package:flutter/material.dart';
import '../screens/catgoryScreens/kitchenCatgory.dart';
import '../shared/appPadding.dart';
class BuildGriedView extends StatelessWidget {
  final List categoryData;
  BuildGriedView({super.key, required this.categoryData});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics:NeverScrollableScrollPhysics(),
        shrinkWrap:true,
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
          crossAxisSpacing:10,
          mainAxisSpacing:10,
        ),
        itemCount:categoryData.length,
        itemBuilder:(context,i){
          return Padding(
            padding:  EdgeInsets.only(right:AppPadding.padding2,left:AppPadding.padding2),
            child: InkWell(
              onTap:() {
                Widget? screen;
                switch (categoryData[i]["title"]) {
                  case "Laptops":
                    screen = LapCatgory();
                    break;
                  case "Mobiles":
                    screen = MobileCatgory();
                    break;
                  case "Groceries":
                    screen = GroceryCatgory();
                    break;
                  case "Man Clothes":
                    screen = ManCatgory();
                    break;
                  case "Women Clothes":
                    screen = WomanCatgory();
                    break;
                  case "Sunglasses":
                    screen = SunglassesCatgory();
                    break;
                  case "Sports Accessories":
                    screen = SportsCatgory();
                    break;
                  case "Motorcycle":
                    screen = MotorcyclCatgory();
                    break;
                  case "House Furniture":
                    screen = FurniturCatgory();
                    break;
                  case "kitchen Accessors":
                    screen = KitchenCatgory();
                    break;
                }
                if(screen != null){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => screen!),
                  );
                }
              },
              splashColor:AppColor.whiteColor,
              highlightColor:AppColor.whiteColor,
              child:Card(
                child:Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children:[
                    categoryData[i]["icon"],
                    SizedBox(
                      height:Appsized.sizedBox2,
                    ),
                    Text(
                        "${categoryData[i]["title"]}",
                        style:AppStyle.buildGriedView
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
