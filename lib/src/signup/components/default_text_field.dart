import 'package:eshop/src/constants.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final keyboardType, obscureText;
  const DefaultTextField({
    Key key,
    this.hintText,
    this.icon,
    this.keyboardType,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration:  BoxDecoration(
        borderRadius: null,
        border: Border.all(color: Colors.grey) ,
        color: kWhiteColor,
      ),
      child: TextField(
        cursorColor: kPrimaryColor,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          fillColor: Colors.white,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
