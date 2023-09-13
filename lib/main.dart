import 'package:flutter/material.dart';
import 'package:parkshare/WelcomeScreen/mainscreens.dart';

import 'network.dart';

void main() {
  sendDefaultData();
  runApp(const MyApp());
}

void sendDefaultData() async {
  final Insert networking = Insert();
  final int barrier_control = 0;
  final String manual = "manual";

  networking.insertData(manual, barrier_control.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
