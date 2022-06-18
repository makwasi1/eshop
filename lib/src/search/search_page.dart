import 'package:eshop/src/constants.dart';
import 'package:eshop/src/widgets/chip.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/header_label.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:eshop/src/widgets/recommended_items.dart';
import 'package:eshop/src/widgets/recommended_view.dart';
import 'package:eshop/src/widgets/sticky_label.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: GeneralAppBar(title: "SEARCH"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HeaderLabel(
            //   headerText:
            //       "Hello, i am E-Commerce. What would you like to search?",
            // ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(width: 4.0, color: kAccentColor),
              ),
              child: TextField(
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: const Icon(
                    Icons.search,
                    color: kDarkColor,
                    size: 29.0,
                  ),
                  hintText: "Search Something...",
                  hintStyle: TextStyle(
                    fontSize: 18.0,
                    color: kLightColor.withOpacity(0.4),
                  ),
                ),
              ),
            ),
            StickyLabel(
              text: "Popular Keyword",
              textColor: kLightColor.withOpacity(0.4),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 16.0,
                left: kFixPadding,
                right: kDefaultPadding,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List<Widget>.generate(
                    chipsCategory.length,
                    (int index) {
                      return Chips(text: chipsCategory[index]);
                    },
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 8.0,
                left: kFixPadding,
                right: kDefaultPadding,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List<Widget>.generate(
                    chipsMobile.length,
                    (int index) {
                      return Chips(text: chipsMobile[index]);
                    },
                  ),
                ),
              ),
            ),
            StickyLabel(
              text: "Favorite",
              textColor: kLightColor.withOpacity(0.4),
            ),
            RecommendedView(
              direction: Axis.horizontal,
              heights: 210.0,
              widths: MediaQuery.of(context).size.width,
              top: 16.0,
              bottom: 4.0,
              left: kDefaultPadding,
              right: kDefaultPadding,
              column: 1,
              ratio: 1.4,
              items: recommendedList.length,
              itemBuilder: (context, index) {
                return RecommendedItems(
                  height: 130.0,
                  top: 0.0,
                  bottom: 0.0,
                  left: 0.0,
                  right: kLessPadding,
                  radius: kLessPadding,
                  image: recommendedList[index].image,
                  title: recommendedList[index].title,
                  price: recommendedList[index].price,
                  rating: recommendedList[index].rating,
                  sale: recommendedList[index].sale,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
