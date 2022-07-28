import 'dart:convert';

import 'package:eshop/src/models/categories_model.dart';
import 'package:eshop/src/shared/app_exception.dart';
import 'package:flutter/foundation.dart';

import 'http_utils.dart';

abstract class CategoryRepositoryService {
  Future<void> downloadCategories();
  Future<List<Categories>> getCategory(int id);
}

class CategoryRepository extends CategoryRepositoryService {
  String url = 'http://eshoptag.com';
  String categoriesEndpoint = '/api/categories?page=1';
  String getCategoryByIdEndpoint = '/api/categories/';

  @override
  Future<List<Categories>> downloadCategories() async{
    final response =  await HttpUtils.getRequest(url + categoriesEndpoint, true);

    if(response.statusCode == 200) {
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

  @override
  Future<List<Categories>> getCategory(int id) async {
    final res = await HttpUtils.getRequest(url + getCategoryByIdEndpoint + id.toString(), true);

    if(res.statusCode == 200) {
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

}
