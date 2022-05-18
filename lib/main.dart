import 'package:flutter/material.dart';
import 'package:qyre_test/constants/theme.dart';
import 'package:qyre_test/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qyre_test',
      theme:  Apptheme.lightTheme(),
      home: const HomePage(),
    );
  }
}

 