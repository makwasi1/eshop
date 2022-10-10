// ignore_for_file: constant_identifier_names

import 'package:eshop/src/payments/payments.dart';
import 'package:eshop/src/services/cart_repo.dart';
import 'package:eshop/src/signup/components/default_button.dart';
import 'package:eshop/src/widgets/header_label.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:flutter/material.dart';

enum PaymentMethod{cashondelivery, paypal, flutterwave, moneytransfer}
class ShippingMethod extends StatefulWidget {
  const ShippingMethod({ Key key }) : super(key: key);

  @override
  State<ShippingMethod> createState() => _ShippingMethodState();
}

class _ShippingMethodState extends State<ShippingMethod> {
CartRepository cartRepo = CartRepository();
  
   String method = "flatrate_flatrate";
   PaymentMethod paymentMethod = PaymentMethod.cashondelivery;
   final _code = TextEditingController();
   
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const GeneralAppBar(
        title: 'SHIPPING METHOD',
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(),
          child: Column(
          children: <Widget>[
            const HeaderLabel(
              headerText: 'Select Shipping Method',
            ),
            
            ListTile(
              title: const Text('Flat Rate'),
              leading: Radio<String>(
                value: "flatrate_flatrate",
                groupValue: method,
                onChanged: (String value) {
                  setState(() {
                    method = value;
                    print(method);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Free Shipping'),
              leading: Radio<String>(
                value: "free_shipping",
                groupValue: method,
                onChanged: (String value) {
                  setState(() {
                    method = value;
                    print(method);
                  });
                },
              ),
            ),
            const Divider(),        
             const HeaderLabel(
              headerText: 'Select Payment Method',
            ),
                 ListTile(
              title: const Text('Flutter Wave'),
              leading: GestureDetector(
                child: Radio<PaymentMethod>(
                  value: PaymentMethod.flutterwave,
                  groupValue: paymentMethod,
                  onChanged: (PaymentMethod value) {
                    setState(() {
                      paymentMethod = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    cartRepo.addPaymentMethod(paymentMethod.toString());
                  });
                },
              ),
            ),
              
            ListTile(
              title: const Text('Cash on Delivery'),
              leading: Radio<PaymentMethod>(
                value: PaymentMethod.cashondelivery,
                groupValue: paymentMethod,
                onChanged: (PaymentMethod value) {
                  setState(() {
                    paymentMethod = value;
                    print(paymentMethod);
                  });
                },
              ),
            ),
              
            ListTile(
              title: const Text('Money Trasnfer'),
              leading: Radio<PaymentMethod>(
                value: PaymentMethod.moneytransfer,
                groupValue: paymentMethod,
                onChanged: (PaymentMethod value) {
                  setState(() {
                    paymentMethod = value;
                    print(paymentMethod.toString().substring(14));
                  });
                },
              ),
            ),
              
            ListTile(
              title: const Text('Paypal'),
              leading: Radio<PaymentMethod>(
                value: PaymentMethod.paypal,
                groupValue: paymentMethod,
                onChanged: (PaymentMethod value) {
                  setState(() {
                    paymentMethod = value;
                    print(paymentMethod);
                  });
                },
              ),
            ),
              
            const Divider(),
            // const HeaderLabel(
            //   headerText: 'Apply Coupon',
            // ),
              
            // TextFormField(
            //   decoration: const InputDecoration(
            //     labelText: 'Enter Coupon Code',
            //   ),
            //   controller: _code,
            // ),
            //button
            // const SizedBox(height: 20),
            DefaultButton(
              btnText: 'CONTINUE',
              onPressed: () {
                setState(() {
                  cartRepo.addShippingMethod(method);
                  cartRepo.addPaymentMethod(paymentMethod.toString().substring(14));
                  // cartRepo.applyCoupon(_code.text);
                });

                Navigator.push(context, MaterialPageRoute(builder: (context) =>  Payment()));
                // Navigator.pushNamed(context, Payments.routeName);
              },
            ),
          ],
            ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class PaymentOptions extends StatefulWidget {
    const PaymentOptions({ Key key }) : super(key: key);
  
    @override
    State<PaymentOptions> createState() => _PaymentOptionsState();
  }
  
  class _PaymentOptionsState extends State<PaymentOptions> {
    String paymentMethod = "cashondelivery";
    CartRepository cartRepo = CartRepository();
  @override
    @override
    Widget build(BuildContext context) {
      return Column(
        children: <Widget>[
          const HeaderLabel(
          headerText: 'Select Payment Method',
        ),
             ListTile(
          title: const Text('Flutter Wave'),
          leading: GestureDetector(
            child: Radio<String>(
              value: "flutterwave",
              groupValue: paymentMethod,
              onChanged: (String value) {
                setState(() {
                  paymentMethod = value;
                });
              },
            ),
            onTap: () {
              setState(() {
                cartRepo.addPaymentMethod(paymentMethod);
              });
            },
          ),
        ),

        ListTile(
          title: const Text('Cash on Delivery'),
          leading: Radio<String>(
            value: "cashondelivery",
            groupValue: paymentMethod,
            onChanged: (String value) {
              setState(() {
                paymentMethod = value;
                print(paymentMethod);
              });
            },
          ),
        ),

        ListTile(
          title: const Text('Money Trasnfer'),
          leading: Radio<String>(
            value: "moneytransfer",
            groupValue: paymentMethod,
            onChanged: (String value) {
              setState(() {
                paymentMethod = value;
                print(paymentMethod);
              });
            },
          ),
        ),

        ListTile(
          title: const Text('Paypal'),
          leading: Radio<String>(
            value: "paypal_standard",
            groupValue: paymentMethod,
            onChanged: (String value) {
              setState(() {
                paymentMethod = value;
                print(paymentMethod);
              });
            },
          ),
        ),

        
        ]
       
      );
    }
  }