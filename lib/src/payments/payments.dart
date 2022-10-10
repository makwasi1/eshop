import 'package:eshop/src/constants.dart';
import 'package:eshop/src/services/cart_repo.dart';
import 'package:eshop/src/signup/components/default_button.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/header_label.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:eshop/src/widgets/success.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  CartRepository cartRepo = CartRepository();
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const GeneralAppBar(
        title: 'PAYMENT',
        
      ),
      body: Column(
        children: [
          const HeaderLabel(
            headerText: 'Choose your payment method.',
          ),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: kPrimaryColor,
                    value: index,
                    groupValue: value,
                    onChanged: (i) => setState(() => value = i),
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: TextStyle(color: kDarkColor),
                  ),
                  trailing: Icon(paymentIcons[index], color: kPrimaryColor),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          DefaultButton(
            btnText: 'Save Order',
            onPressed: (){
              cartRepo.saveOrder();
              Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Success(),
              ),
            );
            } 
          ),
        ],
      ),
    );
  }
}
