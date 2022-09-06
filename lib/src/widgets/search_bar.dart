import 'package:eshop/src/constants.dart';
import 'package:eshop/src/signup/sign_in.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.0,
      width:MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(left: 0.5, right: 5.0),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: kFixPadding),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child:  TextField(
        onChanged: (value) => print(value),
        decoration: const InputDecoration(
          hintText: "Search product",
          hintStyle: TextStyle(color: kDarkColor),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: kDarkColor,
          ),
        ),
      ),
    );
  }
}
