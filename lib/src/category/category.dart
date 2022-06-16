
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/home/home.dart';
import 'package:eshop/src/signup/sign_in.dart';
import 'package:eshop/src/widgets/category_view.dart';
import 'package:eshop/src/widgets/categoty_items.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';


class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isList = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: "CATEGORIES",
        action: [
          IconButton(
            icon: isList ? Icon(Icons.apps) : Icon(Icons.list),
            onPressed: () {
              setState(() {
                isList = !isList;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.cancel_outlined),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Home(), //search page
              ),
            ),
          ),
        ],
      ),
      body: Categoryview(
        direction: Axis.horizontal,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: kWhiteColor,
        column: isList ? 1 : 2,
        ratio: isList ? 2.6 : 1.3,
        items: categoryList.length,
        itemBuilder: (context, index) {
          return CategoryItems(
            height: 150.0,
            width: MediaQuery.of(context).size.width,
            paddingHorizontal: 0.0,
            paddingVertical: 0.0,
            align: Alignment.center,
            radius: kLessPadding,
            blendMode: BlendMode.difference,
            color: kDarkColor,
            image: categoryList[index].image,
            title: categoryList[index].category,
            titleSize: 20.0,
            amount: "",
            amountSize: 0.0,
          );
        },
      ),
    );
  }
}
