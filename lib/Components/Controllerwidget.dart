import 'package:flutter/material.dart';
import 'package:parkshare/constans.dart';

class Controllerwidget extends StatelessWidget {
  const Controllerwidget({Key? key, required this.icon, required this.text, required this.widget})
  : super(key: key);
  final Icon icon;
  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    return Column(children: [
      Container(
        width: screenWidth < 900 ? 90 : 200,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: textcolor, width: 1),
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: 10,),
            Text(text, style: TextStyle(fontSize: screenWidth < 900 ? 13 : 20),)
          ],
        ),
      )
    ],);
  }
}