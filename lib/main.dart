import 'package:flutter/material.dart';
import 'package:glassmorphism/screen/home_screen.dart';
import 'package:glassmorphism/utils/routes.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.home: (context) => const HomeScreen(),
      },
    ),
  );
}
