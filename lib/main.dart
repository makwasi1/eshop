import 'package:eshop/src/constants.dart';
import 'package:eshop/src/custom_behaviour.dart';
import 'package:eshop/src/intro/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reflectable/reflectable.dart';
import 'main.reflectable.dart';


class MyReflectable extends Reflectable {
  const MyReflectable() : super(invokingCapability);
}

const myReflectable = MyReflectable();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeReflectable();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: kTransparent,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: CustomBehavior(),
          child: child,
        );
      },
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        fontFamily: 'Raleway',
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor),
      ),
      home: const Intro(),
    );
  }
}
