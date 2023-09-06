import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkshare/Components/Controllerwidget.dart';
import 'package:parkshare/Components/Customswitch.dart';
import 'package:parkshare/constans.dart';

import '../../../network.dart';

class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  List<Map<String, dynamic>> _dataList = [];
  bool _checked_barrier = false;

  @override
  void initState() {
    getDatas();
    super.initState();
  }

  Future<void> getDatas() async {
    try {
      List<Map<String, dynamic>> dataList = await NetworkSendData().getExampleData();
      setState(() {
        _dataList = dataList;
        String manual = _dataList.isNotEmpty ? _dataList[0]['manual']: null;
        _checked_barrier = _dataList.isNotEmpty ? _dataList[0]['barrier_control'] == 1 : false;
      });
    } catch (e) {
      print(e);
    }
  }

  void toggleBarrier(bool newValue) {
    String manualValue = "수동"; // 원하는 "manual" 값 설정
    int barrierControlValue = newValue ? 1 : 0;

    setState(() {
      _checked_barrier = newValue; // UI 업데이트
    });

    // 서버에 변경된 정보를 전송
    String url = 'http://capstone.ctrls-studio.com/app_wemos.php?mode=insert&manual=$manualValue&barrier_control=$barrierControlValue';

    // Uri 객체 생성
    final Uri uri = Uri.parse(url);

    Insert networking = Insert();
    networking.insertData(manualValue, barrierControlValue, manualValue, 1).then((response) {
      // 서버 요청이 완료된 후에 수행할 작업 (예: 성공 메시지 출력 등)
      print("차수막 상태 변경 완료");
    }).catchError((error) {
      // 오류 처리 (예: 에러 메시지 출력 등)
      print("차수막 상태 변경 실패: $error");
      // 업데이트가 실패했으므로 다시 이전 상태로 되돌릴 수 있습니다.
      setState(() {
        _checked_barrier = !_checked_barrier;
      });
    });
  }


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
              icon: Icon(CupertinoIcons.shield, color: kprimarycolor, size: screenWidth < 900 ? 40 : 70,),
              text: "차수막",
              widget: Customswitch(
                initialvalue: _checked_barrier,
                onchanged: toggleBarrier,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 차수막을 ON 또는 OFF하는 서버 요청을 수행
                toggleBarrier(!_checked_barrier); // 현재 상태 반전하여 전달
              },
              child: Text(_checked_barrier ? "차수막 끄기" : "차수막 켜기"),
            ),
          ],
        ),
      ),
    );
  }
}
