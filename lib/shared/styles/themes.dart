import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Myfont',
  floatingActionButtonTheme:FloatingActionButtonThemeData(
      backgroundColor: defaultcolor
  ),
  scaffoldBackgroundColor: Colors.black87,
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    iconTheme: IconThemeData(color: defaultcolor),
    titleTextStyle: TextStyle(
        fontFamily: 'Myfont',
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold
    ),
    backgroundColor: Colors.black87,
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultcolor,
      unselectedItemColor: Colors.white,
      elevation: 20,
      backgroundColor: Colors.black
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontFamily: 'Myfont',
        fontSize: 20,
        height: 1.3,
        fontWeight: FontWeight.w800,
        color: Colors.white
    ),
    bodyText2: TextStyle(
        fontFamily: 'Myfont',
        fontSize: 15,
        height: 1.3,
        fontWeight: FontWeight.w400,
        color: Colors.white
    ),
    caption: TextStyle(
        fontFamily: 'Myfont',
        fontSize: 10,
        height: 1.3,
        fontWeight: FontWeight.w100,
        color: Colors.white70,
    ),

  ),
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: Colors.white,
    suffixIconColor: Colors.white,
    focusColor: defaultcolor,
    labelStyle: TextStyle(
      color: Colors.white,
    ),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: defaultcolor)),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
     disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
  ),
  textButtonTheme: TextButtonThemeData(
    style:ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
    ),
  ),
    iconTheme: IconThemeData(
      color:defaultcolor,
    )
) ;
ThemeData lightTheme = ThemeData(
    fontFamily: 'Myfont',
    floatingActionButtonTheme:FloatingActionButtonThemeData(
        backgroundColor: defaultcolor,
    ),
    scaffoldBackgroundColor: backGround,
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      iconTheme: IconThemeData(color: defaultcolor),
      titleTextStyle: TextStyle(
          fontFamily: 'Myfont',
          color: textColor,
          fontSize: 25,
          fontWeight: FontWeight.bold
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defaultcolor,
        elevation: 20

    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontFamily: 'Myfont',
          fontSize: 20,
          height: 1.3,
          fontWeight: FontWeight.w800,
          color: Colors.black87
      ),
      bodyText2: TextStyle(
          fontFamily: 'Myfont',
          fontSize: 15,
          height: 1.3,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),
      caption: TextStyle(
        fontFamily: 'Myfont',
        fontSize: 10,
        height: 1.3,
        fontWeight: FontWeight.w100,
        color: Colors.grey[500],
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: Colors.black26,
      suffixIconColor: Colors.black26,
      focusColor: defaultcolor,
      labelStyle: TextStyle(
        color: Colors.black54,
      ),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: defaultcolor)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),

    ),
    textButtonTheme: TextButtonThemeData(
      style:ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
      ),
      ),
    iconTheme: IconThemeData(
      color:defaultcolor,
    ),


) ;