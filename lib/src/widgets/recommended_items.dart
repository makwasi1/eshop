import 'package:eshop/src/bloc/address/bloc/address_bloc.dart';
import 'package:eshop/src/bloc/cart_bloc/bloc/cart_bloc.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:eshop/src/services/cart_repo.dart';
import 'package:eshop/src/services/http_utils.dart';
import 'package:eshop/src/services/products_repo.dart';
import 'package:eshop/src/signup/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RecommendedItems extends StatefulWidget {
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
  State<RecommendedItems> createState() => _RecommendedItemsState();
}

class _RecommendedItemsState extends State<RecommendedItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: Container(
          margin: EdgeInsets.only(
            top: widget.top,
            bottom: widget.bottom,
            left: widget.left,
            right: widget.right,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(color: kWhiteColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border),
                      iconSize: 30,
                      onPressed: () {
                        //add to wishlist
                        checkLogged(context, widget.item);
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 5, left: 50),
                    child: Icon(
                      Icons.compare_arrows,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Container(
                height: widget.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widget.radius),
                    topRight: Radius.circular(widget.radius),
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
                  widget.title,
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
                  widget.price.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
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
                              text: widget.rating.toString(),
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
              SizedBox(
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
                    checkLogged2(context, widget.item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

Future<void> checkLogged(BuildContext context, int id) async {
  final token = await AuthRepository().getCurrentUserToken();
  bool isTokenExpired = JwtDecoder.isExpired(token);

  if (isTokenExpired || token == null) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor:  Colors.orange,
      content: Text("Please login to add to wishlist."),
      duration: Duration(seconds: 1),
    ));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignIn(authRepository: AuthRepository()),
      ),
    );
  } else {
    // ProductRepository().addToWishList(id);
    context.read<AddressBloc>().add(AddWishLIstItemEvent(id));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: kPrimaryColor,
      content: Text("Successfully added to wishlist."),
      duration: Duration(seconds: 1),
    ));
  }
}

Future<void> checkLogged2(BuildContext context, int id) async {
  final token = await AuthRepository().getCurrentUserToken();
  // bool isTokenExpired = JwtDecoder.isExpired(token);

  if (token == null) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.orange,
      content: Text("Please login to add to cart!!."),
      duration: Duration(seconds: 1),
    ));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignIn(authRepository: AuthRepository()),
      ),
    );
  } else{
    context.read<CartBloc>().add(CartItemAdded(id));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: kPrimaryColor,
      content: Text("Successfully added to cart."),
      duration: Duration(seconds: 1),
    ));
  }
}
