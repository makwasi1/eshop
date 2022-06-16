import 'package:eshop/src/account/account.dart';
import 'package:eshop/src/cart/cart.dart';
import 'package:eshop/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:badges/badges.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final action;
  const DefaultAppBar({
    Key key,
    this.title,
    this.child,
    this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: kPrimaryColor,
      elevation: kRadius,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: kDarkColor),
      leading: const Image(image: AssetImage(logo)),
      actions: [
        Badge(
          // will be updated by the cart state incase of increase
          badgeContent: const Text("0",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          badgeColor: Colors.black,
          position: BadgePosition.bottomEnd(bottom: -2, end: 10),
          animationDuration: Duration(milliseconds: 300),
          animationType: BadgeAnimationType.slide,
          child: IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            iconSize: 45.0,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Cart(), //search page
              ),
            ),
          ),
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.user),
          iconSize: 35.0,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Account(), //search page
            ),
          ),
        ),
      ],
    );
  }
}
