import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/home_page.dart';
import 'Pages/loading_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAQssJM7OZjnWoARUzqMJtnQzoU3ODtnFg',
          appId: '1:81331791443:android:3a958bb3601fbc5dc908a6',
          messagingSenderId: '81331791443',
          projectId: 'nsbmez'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}
