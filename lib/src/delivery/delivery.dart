

import 'package:eshop/src/constants.dart';
import 'package:eshop/src/models/address_model.dart';
import 'package:eshop/src/payments/payments.dart';
import 'package:eshop/src/services/address_rep.dart';
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
  AddressRepository add = AddressRepository();
  @override
  void initState() {
    // add.getAddresses();
    add.addAddress(Address(address1: ['kisasi'], city: "New York", state: "NY", postcode: "10001", country: "USA", phone: "1234567890"));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const GeneralAppBar(
        title: "DELIVERY ADDRESS",
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children:  [
            const HeaderLabel(
              headerText: "Where are your ordered items shipped?",
            ),
            const DefaultTextField(
              hintText: "State",
              icon: Icons.map,
              obscureText: false,
              keyboardType: TextInputType.text,
            ),
             const SizedBox(
              height: kFixPadding,
            ),
             const DefaultTextField(
              hintText: "City",
              icon: Icons.location_city,
              obscureText: false,
              keyboardType: TextInputType.text,
            ),
             const SizedBox(
              height: kFixPadding,
            ),
            const DefaultTextField(
              hintText: "Locality",
              icon: Icons.landscape,
              obscureText: false,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: kFixPadding,
            ),
            const DefaultTextField(
              hintText: "Pincode",
              icon: Icons.location_city,
              obscureText: false,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            DefaultButton(
              btnText: "Proceed to payment",
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
