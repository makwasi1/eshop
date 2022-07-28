import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginButtonPressed({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];

  @override 
  String toString() => 'LoginButtonPressed { email: $email, password: $password }';
 
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  const LoginPasswordChanged({this.password});

  @override
  List<Object> get props => [password];
}

class SignOutRequested extends LoginEvent {
  @override

  List<Object> get props => [];
}

class SignUpButtonPressed extends LoginEvent {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String confirmPassword;

  const SignUpButtonPressed({ this.email,this.firstName, this.lastName, this.password ,this.confirmPassword });

  @override
  List<Object> get props => [email, firstName, lastName, password, confirmPassword];
}
