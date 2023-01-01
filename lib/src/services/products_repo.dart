import 'dart:convert';

import 'package:eshop/src/models/categories_model.dart';
import 'package:eshop/src/models/product_item.dart';
import 'package:eshop/src/models/products_model.dart';
import 'package:eshop/src/models/review_modal.dart';
import 'package:eshop/src/models/wishlist_model.dart';
import 'package:eshop/src/services/http_utils.dart';
import 'package:eshop/src/shared/app_exception.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import 'auth_repo.dart';

abstract class ProductServiceRepository {
  Future<void> downloadProducts();
  // Future<Products> getProduct(int id);
}

class ProductRepository extends ProductServiceRepository {
  String url = 'https://katale.net';
  String productsEndpoint = '/api/products?page=1';
  String getProductByIdEndpoint = '/api/products/';
  String categoriesEndpoint = '/api/categories?page=1';
  String getCategoryByIdEndpoint = '/api/categories/';
  String getProductReviewsEndpoint = '/api/reviews?product_id=';
  String addToWishListEndpoint = '/api/wishlist/add/'; //example.com/api/wishlist/add/{product_id}
  String getWishListEndpoint = 'https://katale.net/api/wishlist?page=1&token=true';

  @override
  Future<ProductModel> downloadProducts() async {
    //final String currentUserToken = await AuthRepository().getCurrentUserToken();

    // final response = await HttpUtils.getRequest(urls + notifyEndPoint, true);
    final response = await http.get(
      Uri.parse(url + productsEndpoint),
      // Send authorization headers to the backend.
      headers: {
        "Content-type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      //get cookie from response
      final cookie = response.headers['set-cookie'];
      //store cookie in secure storage
      FlutterSecureStorage storage = const FlutterSecureStorage();
      await storage.write(key: 'cookie', value: cookie);
      print(cookie);
      return ProductModel.fromJson(data);
    } else if (response.body == null) {
      throw UnknownResponseException('No Products Found.');
    } else if (response.statusCode == 401) {
      throw UnknownResponseException('Failed to download product');
    } else if (response.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to download product');
    }
  }

 
  Future<ProductItem> getProduct(int id) async {
    final response = await http.get(Uri.parse(
      url + getProductByIdEndpoint + id.toString(),
    ));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // ProductModel.fromJson(data).data;
      ProductItem product = ProductItemModel.fromJson(data).data;
      return product;
    } else if (response.body == null) {
      throw UnknownResponseException('No Products Found.');
    } else if (response.statusCode == 401) {
      throw UnknownResponseException('Failed to download product');
    } else if (response.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to download product');
    }
  }

  Future<List<Categories>> downloadCategories() async {
    final response = await HttpUtils.getRequest(url + categoriesEndpoint, true);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      CategoriesModel.fromJson(data);
      List<Categories> categories = CategoriesModel.fromJson(data).data;

      //save polls
      // PollsDatabaseProvider.db.createPolls(polls);

      return categories;
    } else if (response.body == null) {
      throw UnknownResponseException('No Categories Found.');
    } else if (response.statusCode == 401) {
      throw UnknownResponseException('Failed to download category');
    } else if (response.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to download category');
    }
  }

  Future<List<Categories>> getCategory(int id) async {
    final res = await HttpUtils.getRequest(
        url + getCategoryByIdEndpoint + id.toString(), true);

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      CategoriesModel.fromJson(data);
      List<Categories> categories = CategoriesModel.fromJson(data).data;

      //save polls
      // PollsDatabaseProvider.db.createPolls(polls);

      return categories;
    } else if (res.body == null) {
      throw UnknownResponseException('No Categories Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to download category');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to download category');
    }
  }

  //get reviews for product
  Future<List<Data>> getProductReviews(int id) async {
    final res = await http.get(
      Uri.parse(url + getProductReviewsEndpoint + id.toString()
      ));

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      print(data);
      ReviewsModal.fromJson(data);
      List<Data> reviews = ReviewsModal.fromJson(data).data;
      return reviews;
    } else if (res.body == null) {
      throw UnknownResponseException('No Reviews Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to download reviews');
    } else if (res.statusCode == 403) { 
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to download reviews');
    }
  }

  //add to wishlist
  Future<WishlistModel> addToWishList(int id) async {
    final token = await AuthRepository().getCurrentUserToken();
    final response = await http.get(
      Uri.parse('http://katale.net/api/wishlist/add/$id?token=true'),
      // Send authorization headers to the backend.
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer " +token,
      },
    );

    bool isTokenExpired = JwtDecoder.isExpired(token);
    print(isTokenExpired);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      final wishList = WishlistModel.fromJson(data);
      // print(data["message"]);
      return wishList;
    } else if (response.body == null) {
      throw UnknownResponseException('No Reviews Found.');
    } else if (response.statusCode == 401) {
      throw UnknownResponseException('Failed to download reviews');
    } else if (response.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to download reviews');
    }
  }

  //get wishlist items
  Future<WishlistModel> getWishList() async {
    final token  = await AuthRepository().getCurrentUserToken();
    final response = await http.get(
      Uri.parse(getWishListEndpoint),
      // Send authorization headers to the backend.
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer " +token,
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
    
     return WishlistModel.fromJson(data);
    } else if (response.body == null) {
      throw UnknownResponseException('No Reviews Found.');
    } else if (response.statusCode == 401) {
      throw UnknownResponseException('Failed to download reviews');
    } else if (response.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to download reviews');
    }
  }

  
  
}
