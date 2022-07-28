import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eshop/src/models/user_model.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:flutter/cupertino.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepositoryService authRepositoryService;
  AuthenticationBloc({this.authRepositoryService})
      : super(AuthenticationInitial());

  AuthenticationState get initialState => AuthenticationInitial();

  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event, AuthenticationState currentState) async* {
    if (event is AppStarted) {
      final bool hasToken = await authRepositoryService.hasToken();
      if (hasToken) {
        yield AuthenticationSuccess();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await authRepositoryService.getCurrentUserToken();
      yield AuthenticationSuccess();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await authRepositoryService.logout();
      yield AuthenticationUnauthenticated();
    }
  }
}
