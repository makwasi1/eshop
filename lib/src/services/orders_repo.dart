import 'dart:convert';

import 'package:eshop/src/models/order_model.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:eshop/src/services/http_utils.dart';
import 'package:eshop/src/shared/app_exception.dart';
import 'package:http/http.dart' as http;

abstract class OrdersServiceRepository {
  Future<void> getOrderById(int orderId);
  Future<dynamic> getAllOrders();
}

class OrdersRepository extends OrdersServiceRepository {
  String url = 'http://eshoptag.com';
  String getAllOrdersEndpoint = '/api/orders?page=1&token=true';
  String getOrderByIdEndpoint = '/api/orders/';

//TODO: USER MUST BE LOGGED IN

  @override
  Future<List<Order>> getAllOrders() async {
    String token = await AuthRepository().getCurrentUserToken();
    final res = await http.get(Uri.parse(url + getAllOrdersEndpoint), 
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }
    );
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      List<Order> order = OrderModel.fromMap(data).data;
      return order;
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

  @override
  Future<void> getOrderById(int orderId) async {
    final res = await HttpUtils.getRequest(
        url + getOrderByIdEndpoint + orderId.toString());
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      return data;
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
}
