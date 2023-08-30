import 'package:flutter/material.dart';
import 'package:parkshare/WelcomeScreen/mainscreens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Mainscreen(),
    );
  }
}
