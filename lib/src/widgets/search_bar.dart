
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/signup/sign_in.dart';
import 'package:flutter/material.dart';


class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SignIn(),
        ),
      ),
      child: Container(
        height: 34.0,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: kFixPadding),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: kPrimaryColor),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Search...",
                style: TextStyle(
                  color: kLightColor,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}