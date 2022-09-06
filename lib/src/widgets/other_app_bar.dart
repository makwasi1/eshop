import 'package:eshop/src/constants.dart';
import 'package:flutter/material.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const GeneralAppBar({Key key, this.title}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(46.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      automaticallyImplyLeading: true,
      title: Center(child: Text(title, textAlign: TextAlign.center)),

      //   actions: [
      //     IconButton(
      //         color: Colors.black,
      //         icon: const Icon(Icons.close),
      //         onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar(0))),
      // )],
    );
  }
}
