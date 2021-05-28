import 'package:flutter/material.dart';
import 'package:calculator/pages/myconvert.dart';
import 'package:calculator/pages/mycal.dart';
import 'package:calculator/pages/home.dart';
import 'package:calculator/pages/myscientific.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(),
    debugShowCheckedModeBanner: false,
    initialRoute: "home",
    routes: {
      "home": (context) => Myhome(),
      "convert": (context) => Myconvert(),
      "calculator": (context) => Mycal(),
      "scientific": (context) => Myscientific(),
    },
  ));
}
