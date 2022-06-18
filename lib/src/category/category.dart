import 'package:eshop/src/constants.dart';
import 'package:eshop/src/home/home.dart';
import 'package:eshop/src/signup/sign_in.dart';
import 'package:eshop/src/widgets/category_view.dart';
import 'package:eshop/src/widgets/categoty_items.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isList = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: GeneralAppBar(
        title: "CATEGORIES",
      ),
      body: const Categoryview(),
    );
  }
}
