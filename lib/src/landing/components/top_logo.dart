import 'package:eshop/src/constants.dart';
import 'package:flutter/material.dart';

class TopLogo extends StatelessWidget {
  const TopLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage(logo),
            height: 160.0,
          ),
          Text(
            'Velocity Shop',
            style: kTitleTextStyle,
          ),
        ],
      ),
    );
  }
}
