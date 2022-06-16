import 'package:eshop/src/chat/chat.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/signup/components/default_button.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/empty_section.dart';
import 'package:eshop/src/widgets/sub_title.dart';
import 'package:flutter/material.dart';

class CallCenter extends StatefulWidget {
  CallCenter({Key key}) : super(key: key);

  @override
  _CallCenterState createState() => _CallCenterState();
}

class _CallCenterState extends State<CallCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const DefaultAppBar(
        title: "Call Center",
        child: DefaultBackButton(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const EmptySection(
            emptyImg: callCenter,
            emptyMsg: "We're happy to help you!",
          ),
          const SubTitle(
            subTitleText: "If you have complain about the product chat me",
          ),
          DefaultButton(
            btnText: "Chat Me",
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Chat(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
