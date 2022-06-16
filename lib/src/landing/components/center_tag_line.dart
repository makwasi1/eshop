
import 'package:eshop/src/constants.dart';
import 'package:flutter/material.dart';

class CenterTagLine extends StatelessWidget {
  const CenterTagLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 96.0),
                child: const Divider(
                  color: kPrimaryColor,
                  thickness: 1.5,
                ),
              ),
              const Text(
                'Get Best Products in E-Commerce',
                style: kTitleTextStyle,
              ),
            ],
          ),
    );
  }
}
