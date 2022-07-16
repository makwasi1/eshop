import 'package:eshop/src/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/landing/components/top_logo.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/social_buttons.dart';
import 'package:flutter/material.dart';

import 'components/clear_full_button.dart';
import 'components/default_button.dart';
import 'components/default_text_field.dart';

class SignIn extends StatefulWidget {
  AuthRepositoryService _authRepositoryService;
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthRepository auth = AuthRepository();
  @override
  void initState() {
    auth.login('crisengoma12@gmail.com', '@makwasi12');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0.4,
          title: Text(
            "Sign In",
            style: TextStyle(color: kDarkColor, fontSize: 35),
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TopLogo(),
              const SizedBox(height: 150),
              const Padding(
                padding: EdgeInsets.only(left: 24, bottom: 5),
                child: Text(
                  "Login In Your Account",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                  ),
                  // textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const DefaultTextField(
                obscureText: false,
                hintText: 'Email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: kFixPadding),
              const DefaultTextField(
                obscureText: true,
                hintText: 'Please enter password',
                icon: Icons.lock,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: kFixPadding),
              DefaultButton(btnText: 'Login', onPressed: () {}),

              // ClearFullButton(
              //   darkText: 'I forgot my',
              //   colorText: ' Password?',
              //   onPressed: () => Navigator.of(context)
              //       .push(MaterialPageRoute(builder: (context) => SignIn()
              //           //  builder: (context) => ForgotPassword()
              //           )),
              // ),
              const Padding(
                padding: EdgeInsets.only(left: 24, bottom: 10),
                child: Text(
                  "Connect with:",
                  style: TextStyle(fontSize: 17),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                ),
              ),
              const SocialMedia(),
            ],
          ),
        )));
  }
}
