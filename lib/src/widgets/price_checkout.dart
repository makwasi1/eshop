import 'package:eshop/src/cart/cart.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/delivery/delivery.dart';
import 'package:flutter/material.dart';

class CheckoutButton extends StatefulWidget {
  const CheckoutButton({Key key}) : super(key: key);

  @override
  State<CheckoutButton> createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(color: Colors.black),
                  primary: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: kLessPadding),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                
                child:
                    const Text("View Cart", style: TextStyle(fontSize: 18.0)),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    //TODO:either return to home page or the cart page
                    builder: (context) => CartScreen(),
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
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(color: Colors.black),
                  primary: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: kLessPadding),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: const Text("Checkout", style: TextStyle(fontSize: 18.0)),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DeliveryAddress(),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        )
      ]),
    );
  }
}
