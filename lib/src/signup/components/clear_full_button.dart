import 'package:eshop/src/constants.dart';
import 'package:flutter/material.dart';

class ClearFullButton extends StatelessWidget {
  final String darkText, colorText;
  final Function onPressed;
  const ClearFullButton({
    Key key,
    this.darkText,
    this.colorText, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: kTransparent,
        textStyle: const TextStyle(color: Colors.black),
        primary: kTransparent,
        padding: const EdgeInsets.symmetric(vertical: kLessPadding),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      // splashColor: kTransparent,
      // highlightColor: kTransparent,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: darkText,
              style: kDarkTextStyle,
            ),
            TextSpan(
              text: colorText,
              style: kTitleTextStyle,
            ),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
