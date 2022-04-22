import 'package:flutter/material.dart';
import 'package:textify/screens/login_screen.dart';
import 'package:textify/screens/home_screen.dart';
import 'package:textify/screens/idinput_screen.dart';
import 'package:textify/screens/settings_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LogInScreen(),
    );
  }
}
