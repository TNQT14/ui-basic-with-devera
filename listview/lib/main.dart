import 'package:flutter/material.dart';
import 'data/data.dart';
import 'screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // List<double> aaa = weeklySpending as List<double>;

    return MaterialApp(
     home: Home(expense: weeklySpending, categories: categories),
      );
  }
}
