import 'package:flutter/material.dart';
import 'package:parkshare/constans.dart';

class Controllerwidget extends StatelessWidget {
  const Controllerwidget({Key? key, required this.icon, required this.text, required this.widget, required this.isSwitched})
      : super(key: key);
  final Icon icon;
  final String text;
  final Widget widget;
  final bool isSwitched; // ON/OFF 상태를 나타내는 변수

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    final Color borderColor = isSwitched ? Colors.green : textcolor; // ON/OFF에 따라 테두리 색상 설정

    return Column(
      children: [
        Container(
          width: screenWidth < 900 ? 90 : 200,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderColor, width: 1), // 테두리 색상 설정
            color: Colors.white,
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
        ),
        widget
      ],
    );
  }
}
