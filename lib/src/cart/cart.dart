import 'dart:ui';

import 'package:eshop/src/bloc/cart_bloc/bloc/cart_bloc.dart';
import 'package:eshop/src/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/delivery/address_list.dart';
import 'package:eshop/src/delivery/delivery.dart';
import 'package:eshop/src/models/cart_model.dart';
import 'package:eshop/src/products/products.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:eshop/src/services/http_utils.dart';
import 'package:eshop/src/signup/sign_in.dart';
import 'package:eshop/src/widgets/circular_loading_widget.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool get isRecommended => null;
  Cart cartItem;
  bool hasToken;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartBlocState>(
      builder: (context, state) {
        if (state is CartLoadingState) {
          return const Center(
            child: CircularLoading(),
          );
        } else if (state is CartLoadedState) {
          if (state.cart?.formatedGrandTotal == null) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                elevation: kRadius,
                leading: IconButton(
                  padding: const EdgeInsets.only(left: kDefaultPadding),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BottomNavBar(0), //search page
                    ),
                  ),
                ),
                title: const Text(
                  'SHOPPING CART',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              body: const Center(child: Text("Cart is empty")),
            );
          } else {
            cartItem = state?.cart;
            return Scaffold(
              backgroundColor: kWhiteColor,
              appBar: const GeneralAppBar(title: "SHOPPING CART"),
              bottomNavigationBar: SizedBox(
                height: 100,
                child: Material(
                  elevation: kLess,
                  color: kWhiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: FlatButton(
                          padding: const EdgeInsets.symmetric(
                              vertical: kLessPadding),
                          color: Colors.white,
                          textColor: Colors.black,
                          child: Text("Sub Total:     ${cartItem.formatedGrandTotal}",
                              style: const TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w400)),
                          onPressed: () {}
                        ),

                        // child: Text("Total : UGX 97500",
                        //     textAlign: TextAlign.center, style: kSubTextStyle)
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: FlatButton(
                            padding: const EdgeInsets.symmetric(
                                vertical: kLessPadding),
                            color: kPrimaryColor,
                            textColor: kWhiteColor,
                            child: const Text("CHECKOUT",
                                style: TextStyle(fontSize: 18.0)),
                            onPressed: () {
                              setState((){
                                //check if user is logged in
                                 checkLogged(context);
                              
                              });
                            }),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
              body: Center(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: cartItem.items.length,
                  itemBuilder: (context, index) {
                    var product2 = cartItem.items[index].product;
                    var subTotal = cartItem.subTotal;
                    return Container(
                      margin: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(),
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(
                                product2.images[0].smallImageUrl),
                            height: 70.0,
                            width: 70.0,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, left: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product2.name,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          height: 1.4,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.lightBlue)),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    softWrap: false,
                                    overflow: TextOverflow.clip,
                                    text: TextSpan(
                                        text: "UGX",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                        children: [
                                          //get vendor name from the endpoint
                                          TextSpan(
                                              text: product2.formatedPrice
                                                  .replaceAll('UGX', ''),
                                              style: const TextStyle(
                                                  height: 1.4,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17))
                                        ]),
                                  ),
                                  // Text(
                                  //   "UGX ${product2.price}",
                                  //   style: const TextStyle(height: 2.3),
                                  // ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (cartItem
                                                      .items[index].quantity >
                                                  0) {
                                                cartItem
                                                    .items[index].quantity--;
                                              }
                                            });

                                            context.read<CartBloc>().add(
                                                CartUpdated(
                                                    cartItem.items[index].id
                                                        .toString(),
                                                    cartItem.items[index]
                                                        .quantity));
                                            updateSnack(context);
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                            color: kPrimaryColor,
                                          )),
                                      Container(
                                          width: 44.0,
                                          height: 44.0,
                                          padding: EdgeInsets.only(top: 22.0),
                                          color: kAccentColor,
                                          child: TextField(
                                            enabled: false,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: cartItem
                                                    .items[index].quantity
                                                    .toString(),
                                                hintStyle: const TextStyle(
                                                    color: kDarkColor)),
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              cartItem
                                                  .items[index].quantity++;
                                            });
                                            context.read<CartBloc>().add(
                                                CartUpdated(
                                                    cartItem.items[index].id
                                                        .toString(),
                                                    cartItem.items[index]
                                                        .quantity));
                                            updateSnack(context);
                                          },
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                            color: kPrimaryColor,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //remove from cart
                          IconButton(
                            onPressed: () {
                              context.read<CartBloc>().add(
                                  CartItemRemoved(cartItem.items[index].id));
                              updateSnack(context);
                            },
                            icon: const Icon(Icons.delete_outlined),
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
        } else if (state is CartEmptyState) {
          return const Scaffold(
            appBar: GeneralAppBar(
              title: "SHOPPING CART",
            ),
            body: Center(child: Text("Cart is empty")),
          );
        } else {
          return const Scaffold(
            appBar: GeneralAppBar(
              title: "SHOPPING CART",
            ),
            body: Center(child: Text("Cart is empty")),
          );
        }
      },
    );
  }

  void updateSnack(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
               const SnackBar(
                 content: Text('Cart Updated'),
                 duration: Duration(seconds: 2),
               ),
             );
  }

  Future<void> checkLogged(BuildContext context) async {
    FlutterSecureStorage storage =
        const FlutterSecureStorage();
    String token = await storage.read(
        key: HttpUtils.keyForJWTToken);
    
    if (token == null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SignIn(
              authRepository: AuthRepository()),
          // builder: (context) => const DeliveryAddress(),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          // builder: (context) => SignIn(authRepository: AuthRepository()),
          builder: (context) =>
              const DeliveryAddressList(),
        ),
      );
    }
  }
}
