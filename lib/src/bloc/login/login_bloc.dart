import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eshop/src/bloc/auth/authentication_bloc.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({@required this.authRepository}) : super(UnAuthenticated()){
    on<LoginButtonPressed>((event , emit) async{
      emit(LoginLoading());
      try{
        await authRepository.login(event.email, event.password);
        emit(LoginSuccess());
      }catch(e){
        emit(LoginFailure(error: e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignUpButtonPressed>((event, emit) async{
      emit(LoginLoading());
      try{
        await authRepository.register(event.email, event.firstName, event.lastName, event.password, event.confirmPassword);
        emit(LoginSuccess());
      }catch(e){
        emit(LoginFailure(error: e.toString()));
        emit(UnAuthenticated());
      }
    });
  }
}
