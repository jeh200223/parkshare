import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkshare/Components/Controllerwidget.dart';
import 'package:parkshare/Components/Customswitch.dart';
import 'package:parkshare/constans.dart';
import '../../../network.dart';

class ManualControl extends StatefulWidget {
  const ManualControl({Key? key}) : super(key: key);

  @override
  State<ManualControl> createState() => _ManualControl();
}

class _ManualControl extends State<ManualControl> {
  List<Map<String, dynamic>> _dataList = [];
  String _checked_manual = "manual"; // 초기값을 "수동"을 나타내는 0으로 설정


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    return Container(
      decoration: BoxDecoration(
        color: secondcolor,
      ),
      child: SingleChildScrollView(
          child: Column(
            children: [
              Controllerwidget(
                icon: _checked_manual == "manual" ?
                Icon(CupertinoIcons.shield, color: kprimarycolor, size: screenWidth < 900 ? 40 : 70)
                : Icon(CupertinoIcons.shield_fill, color: kprimarycolor, size: screenWidth < 900 ? 40 : 70),
                text: _checked_manual == "manual" ? "자동" : "수동",
                widget: Customswitch(
                  initialvalue: _checked_manual == "auto",
                  onchanged: (value) {
                    setState(() {
                      _checked_manual = value ? "manual" : "auto";
                    });
                    final Insert networking = Insert();
                    final int barrier_control = 0;
                    _checked_manual = _checked_manual == "manual" ? "auto" : "manual";
                    final String manual_control = _checked_manual;

                    networking.insertData_auto(manual_control, barrier_control.toString());
                  },
                ), isSwitched: _checked_manual == "manual" ? false : true,
              ),
            ],
          )
      ),
    );
  }
}
