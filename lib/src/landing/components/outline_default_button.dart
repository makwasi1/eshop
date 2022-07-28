
import 'package:eshop/src/constants.dart';
import 'package:flutter/material.dart';

class OutlineDefaultButton extends StatelessWidget {
  final Function press;
  final String btnText;
  const OutlineDefaultButton({
    Key key, this.press, this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: ElevatedButton(
        child: Text(btnText),
        onPressed: press,
      ),
    );
  }
}
