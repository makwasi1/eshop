import 'package:eshop/src/bloc/login/login_bloc.dart';
import 'package:eshop/src/bloc/login/login_state.dart';
import 'package:eshop/src/bloc/login/login_event.dart';
import 'package:eshop/src/delivery/delivery.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';

class RegisterForm extends StatefulWidget {
  final AuthRepository userRepository;
  const RegisterForm({Key key, this.userRepository}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState(userRepository);
}

class _RegisterFormState extends State<RegisterForm> {
  final AuthRepository userRepository;
  _RegisterFormState(this.userRepository);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    _onRegisterButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        SignUpButtonPressed(
          email: _emailController.text,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          password: _passwordController.text,
          confirmPassword: _confirmPasswordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Registration failed."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if(state is LoginLoading){
            return const Center (
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoginSuccess) {
              setState(() {
                Navigator.push(
                    context,
            MaterialPageRoute(
                builder: (context) =>
                   const DeliveryAddress()));
              });
            
          }

          if(state is UnAuthenticated){
            return Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 80.0),
              child: Form(
                child: Column(
                  children: [
                    Container(
                        height: 200.0,
                        padding: EdgeInsets.only(bottom: 20.0, top: 40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Register",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Eshop Tag..",
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.black38),
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: kDarkColor,
                          fontWeight: FontWeight.bold),
                      controller: _firstNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon:
                        Icon(EvaIcons.person, color: Colors.black26),
                        enabledBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(30.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(30.0)),
                        contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                        labelText: "First Name",
                        hintStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                        labelStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      autocorrect: false,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: kDarkColor,
                          fontWeight: FontWeight.bold),
                      controller: _lastNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon:
                        Icon(EvaIcons.personAddOutline, color: Colors.black26),
                        enabledBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(30.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(30.0)),
                        contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                        labelText: "Last Name",
                        hintStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                        labelStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      autocorrect: false,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: kDarkColor,
                          fontWeight: FontWeight.bold),
                      controller: _emailController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon:
                        Icon(EvaIcons.emailOutline, color: Colors.black26),
                        enabledBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(30.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(30.0)),
                        contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                        labelText: "E-Mail",
                        hintStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                        labelStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      autocorrect: false,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: kDarkColor,
                          fontWeight: FontWeight.bold),
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon:
                        Icon(EvaIcons.lockOutline, color: Colors.black26),
                        enabledBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(30.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(30.0)),
                        contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                        labelText: "Password",
                        hintStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                        labelStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      autocorrect: false,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: kDarkColor,
                          fontWeight: FontWeight.bold),
                      controller: _confirmPasswordController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon:
                        const Icon(EvaIcons.lockOutline, color: Colors.black26),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(30.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(30.0)),
                        contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                        labelText: "Confirm Password",
                        hintStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                        labelStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      autocorrect: false,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: InkWell(
                    //       child: const Text(
                    //         "Forget password?",
                    //         style:
                    //         TextStyle(color: Colors.black45, fontSize: 12.0),
                    //       ),
                    //       onTap: () {}),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                              height: 45,
                              child: state is LoginLoading
                                  ? Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            height: 25.0,
                                            width: 25.0,
                                            child: CupertinoActivityIndicator(),
                                          )
                                        ],
                                      ))
                                ],
                              )
                                  : RaisedButton(
                                  color: kPrimaryColor,
                                  disabledColor: kPrimaryColor,
                                  disabledTextColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  onPressed: _onRegisterButtonPressed,
                                  child: const Text("REGISTER",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)))),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Or connect using",
                          style: TextStyle(color: Colors.black26, fontSize: 12.0),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40.0,
                          width: 180.0,
                          child: RaisedButton(
                              color: Color(0xFF385c8e),
                              disabledColor: Color(0xFF385c8e),
                              disabledTextColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              onPressed: _onRegisterButtonPressed,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    EvaIcons.facebook,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text("Facebook",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              )),
                        ),
                        Container(
                          width: 180.0,
                          height: 40.0,
                          child: RaisedButton(
                              color: Color(0xFFf14436),
                              disabledColor: Color(0xFFf14436),
                              disabledTextColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    EvaIcons.google,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text("Google",
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            padding: EdgeInsets.only(bottom: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 5.0),
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
