import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:medxcart_app/theme.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  Text buttonText;
  CustomButton({@required this.onPressed, @required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
      child: buttonText,
      fillColor: MyColors.primaryColor,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
