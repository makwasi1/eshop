import 'package:eshop/src/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class AuthCredentials {
  final String username;
  User user;

  AuthCredentials({@required this.username, this.user});
}
