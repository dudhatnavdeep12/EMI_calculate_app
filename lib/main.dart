import 'package:flutter/material.dart';
import 'package:validator_emi_calculator/second.dart';

import 'calculationpage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => CalulatePage(),
        "second/": (context) => SecondPage(),
      },
    ),
  );
}
