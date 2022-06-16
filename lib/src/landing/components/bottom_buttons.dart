import 'package:eshop/src/constants.dart';
import 'package:eshop/src/landing/components/outline_default_button.dart';
import 'package:eshop/src/signup/sign_in.dart';
import 'package:eshop/src/signup/sign_up.dart';
import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          OutlineDefaultButton(
            btnText: 'Sign Up',
            press: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SignUp(),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          OutlineDefaultButton(
            btnText: 'Sign In',
            press: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SignIn(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
