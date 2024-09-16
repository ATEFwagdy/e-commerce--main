import 'package:e_commerce/shared/appStyle.dart';
import 'package:flutter/material.dart';
import '../shared/appColor.dart';
// ignore: must_be_immutable
class CatgoryTextForm extends StatefulWidget {
  String label;
  IconData prefixIcon;
  TextEditingController controller;
   CatgoryTextForm({
    super.key,
    required this.label,
    required this.prefixIcon,
    required this.controller
  });
  @override
  State<CatgoryTextForm> createState() => _CatgoryTextFormState();
}
class _CatgoryTextFormState extends State<CatgoryTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:widget.controller,
      style:AppStyle.contentTextForm2,
      decoration:InputDecoration(
        fillColor:AppColor.whiteColor,
        filled:true,
        prefixIcon:Icon(
          widget.prefixIcon,
          color:AppColor.iconColor,
          size:30,
        ),
        label:Text(
            widget.label,
            style:AppStyle.labelTextForm2
        ),
        enabledBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(10),
            borderSide:BorderSide.none
        ),
      ),
    );
  }
}
