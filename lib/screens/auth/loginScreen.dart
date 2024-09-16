import 'package:e_commerce/screens/HomePage.dart';
import 'package:e_commerce/screens/auth/signupScreen.dart';
import 'package:e_commerce/shared/appColor.dart';
import 'package:e_commerce/shared/appPadding.dart';
import 'package:e_commerce/shared/appString.dart';
import 'package:e_commerce/shared/appStyle.dart';
import 'package:e_commerce/widgets/buildTextForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../core/utils/imageManger.dart';
import '../../shared/appSized.dart';
import 'forgetpasswordScreen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }
      setState(() {
        isLoading = true;
      });
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      Fluttertoast.showToast(
        msg: "Success Login",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColor.ButtonClick,
        textColor: AppColor.whiteColor,
        fontSize: 16.0,
      );
      await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Failed Login",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColor.ButtonClick,
          textColor: AppColor.whiteColor,
          fontSize: 16.0);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  bool isLoading = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key:formState,
        child:isLoading ?
        const Center(
          child:CircularProgressIndicator(
            color:AppColor.ButtonClick,
          ),
        )
       : ListView(
          children:[
            const Padding(
              padding: EdgeInsets.only(top:AppPadding.padding6),
              child: Image(
                height:145,
                image:AssetImage(ImageManger.splashImage),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left:AppPadding.padding2),
              child: Text(
                AppString.loginTxt1,
                style:AppStyle.loginTxt1
              ),
            ),
            const SizedBox(
              height:Appsized.sizedBox2,
            ),
            const Padding(
              padding: EdgeInsets.only(left:AppPadding.padding2),
              child: Text(
                AppString.loginTxt2,
                style:AppStyle.loginTxt2
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
            BuildTextForm(
                validator:(text){
                  if(text == null || text.isEmpty){
                    return "this field shouldn't be empty";
                  }
                  return null;
                },
                prefixIcon:Icons.lock_outline_rounded,
                controller:passController,
                label:"password",
                isPassword:true,
            ),
            const SizedBox(
              height:Appsized.sizedBox5,
            ),
            Padding(
              padding: const EdgeInsets.only(right:AppPadding.padding2,left:AppPadding.padding2),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children:[
                  InkWell(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder:(context){
                        return const ForgetPasScreen();
                      }));
                    },
                    splashColor:AppColor.whiteColor,
                    highlightColor:Colors.white,
                    child: const Text(
                      AppString.forgetPass,
                      style:AppStyle.forgetStyle
                    ),
                  ),
                  MaterialButton(
                      splashColor:AppColor.ButtonClick,
                      highlightColor:AppColor.ButtonClick,
                      color:AppColor.ButtonClick,
                      onPressed:()async{
                        if(formState.currentState!.validate()){
                          isLoading = true;
                          setState((){});
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email:emailController.text,
                              password:passController.text
                          ).then((value){
                            if(FirebaseAuth.instance.currentUser!.emailVerified){
                              Fluttertoast.showToast(
                                  msg: "Success Login",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:AppColor.ButtonClick,
                                  textColor:AppColor.whiteColor,
                                  fontSize: 16.0
                              );
                              Future.delayed(
                                  const Duration(seconds:2),
                                      (){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
                                      return const HomePage();
                                    }));
                                  }
                              );
                            }
                            else{
                              isLoading = false;
                              setState((){});
                              Fluttertoast.showToast(
                                  msg: "check your email to verify it.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:AppColor.ButtonClick,
                                  textColor:AppColor.whiteColor,
                                  fontSize: 16.0
                              );
                            }
                          }).catchError((e){
                            isLoading = false;
                            setState((){});
                            Fluttertoast.showToast(
                                msg: "Fail Login",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor:AppColor.ButtonClick,
                                textColor:AppColor.whiteColor,
                                fontSize: 16.0
                            );
                          });
                        }
                      },
                      child:const Padding(
                        padding: EdgeInsets.only(right:25,left:25,top:5,bottom:5),
                        child: Text(
                          AppString.loginTxt,
                          style:AppStyle.loginTxt3
                        ),
                      )
                  )
                ],
              ),
            ),
            const SizedBox(
              height:Appsized.sizedBox6,
            ),
            Padding(
              padding: const EdgeInsets.only(right:AppPadding.padding2,left:AppPadding.padding2),
              child: MaterialButton(
                  onPressed:()async{
                    await signInWithGoogle();
                  },
                  splashColor:AppColor.whiteColor,
                  highlightColor:AppColor.whiteColor,
                  shape:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(15),
                  ),
                  color:AppColor.whiteColor,
                  child:const Padding(
                    padding: EdgeInsets.only(right:5,left:5,top:5,bottom:5),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children:[
                        Padding(
                          padding: EdgeInsets.only(right:15),
                          child: ClipRRect(
                            child:Image(
                              image:AssetImage(ImageManger.googleIcon),
                              height:50,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right:15),
                          child: Text(
                            AppString.loginTxt3,
                            style:AppStyle.googleButtonStyle
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
            const SizedBox(
              height:Appsized.sizedBox4,
            ),
            const Padding(
              padding: EdgeInsets.only(left:AppPadding.padding3),
              child: Text(
               AppString.loginTxt4,
                style:AppStyle.haveAccountStyle
              ),
            ),
            const SizedBox(
              height:Appsized.sizedBox3
            ),
            Padding(
              padding: const EdgeInsets.only(left:AppPadding.padding3),
              child: InkWell(
                splashColor:AppColor.whiteColor,
                highlightColor:AppColor.whiteColor,
                onTap:(){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
                    return const SignUpScreen();
                  }));
                },
                child: const Text(
                  AppString.loginTxt5,
                  style:AppStyle.createAccountStyle
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
