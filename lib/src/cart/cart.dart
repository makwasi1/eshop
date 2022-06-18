import 'dart:ui';

import 'package:eshop/src/constants.dart';
import 'package:eshop/src/delivery/delivery.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const GeneralAppBar(title: "SHOPPING CART"),
      bottomNavigationBar: Material(
        elevation: kLess,
        color: kWhiteColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: FlatButton(
                padding: const EdgeInsets.symmetric(vertical: kLessPadding),
                color: kPrimaryColor,
                textColor: Colors.black,
                child:
                    const Text("View Cart", style: TextStyle(fontSize: 18.0)),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    //TODO:either return to home page or the cart page
                    builder: (context) => Cart(),
                  ),
                ),
              ),

              // child: Text("Total : UGX 97500",
              //     textAlign: TextAlign.center, style: kSubTextStyle)
            ),
            SizedBox(
              width: 5,
            ),
          
            Expanded(
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: kLessPadding),
                color: kDarkColor,
                textColor: kWhiteColor,
                child: Text("Checkout", style: TextStyle(fontSize: 18.0)),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DeliveryAddress(),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              padding: EdgeInsets.all(8.0),
              decoration: const BoxDecoration(),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(cartItems[index].image),
                    height: 70.0,
                    width: 70.0,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartItems[index].title,
                              maxLines: 2,
                              style: const TextStyle(
                                  height: 1.4,
                                  fontSize: kFixPadding,
                                  color: Colors.lightBlue)),
                          RichText(
                            textAlign: TextAlign.center,
                            softWrap: false,
                            overflow: TextOverflow.clip,
                            text: const TextSpan(
                                text: "Sold By: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                                children: [
                                  //get vendor name from the endpoint
                                  TextSpan(
                                      text: "Velocity Shop",
                                      style: TextStyle(
                                          height: 1.4,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 17))
                                ]),
                          ),
                          Text(
                            "3 X  \$ ${cartItems[index].price.toString()}",
                            style: TextStyle(height: 2.3),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     IconButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             if (cartItems[index].quantity > 0) {
                          //               cartItems[index].quantity--;
                          //             }
                          //           });
                          //         },
                          //         icon: const Icon(
                          //           Icons.remove_circle_outline,
                          //           color: kPrimaryColor,
                          //         )),
                          //     Container(
                          //         width: 44.0,
                          //         height: 44.0,
                          //         padding: EdgeInsets.only(top: 22.0),
                          //         color: kAccentColor,
                          //         child: TextField(
                          //           enabled: false,
                          //           textAlign: TextAlign.center,
                          //           decoration: InputDecoration(
                          //               border: InputBorder.none,
                          //               hintText: cartItems[index]
                          //                   .quantity
                          //                   .toString(),
                          //               hintStyle:
                          //                   TextStyle(color: kDarkColor)),
                          //         )),
                          //     IconButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             // Max 5
                          //             if (cartItems[index].quantity <= 4) {
                          //               cartItems[index].quantity++;
                          //             }
                          //           });
                          //         },
                          //         icon: const Icon(
                          //           Icons.add_circle_outline,
                          //           color: kPrimaryColor,
                          //         )),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                  //remove from cart
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                    color: kDarkColor,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
