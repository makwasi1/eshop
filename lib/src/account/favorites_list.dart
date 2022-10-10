import 'package:eshop/src/bloc/address/bloc/address_bloc.dart';
import 'package:eshop/src/bloc/cart_bloc/bloc/cart_bloc.dart';
import 'package:eshop/src/bloc/products/product_bloc.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/models/wishlist_model.dart';
import 'package:eshop/src/products/product_details.dart';
import 'package:eshop/src/services/products_repo.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:eshop/src/widgets/recommended_items.dart';
import 'package:eshop/src/widgets/recommended_view.dart';
import 'package:eshop/src/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class WishListPage extends StatefulWidget {
  bool isRecommended;
  WishListPage(this.isRecommended, {Key key}) : super(key: key);

  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  List<Product> productItem = [];
   Product wishListItem;
   List<Images> images;

  @override
  void initState() {
    // getWishListItems();
  context.read<AddressBloc>().add(AddressStartedEvent());
    super.initState();
  }

  // getWishListItems() async {
  //   final wishList = ProductRepository().getWishList();
  //   setState(() {
  //     final wishList = ProductRepository().getWishList();
  //   });
  //   print(wishList);
  // }

  @override
  Widget build(BuildContext cxt) {
    // final List<Products> productItem = ProductRepository().getWishList().data;
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        if (state is AddressLoadingState) {
          return  Scaffold(
            backgroundColor: kWhiteColor,
          appBar: GeneralAppBar(
            title: widget.isRecommended ? "WISHLIST" : "WISHLIST",
          ),
            body:  const ShimmerWidget(),
          );
        }
        if(state is AddressLoadedState){
          wishListItem = state.wishItem.first.product;
          images = state.wishItem.first.product.images;
          print(wishListItem.formatedPrice);
        return Scaffold(
          backgroundColor: kWhiteColor,
          appBar: GeneralAppBar(
            title: widget.isRecommended ? "WISHLIST" : "WISHLIST",
          ),
          body : Center(
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        itemCount: state.wishItem.length,
                        itemBuilder: (ctx, i) {
                          return Card(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetails(wishListItem.id),
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
                                              images[i]
                                                  .smallImageUrl,
                                                  
                                              // fit: BoxFit.cover,
                                              height: 10,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          wishListItem.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              wishListItem.formatedPrice,
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
                                            context.read<CartBloc>().add(
                                                CartItemAdded(
                                                    wishListItem.id));

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              backgroundColor: kPrimaryColor,
                                              content: Text(
                                                  "Successfully added to cart.",
                                                  style: TextStyle(
                                                      color: kWhiteColor),
                                                  textAlign: TextAlign.center),
                                              duration: Duration(seconds: 1),
                                            ));
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
                    ),
           
        );} return const Scaffold(
          appBar: GeneralAppBar(
            title: "WISHLIST",
          ),
                  body: Center(child: Text("No items in wishlist")),
                );
      },
    );
  }
}

// class NewWidget extends StatelessWidget {
//   const NewWidget({
//     Key key,
//     @required this.images,
//     @required this.wishListItem,
//   }) : super(key: key);

//   final List<Images> images;
//   final Product wishListItem;

//   @override
//   Widget build(BuildContext context) {
//     return RecommendedView(
//             direction: Axis.vertical,
//             heights: MediaQuery.of(context).size.height,
//             widths: 400,
//             top: 0.0,
//             bottom: 0.0,
//             left: 0.0,
//             right: 0.0,
//             column: 2,
//             ratio: 0.8,
//             items: wishItem?.length,
//             itemBuilder: (cxt, index) {
//               return GestureDetector(
//                 onTap: () {
//                   // Navigator.of(context).push(
//                   //   MaterialPageRoute(
//                   //     builder: (context) =>
//                   //         ProductDetails(wishItem[index].data[index].id),
//                   //   ),
//                   // );
//                 },
//                 child: RecommendedItems(
//                   height: 100.0,
//                   width: 80.0,
//                   radius: 8.0,
//                   top: 8.0,
//                   bottom: 8.0,
//                   left: 4.0,
//                   right: 4.0,
//                   image:
//                       images[index].smallImageUrl,
//                   title: wishListItem.name,
//                   price: wishListItem.formatedPrice,
//                   rating:wishListItem.formatedPrice,
//                   // sale: productItem[index].reviews.total,
//                 ),
//               );
//             },
//           );
//   }
// }
