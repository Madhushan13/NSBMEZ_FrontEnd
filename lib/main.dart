import 'package:flutter/material.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(const NSBMEZ());
}

class NSBMEZ extends StatelessWidget {
  const NSBMEZ({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
