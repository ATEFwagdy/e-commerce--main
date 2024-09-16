import 'package:e_commerce/provider/imagePickerProvider.dart';
import 'package:e_commerce/shared/appColor.dart';
import 'package:e_commerce/shared/appPadding.dart';
import 'package:e_commerce/shared/appSized.dart';
import 'package:e_commerce/shared/appString.dart';
import 'package:e_commerce/shared/appStyle.dart';
import 'package:e_commerce/widgets/buildListTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../widgets/buildDividerContainer.dart';
import 'auth/loginScreen.dart';
import 'dart:io';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  File? file;
 Future<void>getPic(BuildContext context)async{
   final ImagePicker picker = ImagePicker();
   final XFile? galleryImage = await picker.pickImage(source: ImageSource.gallery);
   if(galleryImage != null){
     Provider.of<ImagePickerProvider>(context, listen: false)
         .setImagePath(galleryImage.path);
   }
 }
  @override
  Widget build(BuildContext context) {
    final imagePath = Provider.of<ImagePickerProvider>(context).imagePath;
    return Scaffold(
      body:ListView(
        children:[
          Padding(
            padding: EdgeInsets.only(top:AppPadding.padding14,left:AppPadding.padding4),
            child: Row(
              children:[
                  if (imagePath != null)
                  Container(
                    clipBehavior:Clip.antiAlias,
                    decoration:BoxDecoration(
                      shape:BoxShape.circle
                    ),
                    height:80,
                    width:100,
                   child: Image.file(
                     File(imagePath),
                     fit:BoxFit.fill,
                     width: 100,
                     height: 100,
                   ),
              )
                  else
                  Container(
                    decoration:BoxDecoration(
                      shape:BoxShape.circle,
                      color:Colors.grey[300],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed:(){
                        getPic(context);
                      },
                      iconSize: 40,
                    ),
                  ),
                  SizedBox(
                  width:Appsized.sizedBox4,
                ),
                  Column(
                  textBaseline:TextBaseline.alphabetic,
                  crossAxisAlignment:CrossAxisAlignment.baseline,
                  children:[
                    Row(
                      children:[
                        Text(
                          AppString.profileName,
                          style:AppStyle.profileText1
                          ,
                        ),
                        SizedBox(
                          width:Appsized.sizedBox2,
                        ),
                        Icon(
                            Icons.edit_outlined,
                            color:AppColor.ButtonClick
                        )
                      ],
                    ),
                    SizedBox(
                      height:Appsized.sizedBox1,
                    ),
                    Text(
                      AppString.profileEmail,
                      style:AppStyle.profileText2
                      ,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height:Appsized.sizedBox4,
          ),
          BuildDividerContainer(),
          const SizedBox(
            height:Appsized.sizedBox2,
          ),
          BuildListTile(
              title:AppString.orders,
              leading:Icons.shopping_bag_outlined,
              trailing:Icons.arrow_forward_ios_outlined
          ),
          BuildDividerContainer(),
          const SizedBox(
            height:Appsized.sizedBox2,
          ),
          BuildListTile(
              title:AppString.myDetails,
              leading:Icons.file_copy_outlined,
              trailing:Icons.arrow_forward_ios_outlined
          ),
          BuildDividerContainer(),
          const SizedBox(
            height:Appsized.sizedBox2,
          ),
          BuildListTile(
              title:AppString.delivery,
              leading:Icons.location_on_outlined,
              trailing:Icons.arrow_forward_ios_outlined
          ),
          BuildDividerContainer(),
          const SizedBox(
            height:Appsized.sizedBox2,
          ),
          BuildListTile(
              title:AppString.payment,
              leading:Icons.attach_money,
              trailing:Icons.arrow_forward_ios_outlined
          ),
          BuildDividerContainer(),
          const SizedBox(
            height:Appsized.sizedBox2,
          ),
          BuildListTile(
              title:AppString.promoCode,
              leading:Icons.qr_code_scanner_outlined,
              trailing:Icons.arrow_forward_ios_outlined
          ),
          BuildDividerContainer(),
          const SizedBox(
            height:Appsized.sizedBox2,
          ),
          BuildListTile(
              title:AppString.notifications,
              leading:Icons.notifications_active_outlined,
              trailing:Icons.arrow_forward_ios_outlined
          ),
          BuildDividerContainer(),
          const SizedBox(
            height:Appsized.sizedBox2,
          ),
          BuildListTile(
              title:AppString.productText4,
              leading:Icons.help_outline_outlined,
              trailing:Icons.arrow_forward_ios_outlined
          ),
          BuildDividerContainer(),
          const SizedBox(
            height:Appsized.sizedBox2,
          ),
          BuildListTile(
              title:AppString.aboutUs,
              leading:Icons.priority_high,
              trailing:Icons.arrow_forward_ios_outlined
          ),
          BuildDividerContainer(),
          const SizedBox(
            height:Appsized.sizedBox2,
          ),
          Padding(
            padding: const EdgeInsets.only(left:20,right:20),
            child: MaterialButton(
              shape:OutlineInputBorder(
                borderSide:const BorderSide(
                    color:AppColor.borderColor2
                ),
                borderRadius:BorderRadius.circular(20),
              ),
              color:AppColor.ButtonClick,
              onPressed:()async{
                await FirebaseAuth.instance..signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
                  return LoginScreen();
                }));
              },
              child:const Padding(
                padding: EdgeInsets.only(top:20,bottom:20),
                child: Row(
                  children:[
                    Icon(
                      Icons.exit_to_app,
                      color:AppColor.whiteColor,
                      size:30,
                    ),
                    SizedBox(
                      width:Appsized.sizedBox7,
                    ),
                    Text(
                      AppString.buttonProfile,
                      style:AppStyle.profileText3
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
