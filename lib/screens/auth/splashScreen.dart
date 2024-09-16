import 'package:e_commerce/core/utils/imageManger.dart';
import 'package:e_commerce/screens/HomePage.dart';
import 'package:e_commerce/screens/auth/onboardingScreen.dart';
import 'package:e_commerce/shared/appColor.dart';
import 'package:e_commerce/shared/appPadding.dart';
import 'package:e_commerce/shared/appSized.dart';
import 'package:e_commerce/shared/appString.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../shared/appStyle.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }
  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    }
    else if (user.emailVerified) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
    else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.splashColor,
      body:Padding(
        padding: EdgeInsets.only(left:AppPadding.padding4),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
          Image.asset(ImageManger.splashImage),
          SizedBox(
            height:Appsized.sizedBox4,
          ),
          Text(
            AppString.splashText,
            style:AppStyle.splashScreen
          ),
          ],
        ),
      )
    );
  }
}
