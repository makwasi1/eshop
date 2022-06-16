import 'package:eshop/src/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:eshop/src/signup/components/clear_full_button.dart';
import 'package:eshop/src/signup/components/default_button.dart';
import 'package:eshop/src/signup/sign_in.dart';
import 'package:flutter/material.dart';

class BottomWidgets extends StatefulWidget {
  const BottomWidgets({
    Key key,
  }) : super(key: key);

  @override
  State<BottomWidgets> createState() => _BottomWidgetsState();
}

class _BottomWidgetsState extends State<BottomWidgets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ 
        // ClearFullButton(
        //   darkText: 'Already have an account?',
        //   colorText: ' SignIn',
        //   onPressed: () => Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => SignIn())),
        // ),
      DefaultButton(
            btnText: 'Register',
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => BottomNavBar(0))),
          ),
        ],
    
    );
  }
}
