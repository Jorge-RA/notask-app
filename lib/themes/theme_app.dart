import 'package:flutter/material.dart';

Color _primaryColor = Colors.purple[600]!;

final ThemeData themeAppLight = ThemeData.light().copyWith(
  primaryColor: _primaryColor,
  //AppBar
  appBarTheme: AppBarTheme(
    backgroundColor: _primaryColor,
    centerTitle: true,
    elevation: 0,
  ),

  //FloatinActionButton
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: _primaryColor,
    elevation: 5,
  ),

  //TextFormField
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: _primaryColor),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: _primaryColor,
      ),
    ),
  ),

  //Color del cursor
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: _primaryColor,
  ),

  //TextButtons
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: _primaryColor),
  ),
);
