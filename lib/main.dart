import 'package:flutter/material.dart';
import 'package:ai_image_generator/home_screen.dart';
import 'package:ai_image_generator/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      title: 'AI Image Generator',
      theme: ThemeData(
          fontFamily: 'poppins',
          scaffoldBackgroundColor: bgColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          )),
    );
  }
}
