import 'package:e_commerce/screens/auth/loginScreen.dart';
import 'package:e_commerce/shared/appString.dart';
import 'package:e_commerce/shared/appStyle.dart';
import 'package:e_commerce/widgets/buildTextForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../core/utils/imageManger.dart';
import '../../shared/appColor.dart';
import '../../shared/appPadding.dart';
import '../../shared/appSized.dart';
class ForgetPasScreen extends StatefulWidget {
  const ForgetPasScreen({super.key});
  @override
  State<ForgetPasScreen> createState() => _ForgetPasScreenState();
}
class _ForgetPasScreenState extends State<ForgetPasScreen> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Form(
        key:formState,
        child: ListView(
          children:[
            Row(
              children:[
                Padding(
                  padding: EdgeInsets.only(bottom:AppPadding.padding9),
                  child: IconButton(
                    onPressed:(){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
                        return const LoginScreen();
                      }));
                    },
                    icon:const Icon(
                      Icons.arrow_back,
                      color:Colors.black,
                      size:30,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top:AppPadding.padding6,left:AppPadding.padding6),
                  child: Image(
                    height:145,
                    image:AssetImage(ImageManger.splashImage),
                  ),
                ),
              ],
            ),
            SizedBox(
              height:Appsized.sizedBox2,
            ),
            const Center(
              child: Text(
                AppString.forgetPass,
                style:AppStyle.forgetPasswordPage
              ),
            ),
            const SizedBox(
              height:Appsized.sizedBox4,
            ),
            BuildTextForm(
                validator:(text){
                  final bool emailValid =
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(text!);
                  if(text == null || text.isEmpty){
                    return "this field shouldn't be empty";
                  }
                  else if(emailValid == false){
                    return "please enter correct email";
                  }
                  return null;
                },
                prefixIcon:Icons.email_outlined,
                controller:emailController,
                label:"Email"
            ),
            const SizedBox(
              height:Appsized.sizedBox4,
            ),
            Center(
              child: MaterialButton(
                  shape:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(10),
                    borderSide:BorderSide.none
                  ),
                  splashColor:AppColor.ButtonClick,
                  highlightColor:AppColor.ButtonClick,
                  color:const Color(0xff544d80),
                  onPressed:()async{
                    if(emailController.text == ""){
                      Fluttertoast.showToast(
                          msg: "Firstly,you must enter your email",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor:AppColor.ButtonClick,
                          textColor:AppColor.whiteColor,
                          fontSize: 16.0
                      );
                      return;
                    }
                    try{
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                          email:emailController.text
                      );
                      Fluttertoast.showToast(
                          msg: "check your email to change password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor:AppColor.ButtonClick,
                          textColor:AppColor.whiteColor,
                          fontSize: 16.0
                      );
                    }catch(e){
                      Fluttertoast.showToast(
                          msg: "enter your correct email",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor:AppColor.ButtonClick,
                          textColor:AppColor.whiteColor,
                          fontSize: 16.0
                      );
                    }
                  },
                  child:const Padding(
                    padding: EdgeInsets.only(right:25,left:25,top:5,bottom:5),
                    child: Text(
                      AppString.changePass,
                      style:AppStyle.loginTxt3
                    ),
                  )
              ),
            ),
            const SizedBox(
              height:Appsized.sizedBox2,
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children:[
                Text(
                    AppString.rememberPass,
                    style:AppStyle.rememberPassword1
                ),
                SizedBox(
                  height:Appsized.sizedBox2,
                ),
                InkWell(
                  splashColor:AppColor.whiteColor,
                  highlightColor:AppColor.whiteColor,
                  onTap:(){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
                      return LoginScreen();
                    }));
                  },
                  child: Text(
                      AppString.loginTxt6,
                      style:AppStyle.rememberPassword2
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
