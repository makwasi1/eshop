import 'dart:convert';

import 'package:eshop/src/models/products_model.dart';
import 'package:eshop/src/services/http_utils.dart';
import 'package:eshop/src/shared/app_exception.dart';
import 'package:http/http.dart' as http;

import 'auth_repo.dart';

abstract class ProductServiceRepository {
  Future<void> downloadProducts();
  Future<List<Products>> getProduct(int id);
}

class ProductRepository extends ProductServiceRepository {
  String url = 'http://eshoptag.com';
  String productsEndpoint = '/api/products?page=1';
  String getProductByIdEndpoint = '/api/products/{product_id}';

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

  @override
  Future<List<Products>> getProduct(int id) async {
    final response = await http.get(Uri.parse(
      url + getProductByIdEndpoint + id.toString(),
    ));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      ProductModel.fromJson(data);
      List<Products> product = ProductModel.fromJson(data).data;
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
}
