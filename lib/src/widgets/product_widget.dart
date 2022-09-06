import 'package:eshop/src/models/products_model.dart';
import 'package:eshop/src/products/product_details.dart';
import 'package:eshop/src/widgets/recommended_items.dart';
import 'package:eshop/src/widgets/recommended_view.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key key,
    @required this.productItem,
  }) : super(key: key);

  final List<Products> productItem;

  @override
  Widget build(BuildContext context) {
    // final isInCart = state.cart.items.products.contains();
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: RecommendedView(
        direction: Axis.horizontal,
        heights: 315.0,
        widths: MediaQuery.of(context).size.width,
        top: 0.0,
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        column: 1,
        ratio: 1.8,
        items: 8,
        itemBuilder: (context, index) {
          return RecommendedItems(
            height: 145.0,
            radius: 8.0,
            top: 8.0,
            bottom: 8.0,
            left: 4.0,
            right: 4.0,
            image: productItem[index].baseImage.smallImageUrl,
            title: productItem[index].name,
            price: productItem[index].formatedPrice,
            rating: productItem[index].formatedPrice,
            sale: productItem[index].reviews.total,
            item: productItem[index].id,
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetails(productItem[index].id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
