import 'package:e_commerce/core/utils/imageManger.dart';
import 'package:e_commerce/shared/appColor.dart';
import 'package:e_commerce/shared/appPadding.dart';
import 'package:e_commerce/shared/appSized.dart';
import 'package:e_commerce/shared/appString.dart';
import 'package:e_commerce/shared/appStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'loginScreen.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}
class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<PageViewModel>? pages = [
    PageViewModel(
      title:"",
      bodyWidget: Column(
        textBaseline:TextBaseline.alphabetic,
        crossAxisAlignment:CrossAxisAlignment.baseline,
        children:[
          Center(child: Image.asset(ImageManger.onboardingImage1)),
          const SizedBox(
            height:Appsized.sizedBox2,
          ),
          const Text(
           AppString.onboardingTxt1,
            style:AppStyle.onboardingTxt1
          ),
          const Text(
            AppString.onboardingTxt2,
             style:AppStyle.onboardingTxt2
          ),
        ],
      ),
    ),
    PageViewModel(
      title:"",
      bodyWidget: Column(
        textBaseline:TextBaseline.alphabetic,
        crossAxisAlignment:CrossAxisAlignment.baseline,
        children:[
          Center(child: Image.asset(ImageManger.onboardingImage2)),
          const SizedBox(
            height:Appsized.sizedBox2,
          ),
          const Text(
           AppString.onboardingTxt3,
            style:AppStyle.onboardingTxt1
          ),
          const Text(
           AppString.onboardingTxt4,
            style:AppStyle.onboardingTxt2
          ),
        ],
      ),
    ),
    PageViewModel(
      title:"",
      bodyWidget: Column(
        textBaseline:TextBaseline.alphabetic,
        crossAxisAlignment:CrossAxisAlignment.baseline,
        children:[
          Center(child: Image.asset(ImageManger.onboardingImage3)),
          const SizedBox(
            height:Appsized.sizedBox2,
          ),
          const Text(
            AppString.onboardingTxt5,
            style:AppStyle.onboardingTxt1
          ),
          const Text(
            AppString.onboardingTxt6,
            style:AppStyle.onboardingTxt2
          ),
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IntroductionScreen(
        pages:pages,
        showDoneButton:true,
        showNextButton:true,
        showSkipButton:true,
        done:Container(
          decoration: BoxDecoration(
            color:AppColor.onboardingContainer,
            borderRadius:BorderRadius.circular(10),
          ),
          child:const Padding(
            padding: EdgeInsets.only(right:20,left:20,top:5,bottom:5),
            child: Text(
                AppString.onboardingDone,
                style:AppStyle.onboardingButton
            ),
          ),
        ),
        next:Container(
          decoration: BoxDecoration(
            color:AppColor.onboardingContainer,
            borderRadius:BorderRadius.circular(10),
          ),
          child:const Padding(
            padding: EdgeInsets.only(right:20,left:20,top:5,bottom:5),
            child: Text(
                AppString.onboardingNext,
              style:AppStyle.onboardingButton
            ),
          ),
        ),
        skip:Container(
          decoration: BoxDecoration(
            color:AppColor.onboardingContainer,
            borderRadius:BorderRadius.circular(10),
          ),
          child:const Padding(
            padding: EdgeInsets.only(right:20,left:20,top:5,bottom:5),
            child: Text(
                AppString.onboardingSkip,
                style:AppStyle.onboardingButton
            ),
          ),
        ),
        onDone:(){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
            return const LoginScreen();
          }));
        },
        bodyPadding: EdgeInsets.only(top:AppPadding.padding10),
        curve:Curves.bounceInOut,
        dotsDecorator:const DotsDecorator(
          activeColor:AppColor.onboardingContainer

        ),
      ),
    );
  }
}
