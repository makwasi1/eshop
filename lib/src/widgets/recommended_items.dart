import 'package:eshop/src/bloc/cart_bloc/bloc/cart_bloc.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:eshop/src/services/cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedItems extends StatelessWidget {
  final double height, top, bottom, left, right, radius, width;
  final String price, rating;
  final String image;
  final String title;
  final int sale;
  final int item;
  final Function onPress;
  const RecommendedItems(
      {Key key,
      this.height,
      this.image,
      this.price,
      this.rating,
      this.title,
      this.sale,
      this.top,
      this.bottom,
      this.left,
      this.right,
      this.radius,
      this.onPress,
      this.item,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Container(
          margin: EdgeInsets.only(
            top: top,
            bottom: bottom,
            left: left,
            right: right,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: kWhiteColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Icon(
                      Icons.favorite_border,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5, left: 65),
                    child: Icon(
                      Icons.compare_arrows,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Container(
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                  ),
                ),
              ),
              // ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  right: kLessPadding,
                  left: kLessPadding,
                ),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: kDarkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: kLessPadding,
                  left: kLessPadding,
                ),
                child: Text(
                  price.toString(),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: kLessPadding,
                  left: kLessPadding,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: rating.toString(),
                              style: TextStyle(
                                color: kDarkColor.withOpacity(0.4),
                              ),
                            ),
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.top,
                              child: Icon(
                                Icons.star,
                                size: 16.0,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Text(
                    //   "${sale.toString()} Sale",
                    //   style: TextStyle(
                    //     color: kDarkColor.withOpacity(0.4),
                    //   ),
                    // ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10,
              //   width: 10,
              // ),
              BlocBuilder<CartBloc, CartBlocState>(
                builder: (context, state) {
                  if (state is CartLoadedState) {
                    return SizedBox(
                      height: 30,
                      width: 150,
                      child: MaterialButton(
                        color: kPrimaryColor,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.add_shopping_cart,
                              color: kWhiteColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "ADD TO CART",
                              style: TextStyle(color: kWhiteColor, fontSize: 14),
                            ),
                          ],
                        ),
                        onPressed: () {
                          context.read<CartBloc>().add(CartItemAdded(item));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: kPrimaryColor,
                            content: Text("Successfully added to cart.",
                                style: TextStyle(color: kWhiteColor),
                                textAlign: TextAlign.center),
                            duration: Duration(seconds: 1),
                          ));
                        },
                      ),
                    );
                  } else if (state is CartEmptyState) {
                    return SizedBox(
                      height: 30,
                      width: 150,
                      child: MaterialButton(
                        color: kPrimaryColor,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.add_shopping_cart,
                              color: kWhiteColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "ADD TO CART",
                              style: TextStyle(color: kWhiteColor, fontSize: 14),
                            ),
                          ],
                        ),
                        onPressed: ()  {
                          
                          
                          context.read<CartBloc>().add(CartItemAdded(item));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: kPrimaryColor,
                            content: Text("Successfuly added to cart."),
                            duration: Duration(seconds: 1),
                          ));
                        },
                      ),
                    );
                  }
                  return SizedBox(
                    height: 30,
                    width: 150,
                    child: MaterialButton(
                        color: kPrimaryColor,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.add_shopping_cart,
                              color: kWhiteColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "ADD TO CART",
                              style: TextStyle(color: kWhiteColor, fontSize: 14),
                            ),
                          ],
                        ),
                        onPressed: () {
                          //show snackbar
                          context.read<CartBloc>().add(CartItemAdded(item));
                          // CartRepository().addToCart(item,1);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: kPrimaryColor,
                            content: Text("Successfuly added to cart."),
                            duration: Duration(seconds: 1),
                          ));
                        }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
