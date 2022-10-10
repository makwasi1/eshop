
import 'package:eshop/src/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/signup/components/default_button.dart';
import 'package:eshop/src/widgets/empty_section.dart';
import 'package:eshop/src/widgets/sub_title.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  Success({Key key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySection(
            emptyImg: success,
            emptyMsg: 'Successful !!',
          ),
          SubTitle(
            subTitleText: 'Your order was done successfully placed',
          ),
          DefaultButton(
            btnText: 'Ok',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BottomNavBar(0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
