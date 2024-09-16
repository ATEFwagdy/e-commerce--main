import 'package:e_commerce/screens/auth/loginScreen.dart';
import 'package:e_commerce/shared/appColor.dart';
import 'package:e_commerce/shared/appPadding.dart';
import 'package:e_commerce/shared/appString.dart';
import 'package:e_commerce/shared/appStyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../core/utils/imageManger.dart';
import '../../shared/appSized.dart';
import '../../widgets/buildTextForm.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key:formState,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
              const Padding(
                padding: EdgeInsets.only(top:AppPadding.padding7),
                child: Center(
                  child: Image(
                    height:145,
                    image:AssetImage(ImageManger.splashImage),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left:AppPadding.padding2),
                child: Text(
                  AppString.signupTxt1,
                  style:AppStyle.loginTxt1
                ),
              ),
              const SizedBox(
                height:Appsized.sizedBox2,
              ),
              const Padding(
                padding: EdgeInsets.only(left:AppPadding.padding2),
                child: Text(
                 AppString.signupTxt2,
                  style:AppStyle.loginTxt2
                ),
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
                  prefixIcon:Icons.person_outline_rounded,
                  controller:userNameController,
                  label:"Full name"
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
              BuildTextForm(
                validator:(text){
                  if(text == null || text.isEmpty){
                    return "this field shouldn't be empty";
                  }
                  else if(text != passController.text){
                    return "password doesn't match together";
                  }
                  return null;
                },
                prefixIcon:Icons.lock_outline_rounded,
                controller:passController2,
                label:"Confirm password",
                isPassword:true,
              ),
              const SizedBox(
                height:Appsized.sizedBox5,
              ),
              Center(
                child: MaterialButton(
                    splashColor:AppColor.ButtonClick,
                    highlightColor:AppColor.ButtonClick,
                    color:AppColor.ButtonClick,
                    onPressed:()async{
                      if(formState.currentState!.validate()){
                        try {
                          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email:emailController.text,
                            password:passController.text,
                          );
                          FirebaseAuth.instance.currentUser!.sendEmailVerification();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
                            return const LoginScreen();
                          }));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            Fluttertoast.showToast(
                                msg: "The password is too weak",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor:AppColor.ButtonClick,
                                textColor:AppColor.whiteColor,
                                fontSize: 16.0
                            );
                          } else if (e.code == 'email-already-in-use') {
                            Fluttertoast.showToast(
                                msg: "The account already exists for that email.",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor:AppColor.ButtonClick,
                                textColor:AppColor.whiteColor,
                                fontSize: 16.0
                            );
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    child:const Padding(
                      padding: EdgeInsets.only(right:25,left:25,top:5,bottom:5),
                      child: Text(
                        AppString.registerTxt,
                        style:AppStyle.loginTxt3
                      ),
                    )
                ),
              ),
              const SizedBox(
                height:Appsized.sizedBox3,
              ),
              const Padding(
                padding: EdgeInsets.only(left:AppPadding.padding3),
                child: Text(
                  AppString.haveAccount,
                  style:AppStyle.haveAccountStyle
                ),
              ),
              const SizedBox(
                height:Appsized.sizedBox1,
              ),
              Padding(
                padding: const EdgeInsets.only(left:AppPadding.padding3),
                child: InkWell(
                  splashColor:AppColor.whiteColor,
                  highlightColor:AppColor.whiteColor,
                  onTap:(){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
                      return const LoginScreen();
                    }));
                  },
                  child:const Text(
                    AppString.loginTxt,
                    style:AppStyle.createAccountStyle
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
