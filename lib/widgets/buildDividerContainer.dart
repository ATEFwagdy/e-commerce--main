import 'package:flutter/material.dart';
import '../shared/appColor.dart';
import '../shared/appPadding.dart';
class BuildDividerContainer extends StatefulWidget {
  const BuildDividerContainer({super.key});
  @override
  State<BuildDividerContainer> createState() => _BuildDividerContainerState();
}
class _BuildDividerContainerState extends State<BuildDividerContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right:AppPadding.padding1,left:AppPadding.padding1),
      child: Container(
          width:double.infinity,
          height:2,
          color:AppColor.containerDivider
      ),
    );
  }
}
