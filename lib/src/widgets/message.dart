import 'package:eshop/src/constants.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/empty_section.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  Message({Key key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kWhiteColor,
      appBar: GeneralAppBar(
        title: 'MESSAGES',
      ),
      body: EmptySection(
        emptyImg: chatBubble,
        emptyMsg: 'No message yet',
      ),
    );
  }
}
