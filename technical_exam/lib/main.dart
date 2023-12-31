import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:technical_exam/screens/details_screen.dart';
import 'package:technical_exam/screens/home_screen.dart';
import 'package:technical_exam/screens/screen2.dart';
import 'package:technical_exam/screens/screen3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/details': (context) => DetailsScreen(),
        '/screen2': (context) => const Screen2(),
        '/screen3': (context) => const Screen3(),
      },
    );
  }
}
