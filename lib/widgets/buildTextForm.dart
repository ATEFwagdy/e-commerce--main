import 'package:e_commerce/shared/appColor.dart';
import 'package:e_commerce/shared/appStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/appPadding.dart';
// ignore: must_be_immutable
class BuildTextForm extends StatefulWidget {
 final  String?  Function(String?)? validator;
  String label;
  IconData prefixIcon;
  TextEditingController controller;
  IconData? suffixIcon;
  final bool isPassword;
   BuildTextForm({
    super.key,
     required  this.validator,
     required this.prefixIcon,
     required this.controller,
     required this.label,
     this.suffixIcon,
     this.isPassword = false,
  });

  @override
  State<BuildTextForm> createState() => _BuildTextFormState();
}

class _BuildTextFormState extends State<BuildTextForm> {
  bool _obscureText = true;
  void hideMyPass() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right:AppPadding.padding2,left:AppPadding.padding2),
      child: TextFormField(
        obscureText: widget.isPassword ? _obscureText : false,
        controller:widget.controller,
        validator:widget.validator,
        style:AppStyle.contentTextForm,
        cursorColor:AppColor.ButtonClick,
        decoration:InputDecoration(
          contentPadding:const EdgeInsets.all(25),
          enabledBorder:OutlineInputBorder(
              borderRadius:BorderRadius.circular(10),
              borderSide:BorderSide()
          ),
          focusedBorder:OutlineInputBorder(
              borderRadius:BorderRadius.circular(10),
              borderSide:BorderSide()
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            color:AppColor.ButtonClick,
            size:30,
          ),
          suffixIcon: widget.isPassword ? IconButton(
               icon: Icon(
                 color:Color(0xff544d80),
               _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                ),
               onPressed:hideMyPass,
               ) : null,
          label:Text(
            widget.label,
            style:AppStyle.labelTextForm
          ),
        ),
      ),
    );
  }
}
