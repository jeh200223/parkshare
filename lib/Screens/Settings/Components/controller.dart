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
          children: <Widget>[
            Controllerwidget(
              icon: Icon(CupertinoIcons.shield, color: kprimarycolor, size: screenWidth < 900 ? 40 : 70),
              text: '차수막',
              widget: Customswitch(
                initialvalue: _checked_barrier == 1,
                onchanged: (value) {
                  setState(() {
                    _checked_barrier = value ? 1 : 0;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final Insert networking = Insert();
                final String manual = '자동';

                _checked_barrier = _checked_barrier == 0 ? 1 : 0;
                final int barrier_control = _checked_barrier;

                // 필요한 파라미터를 URL 파라미터와 JSON 데이터로 생성
                final Map<String, dynamic> data = {
                  "manual": manual,
                  "barrier_control": barrier_control,
                };
                try {
                  // insertData 함수를 호출하고 네 개의 인수를 전달
                  final dynamic response = await networking.insertData(manual, barrier_control.toString());
                  // 서버 응답에 따라 필요한 작업 수행
                  if (response is String) {
                    // 서버에서 문자열 형태로 응답한 경우
                    // 응답 데이터 사용 또는 처리
                    print("데이터 전송 성공: $response");
                  }  else {
                    // 다른 데이터 형식일 경우 처리
                    print("데이터 형식 오류: $response");
                  }
                } catch (e) {
                  // 오류 처리 (예: 에러 메시지 출력 등)
                  print("데이터 전송 실패: $e");
                }

              },
              child: Text("전송"),
            ),
          ],
        )
      ),
    );
  }
}
