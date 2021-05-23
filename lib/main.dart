import 'dart:ui';
import 'package:coinmatch/home.dart';
import 'package:coinmatch/providers/card_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'providers/home_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'globals.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(CoinmatchApp());
}

class CoinmatchApp extends StatelessWidget {
  static double ff = 1.0;

  @override
  Widget build(BuildContext context) {
    final sz = window.physicalSize;
    final aspect = ((sz.longestSide / sz.shortestSide) / 1.41).clamp(1.0, 2.0);
    ff =
        sz.longestSide / window.textScaleFactor / (1 + (aspect - 1) / 2) / 2200;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => CardProvider()),
        ChangeNotifierProvider(
          create: (c) => HomeProvider(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'Coinmatch',
        theme: ThemeData(
          fontFamily: 'Poppins',
          brightness: Brightness.dark,
          primarySwatch: Pallette.primary,
          disabledColor: Color(0xCCEBEBF5),
          backgroundColor: Pallette.background,
          accentColor: Pallette.accent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          errorColor: Pallette.error,
          splashColor: Colors.white38,
          hoverColor: Colors.white10,
          splashFactory: InkRipple.splashFactory,
          inputDecorationTheme: InputDecorationTheme(
              border: InputBorder.none,
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Pallette.error, width: 2)),
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Pallette.error, width: 2)),
              errorStyle: TextStyle(height: 0, color: Colors.transparent)),
          textSelectionTheme: TextSelectionThemeData(
              selectionHandleColor: Pallette.accent,
              cursorColor: Pallette.accent,
              selectionColor: Pallette.accent.withOpacity(0.5)),
          textTheme: TextTheme(
            headline1: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34 * ff,
                height: 1.205,
                letterSpacing: 0.41 * ff,
                color: Pallette.content),
            headline2: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28 * ff,
                height: 1.214,
                letterSpacing: 0.34 * ff,
                color: Pallette.content),
            headline3: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22 * ff,
                height: 1.273,
                letterSpacing: 0.34 * ff,
                color: Pallette.content),
            bodyText1: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 17 * ff,
                height: 1.294,
                letterSpacing: -0.41 * ff,
                color: Pallette.content),
            bodyText2: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15 * ff,
                height: 1.2,
                letterSpacing: -0.24 * ff,
                color: Pallette.content),
            subtitle1: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13 * ff,
                height: 1.384,
                letterSpacing: -0.08 * ff,
                color: Pallette.content),
            subtitle2: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11 * ff,
                height: 1.182,
                letterSpacing: 0.07 * ff,
                color: Pallette.content),
            overline: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15 * ff,
                height: 1.333,
                letterSpacing: -0.24 * ff,
                color: Pallette.content),
            button: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 17 * ff,
                height: 1.294,
                letterSpacing: -0.41 * ff,
                color: Pallette.primary),
          ),
        ),
        home: CoinmatchHomePage(),
      ),
    );
  }
}
