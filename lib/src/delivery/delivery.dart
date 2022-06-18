

import 'package:eshop/src/constants.dart';
import 'package:eshop/src/payments/payments.dart';
import 'package:eshop/src/signup/components/default_button.dart';
import 'package:eshop/src/signup/components/default_text_field.dart';
import 'package:eshop/src/signup/sign_in.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/header_label.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:flutter/material.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({Key key}) : super(key: key);

  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const GeneralAppBar(
        title: "DELIVERY ADDRESS",
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderLabel(
              headerText: "Where are your ordered items shipped?",
            ),
            DefaultTextField(
              hintText: "State",
              icon: Icons.map,
              obscureText: false,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: kFixPadding,
            ),
            DefaultTextField(
              hintText: "City",
              icon: Icons.location_city,
              obscureText: false,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: kFixPadding,
            ),
            DefaultTextField(
              hintText: "Locality",
              icon: Icons.landscape,
              obscureText: false,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: kFixPadding,
            ),
            DefaultTextField(
              hintText: "Pincode",
              icon: Icons.location_city,
              obscureText: false,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            DefaultButton(
              btnText: "Go to payment",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  // builder: (context) => SignIn(),
                  builder: (context) => Payment(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
