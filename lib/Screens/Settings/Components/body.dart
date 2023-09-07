import 'package:flutter/material.dart';
import 'package:parkshare/Screens/Settings/Components/manualcontrol.dart';
import 'package:parkshare/Screens/Settings/Components/powercontrol.dart';
import 'package:parkshare/components/temphumi.dart';
import 'package:parkshare/constans.dart';

class body extends StatefulWidget {
  const body ({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body>{

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: secondcolor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenWidth < 900 ? 20 : 80),
                  TemperatureUp(),
                  SizedBox(
                    height: 30,),
                  Row(
                    children: [
                      Expanded(
                        child: ManualControl(),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: PowerControl(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}