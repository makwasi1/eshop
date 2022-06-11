import 'package:eshop/src/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:eshop/src/signup/components/clear_full_button.dart';
import 'package:eshop/src/signup/components/default_button.dart';
import 'package:eshop/src/signup/sign_in.dart';
import 'package:flutter/material.dart';

class BottomWidgets extends StatelessWidget {
  const BottomWidgets({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClearFullButton(
            darkText: 'Already have an account?',
            colorText: ' SignIn',
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn())),
          ),
          DefaultButton(
            btnText: 'Sign Up',
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => BottomNavBar(0))),
          ),
        ],
      ),
    );
  }
}
