import 'package:flutter/material.dart';

import '../../constans.dart';
import 'Components/body.dart';
import 'Components/header.dart';

class User extends StatefulWidget {
  const User ({Key ? key}) : super (key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User>{

  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      body: Center(
        child: Container(
          color: secondcolor,
          child: ListView(
            children: [
              SizedBox(height: 10),
              header(),
              SizedBox(height: 10),
              body(),
            ],
          ),
        ),
      ),
    );
  }
}