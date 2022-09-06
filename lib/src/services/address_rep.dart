import 'dart:convert';

import 'package:eshop/src/constants.dart';
import 'package:eshop/src/models/address_model.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:http/http.dart' as http;

import 'http_utils.dart';

abstract class AddressRepositoryService {
  // Future<dynamic> addAddress(Address address);
  Future<Address> getAddress(String id);
  Future<List<Address>> getAddresses();
  Future<dynamic> updateAddress(Address address);
}

class AddressRepository implements AddressRepositoryService {
  static var id;

  AddressRepository();
  String url = 'http://eshoptag.com';
  String addAddressEndPoint = '/api/addresses/create?token=true';
  String getAddressEndPoint = '/api/addresses/';
  String getAddressesEndPoint = '/api/addresses?token=true';
  String updateAddressEndPoint = '/api/addresses/{$id}';

  Future<void> addAddress(String address, String city, String country,
      String phone, String postCode, String state) async {
        List<String> address1 = [address];
    Map<String, dynamic> body = {
      "address1": address1,
      "city": city,
      "country": country,
      "country_name": country,
      "phone": phone,
      "postcode": postCode,
      "state": state
    };
    const token3 = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9lc2hvcHRhZy5jb21cL2FwaVwvY3VzdG9tZXJcL2xvZ2luIiwiaWF0IjoxNjYyNDAxNTc3LCJleHAiOjE2NjI0MDUxNzcsIm5iZiI6MTY2MjQwMTU3NywianRpIjoiWVJPYXByWlZTdFBaTlZ3ZCIsInN1YiI6MTMsInBydiI6IjhmY2EwODhhYmFlMmY5YThmODRhNWYwYmY2YTY1MjQ0OTA1NWJlMDAifQ.9qqtaisqcnx9H3rLrUtE_ry-bvQvMUXNQ6Vi7nXkWHM';
   final token =  await AuthRepository().getCurrentUserToken();
    final response = await http.post(Uri.parse('http://eshoptag.com/api/addresses/create?token=true'),
        headers: {
          "Authorization":
              "Bearer "+ token,
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: json.encode(body));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      throw Exception();
    }
  }

  @override
  Future<Address> getAddress(String id) async {
    final response = await HttpUtils.getRequest(url + getAddressEndPoint + id);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Address profile = Address.fromJson(data['data']);
      return profile;
    }
  }

  @override
  Future<List<Address>> getAddresses() async {
     final token = await AuthRepository().getCurrentUserToken();
    final response = await http.get(Uri.parse(url + getAddressesEndPoint),
    
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer "+token
        });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Address> address =
          List<Address>.from(data['data'].map((x) => Address.fromJson(x)));
      return address;
    } else {
      throw Exception('Failed to get addresses');
    }
  }

  @override
  Future<dynamic> updateAddress(Address address) async {
    final response = await HttpUtils.postRequest<Map<String, dynamic>>(
        url + updateAddressEndPoint, address.toJson());
    if (response.statusCode == 200) {
      var update = json.decode(response.body);
      Address profile = Address.fromJson(update['data']);
      return profile;
    }
  }
}
