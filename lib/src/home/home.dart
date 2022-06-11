import 'dart:async';

import 'package:eshop/src/constants.dart';
import 'package:eshop/src/notifications/notification_list.dart';
import 'package:eshop/src/widgets/message.dart';
import 'package:eshop/src/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentIndex < sliderImages.length) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: SearchBar(),
        actions: [
          IconButton(
            icon: Icon(Icons.message, color: kWhiteColor),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Message(),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: kWhiteColor),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NotificationList(),
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}