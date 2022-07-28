import 'dart:convert';

import 'package:eshop/src/constants.dart';
import 'package:eshop/src/models/address_model.dart';

import 'http_utils.dart';

abstract class AddressRepositoryService {
  Future<dynamic> addAddress(Address address);
  Future<Address> getAddress(String id);
  Future<List<Address>> getAddresses();
  Future<dynamic> updateAddress(Address address);
}

class AddressRepository implements AddressRepositoryService {
  static var id;

  AddressRepository();
  String url = 'http://eshoptag.com';
  String addAddressEndPoint = '/api/addresses/create';
  String getAddressEndPoint = '/api/addresses/';
  String getAddressesEndPoint = '/api/addresses';
  String updateAddressEndPoint = '/api/addresses/{$id}';
  @override
  Future<dynamic> addAddress(Address address) async {
    final response = await HttpUtils.postRequest<Map<String, dynamic>>(
        url + addAddressEndPoint, address.toJson());
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Address profile = Address.fromJson(data['data']);
      return profile;
    }
  }

  @override
  Future<Address> getAddress(String id) async {
    final response = await HttpUtils.getRequest(
        url + getAddressEndPoint + id);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Address profile = Address.fromJson(data['data']);
      return profile;
    }
  }

  @override
  Future<List<Address>> getAddresses() async {
    final response = await HttpUtils.getRequest(url + getAddressesEndPoint);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Address> profile =
          List<Address>.from(data['data'].map((x) => Address.fromJson(x)));
      return profile;
    }
  
  }

  @override
  Future<dynamic> updateAddress(Address address) async {
    final response = await HttpUtils.postRequest<Map<String, dynamic>>(
        url + updateAddressEndPoint, address.toJson());
    if (response.statusCode == 200) {
      var update =  json.decode(response.body);
      Address profile = Address.fromJson(update['data']);
      return profile;
    }
  }
}
