import 'package:flutter/material.dart';
import 'package:parkshare/Screens/Barrier/Components/header.dart';
import 'package:parkshare/Screens/Settings/Components/body.dart';
import 'package:parkshare/constans.dart';

class Settings extends StatefulWidget {
  const Settings ({Key ? key}) : super (key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings>{

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