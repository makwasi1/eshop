import 'package:eshop/src/constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String hintText;
  TextEditingController textValue;
  final IconData icon;
  final keyboardType, obscureText;
  DefaultTextField({
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
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: null,
          border: Border.all(color: Colors.grey),
          color: kWhiteColor,
        ),
        child: TextFormField(
          style: const TextStyle(
              fontSize: 14.0, color: kDarkColor, fontWeight: FontWeight.bold),
          controller: textValue,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(EvaIcons.emailOutline, color: Colors.black26),
            enabledBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(30.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(30.0)),
            contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
            labelText: "E-Mail",
            hintStyle: const TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
                fontWeight: FontWeight.w500),
            labelStyle: const TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
                fontWeight: FontWeight.w500),
          ),
          autocorrect: false,
        ));
  }
}
