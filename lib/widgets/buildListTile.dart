import 'package:e_commerce/shared/appColor.dart';
import 'package:flutter/material.dart';
import '../shared/appStyle.dart';
class BuildListTile extends StatefulWidget {
  final String title;
 final IconData leading;
 final IconData trailing;
  const BuildListTile({super.key, required this.title, required this.leading, required this.trailing});
  @override
  State<BuildListTile> createState() => _BuildListTileState();
}
class _BuildListTileState extends State<BuildListTile> {
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading:Icon(
        widget.leading,
        color:AppColor.ListTileColor,
        size:30,
      ),
      title:Text(
          widget.title,
          style:AppStyle.buildListTile
      ),
      trailing:Icon(
          widget.trailing,
          size:25,
          color:AppColor.ListTileColor
      ),
    );
  }
}
