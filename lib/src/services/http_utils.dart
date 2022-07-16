import 'dart:async';
import 'dart:convert' show Encoding, utf8;
import 'dart:io';

import 'package:eshop/src/shared/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:http/http.dart';

import 'auth_repo.dart';

class HttpUtils {
  //all the tokens for the sharedprefs go here
  static int timeout = 3000;
  static String refreshToken = 'refresh_token';
  static String keyForJWTToken = 'accessToken';
  static String keyForUsername = 'username';

  static String encodeUTF8(String toEncode) {
    return utf8.decode(toEncode.runes.toList());
  }

  static Future<Object> headers([bool session = true]) async {
    final String jwt = await AuthRepository().getCurrentUserToken();

    if (!session) {
      return {
        'Accept': 'application/json;charset=UTF-8',
        'Content-Type': 'application/json',
        'Charset': 'utf-8',
      };
    }
    if (jwt != null) {
      return {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
        // 'Cookie': 'client_id=a7911497-4044-43b3-87c9-04d75c7707ad'
      };
    } else {
      return {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
    }
  }

  static Future<Response> postRequest<T>(String endpoint, T body,
      [bool session = true]) async {
    var headers = await HttpUtils.headers(session);
    final String json =
        JsonMapper.serialize(body,  SerializationOptions(indent: ''));
    Response response;
    try {
      response = await http
          .post(Uri.parse(endpoint),
              headers: headers,
              body: json,
              encoding: Encoding.getByName('utf-8'))
          .timeout(Duration(seconds: timeout));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Request timeout');
    }
    print('Response:${response.statusCode}');
    return response;
  }

  static Future<Response> getRequest(String endpoint,
      [bool session = true]) async {
    var headers = await HttpUtils.headers(session);
    Response response;
    try {
      response = await http
          .get(Uri.parse(endpoint), headers: headers)
          .timeout(Duration(seconds: timeout));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Request timeout');
    }
    print('Response:${response.statusCode}');
    return response;
  }

  static Future<Response> putRequest<T>(String endpoint, T body,
      [bool session = true]) async {
    var headers = await HttpUtils.headers(session);
    final String json =
        JsonMapper.serialize(body, SerializationOptions(indent: ''));
    Response response;
    try {
      response = await http
          .put(Uri.parse(endpoint),
              headers: headers,
              body: json,
              encoding: Encoding.getByName('utf-8'))
          .timeout(Duration(seconds: timeout));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Request timeout');
    }
    return response;
  }

  static Future<Response> deleteRequest(String endpoint,
      [bool session = true]) async {
    var headers = await HttpUtils.headers(session);
    try {
      return await http
          .delete(Uri.parse(endpoint), headers: headers)
          .timeout(Duration(seconds: timeout));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Request timeout');
    }
  }

  static Future<Response> postMulitpartRequest<T>(String endpoint, T body,
      [bool session = true]) async {
    var headers = await HttpUtils.headers(session);
    final String json =
        JsonMapper.serialize(body, const SerializationOptions(indent: ''));
    Response response;
    try {
      response = await http
          .post(Uri.parse(endpoint),
              headers: headers,
              body: json,
              encoding: Encoding.getByName('utf-8'))
          .timeout(Duration(seconds: timeout));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Request timeout');
    }
    return response;
  }
}
