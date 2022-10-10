import 'package:eshop/src/account/account.dart';
import 'package:eshop/src/bloc/address/bloc/address_bloc.dart';
import 'package:eshop/src/bloc/cart_bloc/bloc/cart_bloc.dart';
import 'package:eshop/src/cart/cart.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:badges/badges.dart';
import 'package:getwidget/getwidget.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
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
  State<DefaultAppBar> createState() => _DefaultAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(46.0);
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Size get preferredSize => Size.fromHeight(46.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: kPrimaryColor,
      elevation: kRadius,
      title: SearchBar(),
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: kDarkColor),
      // leading: const Image(image: AssetImage(logo)),
      actions: [
        CartBadge(),
        CartNewWidget(),
      ],
    );
  }
}

class CartNewWidget extends StatelessWidget {
  CartNewWidget({
    Key key,
  }) : super(key: key);

  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartBlocState>(
      builder: (context, state) {
        if (state is CartLoadedState) {
          if (state.cart?.itemsCount == null) {
            itemCount = 0;
          } else {
            itemCount = state.cart.itemsCount;
          }
          itemCount = state.cart?.itemsCount;
          return Badge(
            // will be updated by the cart state incase of increase
            badgeContent: Text('$itemCount',
                style: const TextStyle(color: Colors.white, fontSize: 20)),
            badgeColor: Colors.black,
            position: BadgePosition.bottomEnd(bottom: 19, end: 10),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            child: IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              iconSize: 35.0,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartScreen(), //search page
                ),
              ),
            ),
          );
        }
        return Badge(
          // will be updated by the cart state incase of increase
          badgeContent: const Text("0",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          badgeColor: Colors.black,
          position: BadgePosition.bottomEnd(bottom: 19, end: 10),
          animationDuration: Duration(milliseconds: 300),
          animationType: BadgeAnimationType.slide,
          child: IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            iconSize: 35.0,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CartScreen(), //search page
              ),
            ),
          ),
        );
      },
    );
  }
}

class CartBadge extends StatefulWidget {
  const CartBadge({
    Key key,
  }) : super(key: key);

  @override
  State<CartBadge> createState() => _CartBadgeState();
}

class _CartBadgeState extends State<CartBadge> {
  @override
  Widget build(BuildContext context) {
    int wishNo = 0;
    return BlocListener<AddressBloc, AddressState>(
      listener: (context, state) {
        if (state is AddWishLIstItemState) {
          // wishNo = state.wishItem.data.length;
          print("wishNo $wishNo");
          setState(() {
            wishNo = state.wishItem.data.length;
          
          });
        }
      
      },
      child: Badge(
        // will be updated by the cart state incase of increase
        badgeContent: Text("$wishNo",
            style: const TextStyle(color: Colors.white, fontSize: 20)),
        badgeColor: Colors.black,
        position: BadgePosition.bottomEnd(bottom: 19, end: 10),
        animationDuration: Duration(milliseconds: 300),
        animationType: BadgeAnimationType.slide,
        child: IconButton(
          icon: const Icon(Icons.favorite_border_outlined),
          iconSize: 35.0,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CartScreen(), //search page
            ),
          ),
        ),
      ),
    );
  }
}
