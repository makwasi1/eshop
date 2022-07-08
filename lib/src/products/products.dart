import 'package:eshop/src/constants.dart';
import 'package:eshop/src/products/product_details.dart';
import 'package:eshop/src/widgets/category_view.dart';
import 'package:eshop/src/widgets/categoty_items.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/recommended_items.dart';
import 'package:eshop/src/widgets/recommended_view.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  bool isRecommended;
  Products(this.isRecommended);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: widget.isRecommended ? "RECOMENDED" : "WEEK PROMOTION",
        child: DefaultBackButton(),
      ),
      body: widget.isRecommended
          ? RecommendedView(
              direction: Axis.vertical,
              heights: MediaQuery.of(context).size.height,
              widths: MediaQuery.of(context).size.width,
              top: 0.0,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              column: 2,
              ratio: 0.8,
              items: recommendedList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(),
                    ),
                  ),
                  child: RecommendedItems(
                    height: 165.0,
                    radius: 8.0,
                    top: 4.0,
                    bottom: 4.0,
                    left: 6.0,
                    right: 6.0,
                    image: recommendedList[index].image,
                    title: recommendedList[index].title,
                    price: recommendedList[index].price,
                    rating: recommendedList[index].rating,
                    sale: recommendedList[index].sale,
                  ),
                );
              },
            )
          : Categoryview(
              direction: Axis.vertical,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: kWhiteColor,
              column: 2,
              ratio: 1.0,
              items: categoryList.length,
              itemBuilder: (context, index) {
                return CategoryItems(
                  height: MediaQuery.of(context).size.height,
                  width: 400.0,
                  paddingVertical: 4.0,
                  paddingHorizontal: 16.0,
                  radius: 0.0,
                  image: categoryList[index].image,
                  amount: "10%",
                  lblColor: kPrimaryColor,
                  align: Alignment.topRight,
                );
              },
            ),
    );
  }
}
