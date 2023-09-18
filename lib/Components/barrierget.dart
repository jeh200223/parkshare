import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../network.dart';

class Barrierget extends StatefulWidget {
  const Barrierget ({Key ? key}) : super (key: key);

  @override
  State<Barrierget> createState() => _BarrierState();
}

class _BarrierState extends State<Barrierget> with TickerProviderStateMixin {
  List<Map<String, dynamic>> _dataList = [];
  double percentage = 0.0;
  double newPercentage = 0.0;

  late AnimationController percentageAnimation;

  @override
  void initState() {
    getDatas();
    super.initState();

    percentageAnimation = AnimationController(vsync: this, duration: new Duration(milliseconds: 2000)
    ) ..addListener(() {setState(() {
      percentage = lerpDouble(percentage, newPercentage, percentageAnimation.value)!;
      });
    });
    setState(() {
      percentage = newPercentage;
      newPercentage = 0.8;
      percentageAnimation.forward();
    });
  }

  void getDatas() async {
    try {
      List<Map<String, dynamic>> dataList = await NetworkSendData().getBarrierData();
      setState(() {
        _dataList = dataList;
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Center(
          child: PercentDonut(percent : percentage, color : Colors.lightBlue),
        ),
      ),
    );
  }
}

class PercentDonut extends StatelessWidget{
  const PercentDonut({Key? key, required this.percent, required this.color}) : super (key: key);
  final percent;
  final color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 310,
      height: 310,
      child: CustomPaint(
        painter: PercentDonutPaint(
          percentage : percent,
          activeColor : color,
        ),
      ),
    );
  }
}

class PercentDonutPaint extends CustomPainter{
  double percentage;
  double textScaleFactor = 1.0;
  Color activeColor;
  PercentDonutPaint({required this.percentage, required this.activeColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
        ..color = Color(0xfff3f3f3)
        ..strokeWidth = 15.0
        ..style =
            PaintingStyle.stroke
        ..strokeCap =
            StrokeCap.round;
    double radius = min(size.width / 2 - paint.strokeWidth / 2,
        size.height / 2 - paint.strokeWidth / 2);
    Offset center = 
        Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, paint);
    double arcAngle = 2 * pi * percentage;
    paint.color = activeColor;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, arcAngle, false, paint);
    drawText(canvas, size, "${(percentage * 100).round()} / 100");
  }

  void drawText(Canvas canvas, Size size, String text) {
    double fontSize = getFontSize(size, text);

    TextSpan sp = TextSpan(
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black),
    text: text);
    TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.ltr);

    tp.layout();
    double dx = size.width / 2 - tp.width / 2;
    double dy = size.height / 2 - tp.height / 2;

    Offset offset = Offset(dx, dy);
    tp.paint(canvas, offset);
  }

  double getFontSize(Size size, String text) {
    return size.width / text.length * textScaleFactor;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}