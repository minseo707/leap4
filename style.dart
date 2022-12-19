import 'package:flutter/material.dart';

var theme = ThemeData(
    fontFamily: 'SansM',
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black
    ),
    iconTheme: const IconThemeData(
        size: 46
    ),
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        shadowColor: Colors.black12,
    )
);

var black = const TextStyle(
    fontFamily: 'SansM',
    color: Colors.black,
    fontSize:25
);