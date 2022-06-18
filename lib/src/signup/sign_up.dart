import 'dart:ui';

import 'package:eshop/src/account/account.dart';
import 'package:eshop/src/cart/cart.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/home/home.dart';
import 'package:eshop/src/intro/components/empty_app_bar.dart';
import 'package:eshop/src/landing/components/top_logo.dart';
import 'package:eshop/src/signup/components/bottom_widget.dart';
import 'package:eshop/src/signup/components/center_text_fields.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const DefaultAppBar(title: ""),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // TopLogo(),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, bottom: 5),
                child: Text(
                  "Register An Account",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                  ),
                  // textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CenterTextfields(),
              BottomWidgets(),
              Padding(
                padding: EdgeInsets.only(left: 24, bottom: 10),
                child: Text(
                  "Connect with:",
                  style: TextStyle(fontSize: 17),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                ),
              ),
              SocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
