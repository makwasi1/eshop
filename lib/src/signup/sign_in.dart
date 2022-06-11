import 'package:eshop/src/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/landing/components/top_logo.dart';
import 'package:flutter/material.dart';

import 'components/clear_full_button.dart';
import 'components/default_button.dart';
import 'components/default_text_field.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          leading: IconButton(
            splashRadius: 20,
            icon: Icon(Icons.close_rounded, size: 25, color: Colors.black),
            onPressed: ()=> Navigator.pop(context),
          ),
          actions: [
            TextButton(
              child: ClearFullButton(darkText: 'Register'),
              onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignIn())),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TopLogo(),
              SizedBox(height: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const DefaultTextField(
                      obscureText: false,
                      hintText: 'Email address',
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: kFixPadding),
                    const DefaultTextField(
                      obscureText: true,
                      hintText: 'Password',
                      icon: Icons.lock,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: kFixPadding),
                    
                    DefaultButton(
                      btnText: 'Sign In',
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => BottomNavBar(0))),
                    ),
                    ClearFullButton(
                      darkText: 'I forgot my',
                      colorText: ' Password?',
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => SignIn()
                              //  builder: (context) => ForgotPassword()
                              )),
                    ),
                    // ClearFullButton(
                    //   darkText: "Don't have an account?",
                    //   colorText: ' SignUp.',
                    //   onPressed: () => Navigator.of(context).push(
                    //       MaterialPageRoute(builder: (context) => SignUp())),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
