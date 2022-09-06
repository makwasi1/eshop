// ignore_for_file: empty_statements

import 'dart:async';

import 'package:eshop/check_button.dart';
import 'package:eshop/src/bloc/cart_bloc/bloc/cart_bloc.dart';
import 'package:eshop/src/bloc/products/product_bloc.dart';

import 'package:eshop/src/constants.dart';
import 'package:eshop/src/models/cart_model.dart';
import 'package:eshop/src/models/categories_model.dart';

import 'package:eshop/src/models/products_model.dart';
import 'package:eshop/src/products/products.dart';
import 'package:eshop/src/services/cart_repo.dart';
// import 'package:eshop/src/products/products.dart';
import 'package:eshop/src/services/products_repo.dart';
import 'package:eshop/src/widgets/category_view_home.dart';
import 'package:eshop/src/widgets/chip.dart';
import 'package:eshop/src/widgets/circular_loading_widget.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/items_view.dart';
import 'package:eshop/src/widgets/poster_view.dart';
import 'package:eshop/src/widgets/product_widget.dart';
import 'package:eshop/src/widgets/recommended_items.dart';
import 'package:eshop/src/widgets/recommended_view.dart';
import 'package:eshop/src/widgets/sticky_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ProductBloc productBloc =
      ProductBloc(productRepository: ProductRepository());

  List<Products> productItem = [];
  List<Images> images;
  List<Categories> categories;
  List<CartModel> _cartItems = [];
  //get cart items also
  int currentIndex = 0;
  Timer _timer;
  Duration myDuration = Duration(days: 5);
  bool countDown = true;

  @override
  void initState() {
    // productBloc.add(ProductsFetchedEvent());
    super.initState();
    // _timer = Timer.periodic(const Duration(seconds: 1), (_) {
    //   if (!mounted) {
    //     setState(() {
    //       countDown = false;
    //     });
    //   } else {}
    // });
    // startTimer();
  }

  void startTimer() {
    // _timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    // const reduceSecondsBy = 1;
    // if (mounted) {
    //   setState(() {
    //     final seconds = myDuration.inSeconds - reduceSecondsBy;
    //     if (seconds < 0) {
    //       _timer.cancel();
    //     } else {
    //       myDuration = Duration(seconds: seconds);
    //     }
    //   });
    // }
  }

  @override
  void dispose() {
    // if (_timer != null) {
    //   _timer.cancel();
    //   _timer = null;
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // String strDigits(int n) => n.toString().padLeft(2, '0');
    // final days = strDigits(myDuration.inDays);
    // final hours = strDigits(myDuration.inHours.remainder(24));
    // final minutes = strDigits(myDuration.inMinutes.remainder(60));
    // final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Material(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: const DefaultAppBar(
          title: "",
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const CircularLoading();
            }

            if (state is ProductFailure) {
              return   Center(
                // child: DefaultButton(
                //   text: "Try Again",
                //   press: () => productBloc.add(ProductsFetchedEvent()),
                // ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                  ),
                child: const Text('Opps! Try Again'),
                  onPressed: () {
                    productBloc.add(ProductsFetchedEvent());
                  },
                ),
                
              );
            }

            if (state is ProductsLoadedState) {
              print("${state.product.length}++++++");
              productItem = state.product;
              images = state.product.first.images;
              categories = state.categories;
              return SingleChildScrollView(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 250.0,
                        child: PageView.builder(
                          // controller: pageController,
                          onPageChanged: (value) {
                            setState(() {
                              currentIndex = value;
                            });
                          },
                          itemCount: sliderImages.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              sliderImages[index],
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 16.0,
                        left: 0.0,
                        right: 0.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            sliderImages.length,
                            (index) => AnimatedContainer(
                              duration: Duration(milliseconds: 400),
                              height: 8.0,
                              width: currentIndex == index ? 24.0 : 8.0,
                              margin: EdgeInsets.only(right: 4.0),
                              decoration: BoxDecoration(
                                color: currentIndex == index
                                    ? kPrimaryColor
                                    : kLightColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // StickyLabel(text: "Menu"),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 1.9,
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.6, right: 2.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.credit_card,
                            color: kPrimaryColor,
                            size: 30.0,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  " Secure Payment",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " 100% Secure payment",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ]),
                          const VerticalDivider(
                            endIndent: 30.0,
                          ),
                          const Icon(
                            Icons.autorenew,
                            color: kPrimaryColor,
                            size: 30.0,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "90 Days Return",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "If goods have problems",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ]),
                        ],
                      ),

                      // ),
                    ),
                  ),
                  kDivider,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Featured Products",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     children: [
                  //       SizedBox(
                  //         width: MediaQuery.of(context).size.width * 0.6,
                  //         height: MediaQuery.of(context).size.height * 0.05,
                  //         child: Card(
                  //           elevation: 5.0,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(5.0),
                  //           ),
                  //           color: Colors.red,
                  //           child: Padding(
                  //             padding: const EdgeInsets.only(
                  //                 bottom: 3.0, left: 10.0, top: 3.0),
                  //             child: Text(
                  //               "End in: $days: : : ",
                  //               textAlign: TextAlign.left,
                  //               style: const TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 28.0,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Expanded(
                  //         flex: 1,
                  //         child: GestureDetector(
                  //           onTap: () => Navigator.of(context).push(
                  //             MaterialPageRoute(
                  //               builder: (context) => Products(false),
                  //             ),
                  //           ),
                  //           child: const Padding(
                  //             padding: EdgeInsets.only(left: 58.0, bottom: 30.0),
                  //             child: Text("View all",
                  //                 style: TextStyle(
                  //                     color: Colors.black,
                  //                     decoration: TextDecoration.underline,
                  //                     fontSize: 20.0)),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const Divider(
                    thickness: 0,
                    color: kLightColor,
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                  ProductWidget(productItem: productItem),

                  // const PosterViewImage(),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CategoryViewHome(
                      direction: Axis.horizontal,
                      height: 200.0,
                      width: 500.0,
                      color: kWhiteColor,
                      column: 1,
                      ratio: 0.5,
                      items: 2,
                      itemBuilder: (context, index) {
                        return PosterViewImage(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          paddingVertical: 4.0,
                          paddingHorizontal: 16.0,
                          radius: 0.0,
                          image: posterList[index].image,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Top Categories",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                        // GestureDetector(
                        //   onTap: () => Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //       builder: (context) => BottomNavBar(1),
                        //     ),
                        //   ),
                        //   child: const Padding(
                        //     padding: EdgeInsets.only(right: kDefaultPadding),
                        //     child: StickyLabel(
                        //         text: "View All", textColor: kPrimaryColor),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Container(
              margin: const EdgeInsets.only(
                top: 16.0,
                left: kFixPadding,
                right: kDefaultPadding,
                bottom: 19
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List<Widget>.generate(
                    categories.length,
                    (int index) {
                      return Chips(text: categories[index].name);
                    },
                  ),
                ),
              ),
            ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 8.0),
                  //   child: CategoryViewHome(
                  //     direction: Axis.horizontal,
                  //     height: 300.0,
                  //     width: MediaQuery.of(context).size.width,
                  //     color: kWhiteColor,
                  //     column: 2,
                  //     ratio: 0.78,
                  //     items: categories.length,
                  //     itemBuilder: (context, index) {
                  //       return ItemsView(
                  //         height: MediaQuery.of(context).size.height,
                  //         width: MediaQuery.of(context).size.width,
                  //         paddingHorizontal: 0.0,
                  //         paddingVertical: 0.0,
                  //         radius: 8.0,
                  //         blendMode: BlendMode.hardLight,
                  //         color: kDarkColor,
                  //         //image: categories[index]?.imageUrl,
                  //         title: categories[index].name,
                  //         titleSize: kFixPadding,
                  //         align: Alignment.center,
                  //       );
                  //     },
                  //   ),
                  // ),
                  kDivider,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("New Products",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.center),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsPage(true),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(right: kDefaultPadding),
                            child: StickyLabel(
                                text: "View All", textColor: kPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ProductWidget(productItem: productItem),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  //   child: RecommendedView(
                  //     direction: Axis.horizontal,
                  //     heights: 315.0,
                  //     widths: MediaQuery.of(context).size.width,
                  //     top: 0.0,
                  //     bottom: 0.0,
                  //     left: 0.0,
                  //     right: 0.0,
                  //     column: 1,
                  //     ratio: 1.8,
                  //     items: 6,
                  //     itemBuilder: (context, index) {
                  //       return RecommendedItems(
                  //         height: 225.0,
                  //         radius: 8.0,
                  //         top: 8.0,
                  //         bottom: 8.0,
                  //         left: 4.0,
                  //         right: 4.0,
                  //         image: recommendedList[index].image,
                  //         title: recommendedList[index].title,
                  //         price: recommendedList[index].price,
                  //         rating: recommendedList[index].rating,
                  //         sale: recommendedList[index].sale,
                  //       );
                  //     },
                  //   ),
                  // )
                ],
              ));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
