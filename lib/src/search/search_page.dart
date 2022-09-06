import 'package:eshop/src/bloc/products/product_bloc.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/models/products_model.dart';
import 'package:eshop/src/widgets/chip.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/header_label.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:eshop/src/widgets/product_widget.dart';
import 'package:eshop/src/widgets/recommended_items.dart';
import 'package:eshop/src/widgets/recommended_view.dart';
import 'package:eshop/src/widgets/sticky_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
   List<Products> productItem = [];
  List<Images> images;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const GeneralAppBar(title: "SEARCH"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HeaderLabel(
            //   headerText:
            //       "Hello, i am E-Commerce. What would you like to search?",
            // ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(width: 4.0, color: kAccentColor),
              ),
              child: const TextField(
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: kDarkColor,
                    size: 29.0,
                  ),
                  hintText: "Search Products...",
                  hintStyle: TextStyle(
                    fontSize: 18.0,
                    color: kLightColor,
                  ),
                ),
              ),
            ),
            const StickyLabel(
              text: "Popular Keyword",
              textColor: kLightColor,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 16.0,
                left: kFixPadding,
                right: kDefaultPadding,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List<Widget>.generate(
                    chipsCategory.length,
                    (int index) {
                      return Chips(text: chipsCategory[index]);
                    },
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(
                top: 8.0,
                left: kFixPadding,
                right: kDefaultPadding,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List<Widget>.generate(
                    chipsMobile.length,
                    (int index) {
                      return Chips(text: chipsMobile[index]);
                    },
                  ),
                ),
              ),
            ),
            const StickyLabel(
              text: "Recently Viewed",
              textColor: kDarkColor,
            ),

            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if(state is ProductsLoadedState){
                  productItem = state.product;
                  images = state.product.first.images;
                  ProductWidget(productItem: productItem);
                }
                return ProductWidget(productItem: productItem);
              },
            ),

            
          ],
        ),
      ),
    );
  }
}
