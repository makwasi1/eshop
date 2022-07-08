import 'package:badges/badges.dart';
import 'package:eshop/src/constants.dart';
import 'package:flutter/material.dart';

class RecommendedItems extends StatelessWidget {
  final double height, price, rating, top, bottom, left, right, radius;
  final String image, title;
  final int sale;
  const RecommendedItems({
    Key key,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  image: AssetImage(image),
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
                "\$ ${price.toString()}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  Text(
                    "${sale.toString()} Sale",
                    style: TextStyle(
                      color: kDarkColor.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 10,
            //   width: 10,
            // ),
            Container(
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
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
