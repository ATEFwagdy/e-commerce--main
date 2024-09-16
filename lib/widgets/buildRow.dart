import 'package:e_commerce/shared/appString.dart';
import 'package:flutter/material.dart';
import '../shared/appStyle.dart';
class BuildRowCatgory extends StatefulWidget {
  final String text;
  const BuildRowCatgory({super.key, required this.text});
  @override
  State<BuildRowCatgory> createState() => _BuildRowState();
}
class _BuildRowState extends State<BuildRowCatgory> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children:[
        Text(
            widget.text,
            style:AppStyle.buildRowText
        ),
        TextButton(
            onPressed:(){},
            child:Text(
              AppString.textButton,
              style:AppStyle.buildTextButton
            )
        )
      ],
    );
  }
}
