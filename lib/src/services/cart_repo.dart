import 'dart:convert';

import 'package:eshop/src/models/address_model.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:http/http.dart' as http;
import 'package:eshop/src/models/cart_model.dart';
import 'package:eshop/src/models/categories_model.dart';
import 'package:eshop/src/services/http_utils.dart';
import 'package:eshop/src/shared/app_exception.dart';

abstract class CartServiceRepository {
  Future<List<Cart>> addToCart(int productId, int quantity);
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
  String paymentMethodEndpoint = '/api/checkout/cart/save-payment';
  String placeOrderEndpoint = '/api/checkout/cart/save-order';

  @override
  Future<List<Cart>> addToCart(int productId, int quantity) async {
    final res = await HttpUtils.postRequest<Map<String, dynamic>>(
        url + addSimpleProductEndpoint + productId.toString(),
        {"product_id": productId, "quantity": quantity});

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      Cart cart = CartModel.fromJson(data).data;
      return [cart];
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

  Future<List<Cart>> getCartDetails() async {
    final res = await HttpUtils.getRequest(url + getCartDetailsEnpoint, true);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      Cart cart = CartModel.fromJson(data).data;
      return [cart];
    } else if (res.body == null) {
      throw UnknownResponseException('No Cart Found.');
    } else if (res.statusCode == 401) {
      throw UnknownResponseException('Failed to get cart details');
    } else if (res.statusCode == 403) {
      throw UnknownResponseException('Invalid User Token');
    } else {
      throw Exception('Failed to get cart details');
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

  Future<String> updateCart(String cartItemId, int quantity) async {
    //get request that returns a string
    final res = await HttpUtils.putRequest(url + updateCartEndpoint, {
      "qty": {
        cartItemId: quantity,
      }
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

  Future<String> applyCoupon(String couponCode) async {
    //get request that returns a string
    final res = await HttpUtils.postRequest(
        url + applyCouponEndpoint, {"code": couponCode}, true);
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

  Future<String> removeCartItem(String cartItemId) async {
    //get request that returns a string
    final res =
        await HttpUtils.getRequest(url + removeCartItemEndpoint + cartItemId);
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

  //save shipping method
  Future<String> saveShippingMethod(String shippingMethod) async {
    //get request that returns a string
    final res = await HttpUtils.postRequest(url + shippingMethodEndpoint,
        {"shipping_method": shippingMethod}, true);
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

  //save payment method
  Future<String> savePaymentMethod(String paymentMethod) async {
    //get request that returns a string
    final res = await HttpUtils.postRequest(
        url + paymentMethodEndpoint,
        {
          "payment": {"method": paymentMethod}
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
