import 'package:eshop/src/constants.dart';
import 'package:flutter/material.dart';

class ClearDefaultButton extends StatelessWidget {
  final Function press;
  final String name;
  const ClearDefaultButton({
    Key key, this.press, this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: kTransparent,
        textStyle: const TextStyle(color: kPrimaryColor),
        primary: kTransparent,
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      // padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      onPressed: press,
      // textColor: kPrimaryColor,
      // highlightColor: kTransparent,
      // splashColor: kTransparent,
      child: Text(
        name.toUpperCase(),
      ),
    );
  }
}