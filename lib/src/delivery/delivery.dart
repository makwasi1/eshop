// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:eshop/src/bloc/address/bloc/address_bloc.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/delivery/address_list.dart';
import 'package:eshop/src/services/address_rep.dart';
import 'package:eshop/src/signup/components/default_button.dart';
import 'package:eshop/src/widgets/header_label.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:eshop/src/widgets/shipping_method.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({Key key}) : super(key: key);

  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  final _address1 = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _postcode = TextEditingController();
  final _country = TextEditingController();
  final _phone = TextEditingController();
  AddressRepository add = AddressRepository();
  @override
  void initState() {
    // add.getAddresses();
    // add.addAddress(Address(address1: ['kisasi'], city: "New York", state: "NY", postcode: "10001", country: "USA", phone: "1234567890"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _onAddAddressButtonPressed() {
      context.read<AddressBloc>().add(
            AddressAddEvent(
              address: _address1.text,
              city: _city.text,
              state: _state.text,
              postcode: _postcode.text,
              country: _country.text,
              phone: _phone.text,
            ),
          );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const GeneralAppBar(
        title: "DELIVERY ADDRESS",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderLabel(
              headerText: "Where are your ordered items shipped?",
            ),
            FormField(
              address1: _address1,
              text: 'Address',
            ),
            const SizedBox(
              height: kFixPadding,
            ),
            FormField(
              address1: _city,
              text: 'City',
            ),
            const SizedBox(
              height: kFixPadding,
            ),
            FormField(
              address1: _state,
              text: 'State',
            ),
            const SizedBox(
              height: kFixPadding,
            ),
            FormField(
              address1: _postcode,
              text: 'Post Code',
            ),
            const SizedBox(
              height: kFixPadding,
            ),
            FormField(
              address1: _country,
              text: 'Country',
            ),
            const SizedBox(
              height: kFixPadding,
            ),
            FormField(
              address1: _phone,
              text: 'Phone Number',
            ),
            DefaultButton(
              btnText: "Proceed to payment",
              onPressed: () {
                // setState(() {
                //   add.addAddress(_address1.text, _city.text, _country.text, _phone.text,
                //     _postcode.text, _state.text);
                // });
                context.read<AddressBloc>().add(AddressAddEvent(
                      address: _address1.text,
                      city: _city.text,
                      state: _state.text,
                      postcode: _postcode.text,
                      country: _country.text,
                      phone: _phone.text,
                    ));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ShippingMethod(),
                //   ),
                // );

                Future.delayed(Duration(seconds: 2), () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DeliveryAddressList()));
                });
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DeliveryAddressList(),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FormField extends StatelessWidget {
  const FormField({
    Key key,
    @required TextEditingController address1,
    @required this.text,
  })  : _address1 = address1,
        super(key: key);

  final TextEditingController _address1;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
          fontSize: 14.0, color: kDarkColor, fontWeight: FontWeight.bold),
      controller: _address1,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(
          EvaIcons.map,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(30.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(30.0)),
        contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
        labelText: text,
        hintStyle: const TextStyle(
            fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w500),
        labelStyle: const TextStyle(
            fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
    );
  }
}
