import 'package:eshop/src/bloc/products/product_bloc.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/models/products_model.dart';
import 'package:eshop/src/products/product_details.dart';
import 'package:eshop/src/widgets/category_view.dart';
import 'package:eshop/src/widgets/categoty_items.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:eshop/src/widgets/recommended_items.dart';
import 'package:eshop/src/widgets/recommended_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatefulWidget {
  bool isRecommended;
  ProductsPage(this.isRecommended, {Key key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Products> productItem = [];
  List<Images> images;
  @override
  Widget build(BuildContext cxt) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductsLoadedState) {
          productItem = state.product;
          return Scaffold(
            backgroundColor: kWhiteColor,
            appBar: GeneralAppBar(
              title: widget.isRecommended ? "RECOMENDED" : "WEEK PROMOTION",
            ),
            body: widget.isRecommended
                ? RecommendedView(
                    direction: Axis.vertical,
                    heights: MediaQuery.of(cxt).size.height,
                    widths: 400,
                    top: 0.0,
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    column: 2,
                    ratio: 0.8,
                    items: state.product.length,
                    itemBuilder: (cxt, index) {
                      return GestureDetector(
                        onTap: () {
                          // context.read<ProductBloc>().add(
                          //       ProductSelectedEvent(
                          //         productItem[index].id,
                          //       ),
                          //     );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetails(productItem[index].id),
                            ),
                          );
                        },
                        child: RecommendedItems(
                          height: 100.0,
                          width: 80.0,
                          radius: 8.0,
                          top: 8.0,
                          bottom: 8.0,
                          left: 4.0,
                          right: 4.0,
                          image: productItem[index].baseImage.smallImageUrl,
                          title: productItem[index].name,
                          price: productItem[index].formatedPrice,
                          rating: productItem[index].formatedPrice,
                          // sale: productItem[index].reviews.total,
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
        } else if (state is ProductFailure) {
          return const Center(
            child: Text("Error"),
          );
        } else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
    );
  }
}
