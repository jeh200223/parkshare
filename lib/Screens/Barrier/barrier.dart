import 'package:flutter/material.dart';
import 'package:parkshare/constans.dart';
import 'package:parkshare/Screens/Barrier/Components/body.dart';
import 'package:parkshare/Screens/Barrier/Components/header.dart';

class Barrier extends StatefulWidget {
  const Barrier ({Key? key}) : super (key: key);

  @override
  State<Barrier> createState() => _BarrierState();
}

class _BarrierState extends State<Barrier> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: secondcolor,
          child: ListView(
            children: [
              SizedBox(height: 10),
              header(),
              SizedBox(height: 10),
              body()
            ],
          ),
        ),
      ),
    );
  }
}