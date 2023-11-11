import 'package:flutter/material.dart';
import 'recipecalc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      home: RecipeCalculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}
