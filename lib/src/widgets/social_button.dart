import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Function onPressed;
  final Widget icon;
  final Color color;
  const SocialButton({Key key, this.onPressed, this.icon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Center(
          child: Ink(
            height: 50,
            width: 70,
            decoration: ShapeDecoration(
              shape: const RoundedRectangleBorder(),
              color: color,
            ),
            child: IconButton(
              icon: icon,
              iconSize: 20.0,
              color: Colors.white,
              onPressed: onPressed,
            ),
          ),
        ));
  }
}
