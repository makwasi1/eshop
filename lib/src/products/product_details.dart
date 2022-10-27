import 'package:eshop/src/bloc/cart_bloc/bloc/cart_bloc.dart';
import 'package:eshop/src/bloc/products/product_bloc.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/delivery/delivery.dart';
import 'package:eshop/src/models/product_item.dart';
import 'package:eshop/src/models/review_modal.dart';
import 'package:eshop/src/products/products.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:eshop/src/services/products_repo.dart';
import 'package:eshop/src/signup/sign_in.dart';
import 'package:eshop/src/widgets/message.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:eshop/src/widgets/product_widget.dart';
import 'package:eshop/src/widgets/review.dart';
import 'package:eshop/src/widgets/review_ui.dart';
import 'package:eshop/src/widgets/sticky_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  ProductItem productItemList;
  String description = '';
  List<Data> reviews = [];
  List<String> detailImages = [];
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

  bool isWishList = false;

  @override
  void initState() {
    getProduct();
    getReview();
    super.initState();
  }

  getReview() async {
    List<Data> reviews = await repo.getProductReviews(widget.productId);
    print(reviews);
  }

  getProduct() async {
    ProductItem productItem = await repo.getProduct(widget.productId);
    setState(() {
      productItemList = productItem;
      description = (productItem.shortDescription).replaceAll(exp, "");
      detailImages = [
        productItemList.baseImage.largeImageUrl,
        productItemList.baseImage.mediumImageUrl,
        productItemList.baseImage.originalImageUrl,
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (productItemList == null) {
      return const Scaffold(
        backgroundColor: kWhiteColor,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
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
                  margin: const EdgeInsets.only(right: 8.0, left: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor, width: 2.0),
                  ),
                  child: IconButton(
                    icon:
                        Icon(Icons.favorite_border, color: !isWishList ?  kPrimaryColor : Colors.red),
                    onPressed: () {
                      var token =  AuthRepository().getCurrentUserToken();
                      if(token == null){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn(authRepository: AuthRepository())));
                      }else{
                      ProductRepository().addToWishList(widget.productId);
                      setState(() {
                        isWishList = !isWishList;
                      });
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor, width: 2.0),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.chat, color: kPrimaryColor),
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
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: kWhiteColor,
                        backgroundColor: kPrimaryColor,
                        padding:  const EdgeInsets.symmetric(vertical: kLessPadding),
                        textStyle: const TextStyle(
                          color: kWhiteColor
                        ),
                      ),
                      // padding:
                      //     const EdgeInsets.symmetric(vertical: kLessPadding),
                      // color: kPrimaryColor,
                      // textColor: kWhiteColor,
                      child: const Text("ADD TO CART",
                          style: TextStyle(fontSize: 18.0)),
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartItemAdded(widget.productId));
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
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
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
                          detailImages.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            height: 8.0,
                            width: currentIndex == index ? 24.0 : 8.0,
                            margin: const EdgeInsets.only(right: 4.0),
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
                StickyLabel(text: productItemList?.name),
                Padding(
                  padding: const EdgeInsets.only(left: kDefaultPadding),
                  child: Text(
                    productItemList?.formatedPrice,
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
                  padding: const EdgeInsets.only(left: kDefaultPadding),
                  child: Text(
                    productItemList?.type,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  height: 44.0,
                  margin: const EdgeInsets.symmetric(
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
                          margin: const EdgeInsets.only(right: 8.0),
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
                const Padding(
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
                  margin: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding, vertical: kLessPadding),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productColors.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () =>
                            print("Selected Color : ${productColors[index]}"),
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
                    }, //16010
                  ),
                ),
                kSmallDivider,
                const Padding(
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
                          description,
                          style: kSubTextStyle,
                        )
                      : Text(
                          description.substring(0, 100) + "...",
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
                      padding: const EdgeInsets.only(right: kDefaultPadding),
                      child: Text(
                        isMore ? "View Less" : "View More",
                        style: const TextStyle(
                            color: kPrimaryColor, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: kLessPadding),
                kSmallDivider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const StickyLabel(text: "Review"),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ReviewsScreen(),
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
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                  itemCount: reviews?.length,
                  itemBuilder: (context, index) {
                    var reviewList;
                    return ReviewUI(
                      name: reviews[index].name,
                      date: reviewList[index].date,
                      comment: reviews[index].comment,
                      rating: reviews[index].rating,
                      onPressed: () => print("More Action "),
                      onTap: () => setState(() {
                        isMore = !isMore;
                      }),
                      isLess: isMore,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 2.0,
                      color: kAccentColor,
                    );
                  },
                ),
                kSmallDivider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const StickyLabel(text: "Top Related Products"),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductsPage(true),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(right: kDefaultPadding),
                        child: StickyLabel(
                            text: "See All", textColor: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductsLoadedState) {
                      return ProductWidget(
                        productItem: state.product,
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ));
    }
    // return const Center(
    //   child: Text("Error Loading roduct"),
    // );
  }
}
