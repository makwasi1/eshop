import 'dart:convert';

import 'package:eshop/src/models/http_msg_model.dart';
import 'package:eshop/src/models/user_model.dart';
import 'package:eshop/src/services/auth_credentials.dart';
import 'package:eshop/src/services/http_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_logs/flutter_logs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

abstract class AuthRepositoryService {
  Future<dynamic> login(String username, String password);
  Future<String> getCurrentUserToken();
  Future<UserModel> getCurrentLoggedInUser();
  Future<bool> hasToken();
  Future<void> logout();
  Future<void> storeLoggedInUser(UserModel user);
  Future<HttpMsg> sendPasswordReset(String accountIdentifier,
      String accountIdentifierType, String token, String newPassword);
}

class AuthRepository implements AuthRepositoryService {
  AuthRepository();
  AuthCredentials guest = AuthCredentials(
      username: 'Guest',
      user: User(
        // id: int.parse(Uuid().v4()),
        email: 'null',
        firstName: 'Guest',
        lastName: 'Guest',
        name: 'Guest',
        gender: 'Non',
        dateOfBirth: 'Non',
        phone: '+256-0',
        status: 0,
      ));

  String url = 'http://eshoptag.com';
  String registerEnPoint = '/api/customer/register';
  String loginEndPoint = '/api/customer/login?token=true';
  String getProfileEndPoint = '/api/customer/get';
  String getCustomerByIdEndPoint = '/api/customer/';
  String updateProfileEndPoint = '/api/customer/profile';
  String logOutEndPoint = '/api/customer/logout';
  String forgotPasswordEndpoint = '/api/customer/forgot-password';

  ///user login with email and password
  @override
  Future<dynamic> login(String email, String password) async {
    final response = await http.post(
        Uri.parse(url + loginEndPoint),
        body: jsonEncode({"email": email, "password": password}),
        headers: {
      'Content-type': 'application/json',
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      User profile = User.fromJson(data['data']);
      // String accessToken = User.fromJson(data['token']) as String;

      UserModel user = UserModel(token: data['token'], data: profile);

      return user;
    } else if (response.statusCode == 401) {
      return "Wrong Credentials";
    } else if (response.statusCode == 500) {
      return "System Currently unavailable, please try again later";
    } else {
      return "Error, Retry!";
    }
  }

  //register a new user
  Future<String> register(String email, String firstName, String lastName,
      String password, String passwordConfirmation) async {
    final response = await http.post(Uri.parse(url + registerEnPoint),
        body: jsonEncode({
          "email": email,
          "first_name": firstName,
          "last_name": lastName,
          "password": password,
          "password_confirmation": passwordConfirmation
        }),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);
      //return snackbar with success message
      SnackBar snackbar = SnackBar(
        content: Text(data['message']),
        backgroundColor: Colors.green,
      );
      FlutterSecureStorage storage = FlutterSecureStorage();
      await storage.write(key: HttpUtils.keyForUsername, value: data['name']);
      return data['message'];
    } else if (response.statusCode == 422) {
      return "User With Email Address already exists";
    } else if (response.statusCode == 500) {
      return "System Currently unavailable, please try again later";
    } else {
      return "Error, Retry!";
    }
  }

  //update user profile
  Future<String> updateProfile(
      {String email,
      String firstName,
      String lastName,
      String name,
      String password,
      String passwordConfirmation}) async {
    final response = await HttpUtils.putRequest<Map<String, dynamic>>(
        url + updateProfileEndPoint, {
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "password": password,
      "password_confirmation": passwordConfirmation
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);
      return data['message'];
    } else if (response.statusCode == 400) {
      return "Invalid Credentials";
    } else if (response.statusCode == 500) {
      return "System Currently unavailable, please try again later";
    } else {
      return "Error, Retry!";
    }
  }

  @override
  Future<UserModel> getCurrentLoggedInUser() async {
    try {
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String username = await storage.read(key: HttpUtils.keyForUsername);
      String token = await storage.read(key: HttpUtils.keyForJWTToken);

      var user = UserModel(token: token, data: User(name: username));
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String> getCurrentUserToken() {
    try {
      FlutterSecureStorage storage = const FlutterSecureStorage();
      return storage.read(key: HttpUtils.keyForJWTToken);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> hasToken() async {
    try {
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String token = await storage.read(key: HttpUtils.keyForJWTToken);
      return token != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> logout() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.deleteAll();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set keys = prefs.getKeys();
    for (var key in keys) {
      await prefs.remove(key);
    }
  }

  @override
  Future<HttpMsg> sendPasswordReset(String accountIdentifier,
      String accountIdentifierType, String token, String newPassword) {
    return null;
  }

  @override
  Future<void> storeLoggedInUser(UserModel user) async {
    try {
      FlutterSecureStorage storage = const FlutterSecureStorage();
      await storage.write(key: HttpUtils.keyForJWTToken, value: user.token);
      await storage.write(
          key: HttpUtils.keyForUsername, value: json.encode(user.data));
      await storage.delete(key: HttpUtils.keyForJWTToken);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (user != null)
        await prefs.setString(HttpUtils.keyForUsername, json.encode(user.data));
    } catch (e) {
      e.toString();
    }
  }
}
