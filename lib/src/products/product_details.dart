import 'package:eshop/src/bloc/products/product_bloc.dart';
import 'package:eshop/src/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/delivery/delivery.dart';
import 'package:eshop/src/models/product_item.dart';
import 'package:eshop/src/models/products_model.dart';
import 'package:eshop/src/products/products.dart';
import 'package:eshop/src/services/products_repo.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/message.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:eshop/src/widgets/recommended_items.dart';
import 'package:eshop/src/widgets/recommended_view.dart';
import 'package:eshop/src/widgets/review.dart';
import 'package:eshop/src/widgets/review_ui.dart';
import 'package:eshop/src/widgets/sticky_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:html/parser.dart';

class ProductDetails extends StatefulWidget {
  final int productId;
  const ProductDetails(this.productId, {Key key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductBloc productBloc =
      ProductBloc(productRepository: ProductRepository());
  final repo = ProductRepository();
  ProductItem productItem;
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  bool isMore = false;

  List<String> productSize = ["S", "M", "L", "XL"];

  List<Color> productColors = [
    kPrimaryColor,
    kDarkColor,
    Colors.orange,
    Colors.green
  ];

  @override
  void initState() {
    // getProducts();
    super.initState();
  }

  getProducts() async {
    productItem = await repo.getProduct(widget.productId);
  }

  List<String> detailImages = [
    "assets/images/joystick1.jpg",
    "assets/images/joystick2.png",
    "assets/images/joystick3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        appBar: const GeneralAppBar(
          title: "PRODUCT DETAILS",
        ),
        bottomNavigationBar: Material(
          elevation: kLess,
          color: kWhiteColor,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 8.0, left: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor, width: 2.0),
                ),
                child: IconButton(
                  icon: Icon(Icons.add_shopping_cart, color: kPrimaryColor),
                  onPressed: () => print("Add to Cart"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor, width: 2.0),
                ),
                child: IconButton(
                  icon: Icon(Icons.chat, color: kPrimaryColor),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Message(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 52.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor, width: 2.0),
                  ),
                  child: FlatButton(
                    padding: const EdgeInsets.symmetric(vertical: kLessPadding),
                    color: kPrimaryColor,
                    textColor: kWhiteColor,
                    child: Text("Pay", style: TextStyle(fontSize: 18.0)),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DeliveryAddress(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductItemState) {
              productItem = state.product;
              List<String> detailImages = [
                productItem.baseImage.largeImageUrl,
                productItem.baseImage.mediumImageUrl,
                productItem.baseImage.originalImageUrl,
              ];
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 250.0,
                          child: PageView.builder(
                            controller: pageController,
                            onPageChanged: (value) {
                              setState(() {
                                currentIndex = value;
                              });
                            },
                            itemCount: detailImages.length,
                            itemBuilder: (context, index) {
                              return Image.network(
                                detailImages[index],
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
                              productItem.images.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
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
                    StickyLabel(text: productItem.name),
                    Padding(
                      padding: const EdgeInsets.only(left: kDefaultPadding),
                      child: Text(
                        productItem.formatedPrice,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: kDefaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 4.0),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(22.0)),
                            child: const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "8.9",
                                    style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.top,
                                    child: Icon(
                                      Icons.star,
                                      size: 18.0,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Text(
                              " Sale",
                              style: TextStyle(
                                color: kDarkColor.withOpacity(0.4),
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: kLessPadding),
                    kSmallDivider,
                    // for shirt or Other Products who has the Size
                    Padding(
                      padding: EdgeInsets.only(left: kDefaultPadding),
                      child: Text(
                        productItem.type,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 44.0,
                      margin: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding, vertical: kLessPadding),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productSize.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () =>
                                print("Selected Size : ${productSize[index]}"),
                            child: Container(
                              height: 44.0,
                              width: 44.0,
                              margin: EdgeInsets.only(right: 8.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3.0,
                                  color: kDarkColor.withOpacity(0.4),
                                ),
                                borderRadius: BorderRadius.circular(44.0),
                              ),
                              child: Text(
                                productSize[index],
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: kDarkColor.withOpacity(0.4),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    kSmallDivider,
                    // for shirt or Other Products who has the Colors
                    Padding(
                      padding: EdgeInsets.only(left: kDefaultPadding),
                      child: Text(
                        "Color",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 44.0,
                      margin: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding, vertical: kLessPadding),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productColors.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => print(
                                "Selected Color : ${productColors[index]}"),
                            child: Container(
                              height: 44.0,
                              width: 44.0,
                              margin: EdgeInsets.only(right: 8.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: productColors[index],
                                border: Border.all(
                                  width: 3.0,
                                  color: kDarkColor.withOpacity(0.4),
                                ),
                                borderRadius: BorderRadius.circular(44.0),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    kSmallDivider,
                    Padding(
                      padding: EdgeInsets.only(left: kDefaultPadding),
                      child: Text(
                        "Desciption",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: kDefaultPadding,
                          right: kDefaultPadding,
                          top: kLessPadding),
                      child: isMore
                          ? Text(
                              productItem.shortDescription,
                              style: kSubTextStyle,
                            )
                          : Text(
                              productItem.shortDescription.substring(0, 100) +
                                  "...",
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: kSubTextStyle,
                            ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        isMore = !isMore;
                      }),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: kDefaultPadding),
                          child: Text(
                            isMore ? "View Less" : "View More",
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: kLessPadding),
                    kSmallDivider,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StickyLabel(text: "Review"),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ReviewsScreen(),
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: kDefaultPadding),
                            child: StickyLabel(
                                text: "View All", textColor: kPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ReviewUI(
                          image: reviewList[index].image,
                          name: reviewList[index].name,
                          date: reviewList[index].date,
                          comment: reviewList[index].comment,
                          rating: reviewList[index].rating,
                          onPressed: () => print("More Action "),
                          onTap: () => setState(() {
                            isMore = !isMore;
                          }),
                          isLess: isMore,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 2.0,
                          color: kAccentColor,
                        );
                      },
                    ),
                    kSmallDivider,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StickyLabel(text: "Top Related Products"),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsPage(true),
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: kDefaultPadding),
                            child: StickyLabel(
                                text: "View All", textColor: kPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                      child: RecommendedView(
                        direction: Axis.horizontal,
                        heights: 250.0,
                        widths: MediaQuery.of(context).size.width,
                        top: 0.0,
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        column: 1,
                        ratio: 1.8,
                        items: 6,
                        itemBuilder: (context, index) {
                          return RecommendedItems(
                            height: 150.0,
                            radius: 8.0,
                            top: 8.0,
                            bottom: 8.0,
                            left: 4.0,
                            right: 4.0,
                            image: recommendedList[index].image,
                            title: recommendedList[index].title,
                            price: '',
                            rating: '',
                            sale: recommendedList[index].sale,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: Text("Error Loading roduct"),
            );
          },
        ));
  }
}
