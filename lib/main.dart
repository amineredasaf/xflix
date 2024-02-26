import 'package:flutter/material.dart';
import 'package:watchit/pages/HomeScreen.dart';
import 'package:watchit/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'oraflix',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.ScaffoldBgcolor,
        // useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
