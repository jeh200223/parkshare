import 'dart:async';
import 'package:flutter/material.dart';
import 'package:parkshare/Components/barrierget.dart';
import 'package:parkshare/Screens/Settings/Components/manualcontrol.dart';
import 'package:parkshare/Screens/Settings/Components/powercontrol.dart';
import 'package:parkshare/constans.dart';
import '../../../Components/temphumi.dart';
import '../../../network.dart';

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    getDatas();
    Timer.periodic(const Duration(seconds: 10), (Timer t) {
      getDatas(); // 30초마다 데이터 가져오기
    });
    super.initState();
  }

  void getDatas() async {
    try {
      List<Map<String, dynamic>> dataList =
          await NetworkSendData().getBarrierData();
      setState(() {
        _dataList = dataList;
      });
      print("dataList:$_dataList");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isAuto =
        _dataList.isNotEmpty && _dataList[0]['manual'] == "auto";
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
                  const Center(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: PercentDonut(
                        percent: 0.8,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Temperature(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: ManualControl(),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: isAuto
                            ? const SizedBox()
                            : const PowerControl(), // isAuto가 true이면 PowerControl 숨김
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
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
