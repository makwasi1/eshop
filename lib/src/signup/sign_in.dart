import 'package:eshop/src/bloc/auth/authentication_bloc.dart';
import 'package:eshop/src/bloc/login/login_bloc.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:eshop/src/signup/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  final AuthRepository authRepository;
  const SignIn({Key key, @required this.authRepository})
      : assert(authRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            // authBloc: BlocProvider.of<AuthenticationBloc>(context),
            authRepository: authRepository,
          );
        },
        child: LoginForm(userRepository: authRepository,),
      ),
    );
  }
}
