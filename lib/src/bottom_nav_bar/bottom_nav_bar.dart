import 'package:eshop/src/account/account.dart';
import 'package:eshop/src/cart/cart.dart';
import 'package:eshop/src/category/category.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/home/home.dart';
import 'package:eshop/src/search/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  int currentIndex;
  BottomNavBar(this.currentIndex);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // int _currentIndex = 0;

  final List<Widget> _children = [
    Home(),
    Category(),
    Search(),
    Cart(),
    
  ];

  void onTapTapped(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: _children[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapTapped,
        currentIndex: widget.currentIndex,
        elevation: kLess,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kLightColor,
        backgroundColor: kWhiteColor,
        // showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_outlined,
              size: 30,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
