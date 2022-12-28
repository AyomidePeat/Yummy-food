import 'package:flutter/material.dart';
import 'package:flutter_recipe/models/recipe.api.dart';
import 'package:flutter_recipe/models/recipe.dart';
import 'package:flutter_recipe/views/home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
 // const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner:false,
    home:  HomePage(),
    );
  }
}