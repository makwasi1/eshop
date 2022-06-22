import 'package:eshop/src/constants.dart';
import 'package:eshop/src/custom_behaviour.dart';
import 'package:eshop/src/intro/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  // final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  // await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
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
