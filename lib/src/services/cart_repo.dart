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
  String getCartDetailsEnpoint = '/api/checkout/cart?token=true';
  String emptyCartEndpoint = '/api/checkout/cart/empty?token=true';
  String updateCartEndpoint = '/api/checkout/cart/update?token=true';
  String applyCouponEndpoint = '/api/checkout/cart/coupon?token=true';
  String removeCartItemEndpoint = '/api/checkout/cart/remove-item/';
  String moveToWishlistEndpoint = '/api/checkout/cart/move-to-wishlist/';
  String saveAddressEndpoint = '/api/checkout/save-address?token=true';
  String shippingMethodEndpoint = '/api/checkout/cart/save-shipping?token=true';
  String placeOrderEndpoint = '/api/checkout/cart/save-order?token=true';
  String shippingMethod = '/api/checkout/save-shipping?token=true';
  String paymentMethod = '/api/checkout/save-payment?token=true';
  String saveOrderEndpoint = '/api/checkout/save-order?token=true';


  Future<Cart> addToCart(int productId, int quantity) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    FlutterSecureStorage storage = const FlutterSecureStorage();
      String cookie = await storage.read(key: 'cookie');
       String token = await AuthRepository().getCurrentUserToken();

    final res = await http.post(
      Uri.parse(url + addSimpleProductEndpoint + productId.toString()+'?token=true'),
      body: json.encode({"product_id": productId, "quantity": quantity}),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer " +token,
        // "Cookie": cookie,
      },
    );

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      Cart cart = Cart.fromJson(data['data'] as Map<String, dynamic>);
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
    final token =  await AuthRepository().getCurrentUserToken();
    final res = await http.get(
      Uri.parse(url + getCartDetailsEnpoint),
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
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
    final token =  await AuthRepository().getCurrentUserToken();
    final res = await http.get(
      Uri.parse(url + emptyCartEndpoint),
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
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

  Future<Cart> updateCart(String cartItemId, int quantity) async {
    //get request that returns a string
     FlutterSecureStorage storage = const FlutterSecureStorage();
      String cookie = await storage.read(key: 'cookie');
     final token =  await AuthRepository().getCurrentUserToken();
    final res = await http.put(Uri.parse(url + updateCartEndpoint),
        body: jsonEncode({
          "qty": {
            cartItemId: quantity,
          },
        }),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
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
     final token =  await AuthRepository().getCurrentUserToken();
      String cookie = await storage.read(key: 'cookie');
    final res = await http.post(
      Uri.parse(  url + applyCouponEndpoint),body: jsonEncode({"code": couponCode}),
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
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
     final token =  await AuthRepository().getCurrentUserToken();
      String cookie = await storage.read(key: 'cookie');
    final res = await http.post(Uri.parse(url + shippingMethod),
        body: jsonEncode({"shipping_method": method}), headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
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
     final token =  await AuthRepository().getCurrentUserToken();
      String cookie = await storage.read(key: 'cookie');
    final res = await http.post(Uri.parse(url + paymentMethod),
        body: jsonEncode({
          "payment": {"method": method}
        }),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
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
    final token =  await AuthRepository().getCurrentUserToken();
    String cartId = cartItemId.toString();
    final res = await http.get(Uri.parse(url + removeCartItemEndpoint + cartId + '?token=true'),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
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
  Future<String> saveAddress(String city, String state, String country, String phone, String postcode) async {
    // address.city, address.state, address.country, address.phone, address.postcode
    final token =  await AuthRepository().getCurrentUserToken();
    //get request that returns a string
    final res = await http.post(Uri.parse(url + saveAddressEndpoint),
        body: jsonEncode({
            "billing": {
              "address1": {
                "0": "H 23"
              },
              "use_for_shipping": "true",
              "first_name": "cris",
              "last_name": "doe",
              "email": "cris@gmail.com",
              "city": city,
              "state": state,
              "postcode": postcode,
              "phone": phone
            },
            "shipping": {
              "address1": {
                "0": "H 34"
              },
              "first_name": "john",
              "last_name": "doe",
              "email": "cris@gmail.com",
              "address_id": 2
            }
        },), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
        }
      );
    if (res.statusCode == 200 || res.statusCode == 302) {
      return 'Success';
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
    String token = await AuthRepository().getCurrentUserToken();
    //get request that returns a string
    final res = await http.post(Uri.parse(url + saveOrderEndpoint),
     headers: {
      "Authorization": "Bearer $token",
    });
  
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.body == null) {
      throw UnknownResponseException('Order Not Saved Try again..');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to get cart details');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to get cart details');
    }
  }

  //save order
}
