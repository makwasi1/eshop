import 'package:eshop/src/bloc/cart_bloc/bloc/cart_bloc.dart';
import 'package:eshop/src/bloc/products/product_bloc.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/models/products_model.dart';
import 'package:eshop/src/products/product_details.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:eshop/src/services/products_repo.dart';
import 'package:eshop/src/signup/sign_in.dart';
import 'package:eshop/src/widgets/category_view.dart';
import 'package:eshop/src/widgets/categoty_items.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:eshop/src/widgets/recommended_items.dart';
import 'package:eshop/src/widgets/recommended_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ProductsPage extends StatefulWidget {
  bool isRecommended;
  ProductsPage(this.isRecommended, {Key key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Products> productItem = [];
  List<Images> images;

  bool isWishList = false;
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
                  ? Center(
                      child: RecommendedView(
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
                      ),
                    )
                  : Center(
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        itemCount: state.product.length,
                        itemBuilder: (ctx, i) {
                          return Card(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetails(productItem[i].id),
                                  ),
                                );
                              },
                              child: Container(
                                height: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Image.network(
                                              productItem[i]
                                                  .baseImage
                                                  .smallImageUrl,
                                              // fit: BoxFit.cover,
                                              height: 10,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          productItem[i].name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              productItem[i].formatedPrice,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: kPrimaryColor),
                                          onPressed: () {
                                            checkLogged2(context, i);
                                          },
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons.add_shopping_cart,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text(
                                                "ADD TO CART",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 5,
                          mainAxisExtent: 264,
                        ),
                      ),
                    ));
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

Future<void> checkLogged2(BuildContext context, int id) async {
  final token = await AuthRepository().getCurrentUserToken();
  bool isTokenExpired = JwtDecoder.isExpired(token);

  if (isTokenExpired || token == null) {
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

// ignore: camel_case_types
