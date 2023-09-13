import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkshare/Components/Controllerwidget.dart';
import 'package:parkshare/Components/Customswitch.dart';
import 'package:parkshare/constans.dart';
import '../../../network.dart';

class PowerControl extends StatefulWidget {
  const PowerControl({Key? key}) : super(key: key);

  @override
  State<PowerControl> createState() => _PowerControl();
}

class _PowerControl extends State<PowerControl> {
  List<Map<String, dynamic>> _dataList = [];
  int _checked_barrier = 0; // 초기값을 "수동"을 나타내는 0으로 설정


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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Controllerwidget(
              icon: _checked_barrier == 0 ?
              Icon(Icons.water_drop_outlined, color: kprimarycolor, size: screenWidth < 900 ? 40 : 70)
              : Icon(Icons.water_drop, color: kprimarycolor, size: screenWidth < 900 ? 40 : 70),
              text: _checked_barrier == 0 ? "켜기" : "끄기",
              widget: Customswitch(
                initialvalue: _checked_barrier == 1,
                onchanged: (value) async {
                  setState(() {
                    _checked_barrier = value ? 1 : 0;
                  });
                    final Insert networking = Insert();
                    final String manual = 'manual';

                    _checked_barrier = _checked_barrier == 0 ? 0 : 1;
                    final int barrier_control = _checked_barrier;

                    networking.insertData(manual, barrier_control.toString());
                },
              ), isSwitched: _checked_barrier == 0 ? false : true,
            ),
          ],
        )
      ),
    );
  }
}
