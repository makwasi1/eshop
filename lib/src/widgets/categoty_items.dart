import 'package:eshop/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CategoryItems extends StatelessWidget {
  final double height,
      width,
      radius,
      titleSize,
      amountSize,
      paddingHorizontal,
      paddingVertical;
  final String image, title, amount;
  final Color color, lblColor;
  final align, blendMode;

  const CategoryItems({
    Key key,
    this.height,
    this.width,
    this.radius,
    this.titleSize,
    this.image,
    this.title,
    this.color,
    this.align,
    this.amount,
    this.lblColor,
    this.blendMode,
    this.amountSize,
    this.paddingHorizontal,
    this.paddingVertical
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
     title: Text(title,style: kDarkTextStyle,),
     
    );
  }
}
