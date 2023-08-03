import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/home_page.dart';
//import 'package:flutter_application/Pages/loading_page.dart';
//import 'package:flutter_application/Pages/results_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoadingPage());
  }
}
