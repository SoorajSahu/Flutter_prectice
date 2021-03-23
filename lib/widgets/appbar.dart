import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CustomAppBar extends StatelessWidget {
  final Widget appBarText;
  CustomAppBar({this.appBarText}); // constructor

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.greenAccent,
      title: appBarText,
    );
  }
}
