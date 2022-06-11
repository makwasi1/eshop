import 'package:eshop/src/constants.dart';
import 'package:eshop/src/intro/components/empty_app_bar.dart';
import 'package:flutter/material.dart';

import 'components/bottom_buttons.dart';
import 'components/center_tag_line.dart';
import 'components/top_logo.dart';

class Landing extends StatefulWidget {
  Landing({Key key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const EmptyAppBar(),
      body: Column(
        children: const [
          TopLogo(),
          // CenterTagLine(),
          BottomButtons(),
        ],
      ),
    );
  }
}
