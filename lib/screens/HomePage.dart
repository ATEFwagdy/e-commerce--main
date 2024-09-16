import 'package:e_commerce/screens/catgory.dart';
import 'package:e_commerce/screens/order.dart';
import 'package:e_commerce/screens/profile.dart';
import 'package:e_commerce/shared/appColor.dart';
import 'package:e_commerce/shared/appString.dart';
import 'package:e_commerce/shared/appStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ProductPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int myIndex = 0;
  List<Widget> get myBody => [
    ProductPage(),
    CatgoryScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        selectedItemColor:AppColor.ButtonClick,
        selectedLabelStyle:AppStyle.selectedBottomNavigation,
        unselectedItemColor:AppColor.blackColor,
        unselectedLabelStyle:AppStyle.unselectedBottomNavigation,
        showUnselectedLabels:true,
        currentIndex:myIndex,
        onTap:(val){
          setState(() {
            myIndex = val;
          });
        },
        items:[
          BottomNavigationBarItem(
            icon:FaIcon(
              Icons.home_filled,
            ),
            label:AppString.bottomBar1,
          ),
          BottomNavigationBarItem(
              icon:FaIcon(
                Icons.category,
              ),
              label:AppString.bottomBar2
          ),
          BottomNavigationBarItem(
              icon:FaIcon(
                Icons.favorite,
              ),
              label:AppString.bottomBar3
          ),
          BottomNavigationBarItem(
              icon:FaIcon(
                Icons.person,
              ),
              label:AppString.bottomBar4
          ),
        ],
      ),
      body:myBody.elementAt(myIndex),
    );
  }
}
