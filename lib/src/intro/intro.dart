
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/intro/components/intro_data.dart';
import 'package:flutter/material.dart';

import 'components/empty_app_bar.dart';
import 'components/intro_bottom.dart';

class Intro extends StatefulWidget {
  const Intro({Key key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  var _controller = PageController();
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page.round();
      });
    });
    return Scaffold(
      backgroundColor: kAccentColor,
      appBar: EmptyAppBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: introData.length,
              itemBuilder: (context, index) => IntroData(
                introImage: introData[index]['image'],
                headText: introData[index]['headText'],
                descText: introData[index]['descText'],
              ),
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
            ),
          ),
          IntroBottom(currentPage: _currentPage)
        ],
      ),
    );
  }
}
