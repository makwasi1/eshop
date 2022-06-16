import 'package:eshop/src/signup/components/default_button.dart';
import 'package:eshop/src/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SocialButton(
          icon: const FaIcon(FontAwesomeIcons.facebookF),
          onPressed: () {},
          color: Colors.blueAccent,
        ),
        const SizedBox(
          width: 10,
        ),
        SocialButton(
            icon: const FaIcon(FontAwesomeIcons.googlePlusG),
            onPressed: () {},
            color: Colors.red),
        const SizedBox(
          width: 10,
        ),
        SocialButton(
          icon: const FaIcon(FontAwesomeIcons.twitter),
          onPressed: () {},
          color: Colors.lightBlue,
        ),
        const SizedBox(
          width: 10,
        ),
        SocialButton(
          icon: const FaIcon(FontAwesomeIcons.instagram),
          onPressed: () {},
          color: Colors.pinkAccent,
        ),
      ],
    );
  }
}
