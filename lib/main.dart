import 'package:eshop/src/bloc/address/bloc/address_bloc.dart';
import 'package:eshop/src/bloc/auth/authentication_bloc.dart';
import 'package:eshop/src/bloc/cart_bloc/bloc/cart_bloc.dart';
import 'package:eshop/src/bloc/login/login_bloc.dart';
import 'package:eshop/src/bloc/products/product_bloc.dart';
import 'package:eshop/src/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/custom_behaviour.dart';
import 'package:eshop/src/home/home.dart';
import 'package:eshop/src/intro/intro.dart';
import 'package:eshop/src/intro/splash.dart';
import 'package:eshop/src/services/address_rep.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:eshop/src/services/cart_repo.dart';
import 'package:eshop/src/services/products_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reflectable/reflectable.dart';
import 'main.reflectable.dart';
import 'package:bloc/bloc.dart';

class MyReflectable extends Reflectable {
  const MyReflectable() : super(invokingCapability);
}

const myReflectable = MyReflectable();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeReflectable();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => ProductRepository(),
      ),
      RepositoryProvider(
        create: (context) => CartRepository(),
      ),
      RepositoryProvider(
        create: (context) => AddressRepository(),
      ),
    ],
    child: const MyApp(),
  ));
}

myProviders() {
  return [
    // BlocProvider<CartBloc>(
    //   create: (BuildContext context) => CartBloc(),
    // ),
    // BlocProvider<ProductBloc>(
    //   create: (BuildContext context) => ProductBloc(),
    // )

    // BlocProvider<LoginBloc>(create: (context) => LoginBloc(authRepository: AuthRepository())),
    BlocProvider(
        create: (_) =>
            ProductBloc(productRepository: ProductRepository())
              ..add(ProductsFetchedEvent())),

  ];
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) =>
              ProductBloc(productRepository: ProductRepository())
                ..add(ProductsFetchedEvent())),
          // BlocProvider(
          //   create: (context) =>
          //       AuthenticationBloc(authRepository: AuthRepository()),
          // ),
          BlocProvider(
              create: (_) =>
                  AddressBloc(addressRepository: AddressRepository())
                    ..add(AddressStartedEvent())),
          BlocProvider(
            create: (context) =>
                CartBloc(cartRepository: CartRepository())..add(CartStarted()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Eshop Tag',
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: CustomBehavior(),
              child: child,
            );
          },
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            fontFamily: 'Raleway',
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: kAccentColor),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const Splash(),
            '/home': (context) => BottomNavBar(0),
          },
        ));
  }
}
