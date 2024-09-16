import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product_Model.dart';
import 'package:e_commerce/screens/auth/loginScreen.dart';
import 'package:e_commerce/screens/itemPage.dart';
import 'package:e_commerce/servises/Api/productsApi.dart';
import 'package:e_commerce/shared/appColor.dart';
import 'package:e_commerce/shared/appSized.dart';
import 'package:e_commerce/shared/appString.dart';
import 'package:e_commerce/shared/appStyle.dart';
import 'package:e_commerce/widgets/buildTextForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../core/utils/imageManger.dart';
import '../shared/appPadding.dart';
import '../widgets/buildRow.dart';
import 'catgoryScreens/furnitureCatgory.dart';
import 'catgoryScreens/groceryCatgory.dart';
import 'catgoryScreens/kitchenCatgory.dart';
import 'catgoryScreens/lapCatgory.dart';
import 'catgoryScreens/manCatgory.dart';
import 'catgoryScreens/mobileCatgory.dart';
import 'catgoryScreens/motorcycleCatgory.dart';
import 'catgoryScreens/sportsCatgory,dart.dart';
import 'catgoryScreens/sunglassesCatgory.dart';
import 'catgoryScreens/womanCatgory.dart';
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});
  @override
  State<ProductPage> createState() => _ProductPageState();
}
class _ProductPageState extends State<ProductPage> {
  List catgories = [
    {
      "text" : "Laptops",
      "img" : ImageManger.laptop
    },
    {
      "text" : "Mobiles",
      "img" : ImageManger.mobile
    },
    {
      "text" : "Groceries",
      "img" : ImageManger.grocery
    },
    {
      "text" : "Mans",
      "img" : ImageManger.man
    },
    {
      "text" : "Women",
      "img" : ImageManger.woman
    },
    {
      "text" : "Sunglasses",
      "img" : ImageManger.sunGlasses
    },
    {
      "text" : "Sports",
      "img" : ImageManger.sports
    },
    {
      "text" : "Motocycle",
      "img" : ImageManger.motocycle
    },
    {
      "text" : "Furniture",
      "img" : ImageManger.furniture
    },
    {
      "text" : "kitchen",
      "img" : ImageManger.kitchen
    },
  ];
  bool isLoading = true;
  ProductModel? productList;
  getDataProduct()async{
    productList = await ProductApi().getProduct();
    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    getDataProduct();
    super.initState();
  }
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.only(left:AppPadding.padding3,top:AppPadding.padding2,right:AppPadding.padding3),
        child: ListView(
          children:[
            Row(
              children:[
                Column(
                  crossAxisAlignment:CrossAxisAlignment.baseline,
                  textBaseline:TextBaseline.alphabetic,
                  children:[
                    Text(
                      AppString.productText1,
                      style:AppStyle.productStyle1
                    ),
                    Row(
                      children:[
                        Text(
                            AppString.productText2,
                            style:AppStyle.productStyle2
                        ),
                        FaIcon(
                          Icons.local_fire_department_rounded,
                          color:AppColor.iconColor2,
                          size:35,
                        )
                      ],
                    ),
                  ],
                ),
                Spacer(),
                PopupMenuButton(
                    iconSize:30,
                    onSelected: (String result) async {
                      if (result == 'logout') {
                        GoogleSignIn google = GoogleSignIn();
                        google.disconnect();
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
                          return LoginScreen();
                        }));
                      }
                    },
                    itemBuilder:(BuildContext context) =><PopupMenuEntry<String>> [
                    const PopupMenuItem(
                      child:Row(
                        children:[
                          Icon(
                            Icons.call,
                            color:AppColor.blackColor,
                          ),
                          SizedBox(
                            width:10,
                          ),
                          Text(
                           AppString.productText3,
                            style:AppStyle.productStyle3
                          ),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      child:Row(
                        children:[
                          Icon(
                            Icons.help,
                            color:AppColor.blackColor,
                          ),
                          SizedBox(
                            width:10,
                          ),
                          Text(
                            AppString.productText4,
                              style:AppStyle.productStyle3
                          ),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value:AppString.productText5,
                      child:Row(
                        children:[
                          Icon(
                            Icons.exit_to_app_outlined,
                            color:AppColor.blackColor
                          ),
                          SizedBox(
                            width:10,
                          ),
                          Text(
                            AppString.productText5,
                              style:AppStyle.productStyle3
                          ),
                        ],
                      ),
                    ),
                  ]
                )
              ],
            ),
            SizedBox(
              height:Appsized.sizedBox4,
            ),
            SizedBox(
              height:Appsized.sizedBox8,
              child: BuildTextForm(
                  validator:(text){return null;},
                  prefixIcon:Icons.search,
                  controller:searchController,
                  label:AppString.searchText,
              ),
            ),
            SizedBox(
              height:Appsized.sizedBox8,
            ),
            SizedBox(
              height:Appsized.sizedBox10,
              child: ListView.builder(
                scrollDirection:Axis.horizontal,
                itemCount:catgories.length,
                itemBuilder:(context, i){
                  return Padding(
                    padding: EdgeInsets.only(right:AppPadding.padding4),
                    child: InkWell(
                      onTap: () {
                        Widget? screen;
                        switch (catgories[i]["text"]) {
                          case "Laptops":
                            screen = LapCatgory();
                            break;
                          case "Mobiles":
                            screen = MobileCatgory();
                            break;
                          case "Groceries":
                            screen = GroceryCatgory();
                            break;
                          case "Mans":
                            screen = ManCatgory();
                            break;
                          case "Women":
                            screen = WomanCatgory();
                            break;
                          case "Sunglasses":
                            screen = SunglassesCatgory();
                            break;
                          case "Sports":
                            screen = SportsCatgory();
                            break;
                          case "Motocycle":
                            screen = MotorcyclCatgory();
                            break;
                          case "Furniture":
                            screen = FurniturCatgory();
                            break;
                          case "kitchen":
                            screen = KitchenCatgory();
                            break;
                        }
                        if (screen != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => screen!),
                          );
                        }
                      },
                      splashColor:AppColor.whiteColor,
                      highlightColor:AppColor.whiteColor,
                      child: Container(
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(15),
                          border:Border.all(
                              color:AppColor.borderColor
                          )
                        ),
                        child:Column(
                          children:[
                            Image(
                              image:AssetImage("${catgories[i]["img"]}"),
                              height:100,
                            ),
                            Text(
                              "${catgories[i]["text"]}",
                              style:AppStyle.productStyle4
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height:Appsized.sizedBox4,
            ),
            BuildRowCatgory(
              text:"Popular Items",
            ),
            isLoading ?
            Center(
              child:CircularProgressIndicator(
                color:AppColor.ButtonClick,
              ),
            ) :
            GridView.builder(
              physics:NeverScrollableScrollPhysics(),
              shrinkWrap:true,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  mainAxisSpacing:10,
                  crossAxisSpacing:10,
                ),
                itemCount:productList!.products!.length,
                itemBuilder:(context , i){
                  return InkWell(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder:(context){
                        return ItemScreen(
                          img:"${productList!.products![i].thumbnail}",
                          title:"${productList!.products![i].title}",
                          des:"${productList!.products![i].description}",
                          price:"${productList!.products![i].price}",
                        );
                      }));
                    },
                    child: Container(
                      padding:EdgeInsets.all(AppPadding.padding13),
                      decoration: BoxDecoration(
                        color:AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child:CachedNetworkImage(
                              imageUrl:"${productList!.products![i].thumbnail}",
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                              height:Appsized.sizedBox1
                          ),
                          Text(
                            "${productList!.products![i].title}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:AppStyle.productStyle5
                          ),
                          SizedBox(
                              height:Appsized.sizedBox9
                          ),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children:[
                              Text(
                                "${productList!.products![i].price}\$",
                                style:AppStyle.productStyle6
                              ),
                              Container(
                                child:Icon(
                                  Icons.add,
                                  color:AppColor.whiteColor,
                                ),
                                height:25,
                                width:25,
                                decoration:BoxDecoration(
                                  borderRadius:BorderRadius.circular(5),
                                  color:AppColor.ButtonClick,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
            )
          ],
        ),
      )
    );
  }
}
