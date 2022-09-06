import 'dart:convert';

import 'package:eshop/src/models/address_model.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:eshop/src/models/cart_model.dart';
import 'package:eshop/src/services/http_utils.dart';
import 'package:eshop/src/shared/app_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CartServiceRepository {
  // Future<List<Cart>> addToCart(int productId, int quantity);
  Future<String> addPaymentMethod(String paymentMethod);
}

class CartRepository implements CartServiceRepository {
  String url = 'http://eshoptag.com';
  String addSimpleProductEndpoint = '/api/checkout/cart/add/';
  String getCartDetailsEnpoint = '/api/checkout/cart';
  String emptyCartEndpoint = '/api/checkout/cart/empty';
  String updateCartEndpoint = '/api/checkout/cart/update';
  String applyCouponEndpoint = '/api/checkout/cart/coupon';
  String removeCartItemEndpoint = '/api/checkout/cart/remove-item/';
  String moveToWishlistEndpoint = '/api/checkout/cart/move-to-wishlist/';
  String saveAddressEndpoint = '/api/checkout/save-address';
  String shippingMethodEndpoint = '/api/checkout/cart/save-shipping';
  String placeOrderEndpoint = '/api/checkout/cart/save-order';
  String shippingMethod = '/api/checkout/save-shipping';
  String paymentMethod = '/api/checkout/save-payment';

 

  
  Future<Cart> addToCart(int productId, int quantity) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    FlutterSecureStorage storage = const FlutterSecureStorage();
      String cookie = await storage.read(key: 'cookie');
    final res = await http.post(
      Uri.parse(url + addSimpleProductEndpoint + productId.toString()),
      body: jsonEncode({"product_id": productId, "quantity": quantity}),
      headers: {
        "Content-type": "application/json",
        "Cookie": cookie,
      },
    );

    if (res.statusCode == 200) {
      var data = json.decode(res.body);

      Cart cart = CartModel.fromJson(data).data;
      // var cartId = cart.id;
      // prefs.setString('cart', json.encode(cart.toJson()));
      return cart;
    } else if (res.body == null) {
      throw UnknownResponseException('No Cart Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to add to cart');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to add to cart');
    }
  }

  Future<Cart> getCartDetails() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
      String cookie = await storage.read(key: 'cookie');
    final res = await http.get(
      Uri.parse(url + getCartDetailsEnpoint),
      headers: {
        "Content-type": "application/json",
        "Cookie": cookie,
      },
    );
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      Cart cart = CartModel.fromJson(data).data;
      // prefs.setString('cart', json.encode(cart.toJson()));
      return cart;
    } else if (res.body == null) {
      throw UnknownResponseException('No Cart Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to get cart');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to get cart');
    }
  }

  Future<List<Cart>> getCartDetailsUserLogged() async {
    final String currentUserToken =
        await AuthRepository().getCurrentUserToken();

    final res =
        await http.get(Uri.parse(url + getCartDetailsEnpoint), headers: {
      "Content-type": "application/json",
      "Authorization": 'Bearer $currentUserToken',
    });

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      Cart cart = CartModel.fromJson(data).data;
      return [cart];
    } else if (res.body == null) {
      throw UnknownResponseException('No Cart Items Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to get cart details');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to get cart details');
    }
  }

  Future<String> emptyCart() async {
    //get request that returns a string
    final res = await HttpUtils.getRequest(url + emptyCartEndpoint, true);
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.body == null) {
      throw UnknownResponseException('No Cart Items Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to get cart details');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to get cart details');
    }
  }

  Future<Cart> updateCart(String cartItemId, int quantity) async {
    //get request that returns a string
     FlutterSecureStorage storage = const FlutterSecureStorage();
      String cookie = await storage.read(key: 'cookie');
    final res = await http.put(Uri.parse(url + updateCartEndpoint),
        body: jsonEncode({
          "qty": {
            cartItemId: quantity,
          },
        }),
        headers: {
          "Content-type": "application/json",
          "Cookie": cookie,
        });
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      Cart cart = CartModel.fromJson(data).data;
      return cart;
    } else if (res.body == null) {
      throw UnknownResponseException('No Cart Items Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to get cart details');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to get cart details');
    }
  }

  Future<String> applyCoupon(String couponCode) async {
    //get request that returns a string
     FlutterSecureStorage storage = const FlutterSecureStorage();
      String cookie = await storage.read(key: 'cookie');
    final res = await http.post(
      Uri.parse(  url + applyCouponEndpoint),body: jsonEncode({"code": couponCode}),
      headers: {
        "Content-type": "application/json",
        "Cookie": cookie,
      },
      );
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.body == null) {
      throw UnknownResponseException('Coupon Not Valid.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Coupon Not Valid');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Coupon Not Valid');
    }
  }

  Future<String> removeCoupon() async {
    //get request that returns a string
    final res = await HttpUtils.deleteRequest(url + applyCouponEndpoint);
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.body == null) {
      throw UnknownResponseException('No Cart Items Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to get cart details');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to get cart details');
    }
  }

  Future<String> addShippingMethod(String method) async {
    //get request that returns a string
     FlutterSecureStorage storage = const FlutterSecureStorage();
      String cookie = await storage.read(key: 'cookie');
    final res = await http.post(Uri.parse(url + shippingMethod),
        body: jsonEncode({"shipping_method": method}), headers: {
      "Content-type": "application/json",
      "Cookie": cookie,
        });

    if (res.statusCode == 200) {
      return res.body;
    } else if (res.body == null) {
      throw UnknownResponseException('No Cart Items Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to get cart details');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to get cart details');
    }
  }

  @override
  Future<String> addPaymentMethod(String method) async {
    //get request that returns a string
     FlutterSecureStorage storage = const FlutterSecureStorage();
      String cookie = await storage.read(key: 'cookie');
    final res = await http.post(Uri.parse(url + paymentMethod),
        body: jsonEncode({
          "payment": {"method": method}
        }),
        headers: {
          "Content-type": "application/json",
          "Cookie": cookie,
        });

    if (res.statusCode == 200) {
      return res.body;
    } else if (res.body == null) {
      throw UnknownResponseException('No Cart Items Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to get cart details');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to get cart details');
    }
}

  Future<Cart> removeCartItem(int cartItemId) async {
    //get request that returns a string
    FlutterSecureStorage storage = const FlutterSecureStorage();
      String cookie = await storage.read(key: 'cookie');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartId = cartItemId.toString();
    final res = await http.get(Uri.parse(url + removeCartItemEndpoint + cartId),
        headers: {
          "Content-type": "application/json",
          "Cookie": cookie,
        });
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      Cart cart = CartModel.fromJson(data).data;
      // prefs.remove('cart');
      // prefs.setString('cart', json.encode(cart.toJson()));
      return cart;
    } else if (res.body == null) {
      throw UnknownResponseException('No Cart Items Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to get cart details');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to get cart details');
    }
  }

  //move product to wishlist
  Future<String> moveToWishlist(String productId) async {
    //get request that returns a string
    final res = await HttpUtils.getRequest(
      url + moveToWishlistEndpoint + productId,
    );
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.body == null) {
      throw UnknownResponseException('No Cart Items Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to get cart details');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to get cart details');
    }
  }

// save to address
  Future<String> saveAddress(Address address) async {
    //get request that returns a string
    final res = await HttpUtils.postRequest(
        url + saveAddressEndpoint,
        {
          "billing": {
            "address1": {"0": "H 23"},
            "use_for_shipping": "true",
            "first_name": "john",
            "last_name": "doe",
            "email": "john@webkul.com",
            "city": address.city,
            "state": address.state,
            "postcode": address.postcode,
            "country": address.country,
            "phone": address.phone,
          },
          "shipping": {
            "address1": {"0": ""}
          }
        },
        true);
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.body == null) {
      throw UnknownResponseException('No Cart Items Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to get cart details');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to get cart details');
    }
  }


  //save order
  Future<String> saveOrder() async {
    //get request that returns a string
    final res = await HttpUtils.postRequest(url + placeOrderEndpoint, {}, true);
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.body == null) {
      throw UnknownResponseException('No Cart Items Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to get cart details');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to get cart details');
    }
  }
}
