
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/empty_section.dart';
import 'package:flutter/material.dart';


class Orders extends StatefulWidget {
  Orders({Key key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: 'My Orders',
        child: DefaultBackButton(),
      ),
      body: EmptySection(
        emptyImg: emptyOrders,
        emptyMsg: 'No orders yet',
      ),
    );
  }
}
