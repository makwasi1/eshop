import 'dart:math';

import 'package:eshop/src/constants.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final String btnText;
  final Function onPressed;
  const DefaultButton({
    Key key,
    this.btnText,
    this.onPressed,
  }) : super(key: key);

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  var pressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.black,
      onTap: (){},
      onHover: (a){
        setState(() {
          pressed = a;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: pressed ? kPrimaryColor : kTransparent,
            textStyle:  TextStyle(color:  pressed ? kWhiteColor : kDarkColor),
            foregroundColor:  pressed ? kDarkColor : kPrimaryColor,
            padding: const EdgeInsets.symmetric(vertical: kLessPadding),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          ),
          // padding: EdgeInsets.symmetric(vertical: kLessPadding),
          // height: 50.0,
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          // color: pressed ? kDarkColor : kPrimaryColor ,
          // textColor: pressed ? kWhiteColor : kDarkColor ,
          // highlightColor: kTransparent,
          onLongPress: () => {
            setState(() {
              pressed = !pressed;
            })
          },
          onPressed: widget.onPressed,
          child: Text(widget.btnText,style: TextStyle(fontSize: 18,))
        ),
      ),
    );
  }
}
