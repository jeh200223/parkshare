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
              icon: Icon(Icons.ac_unit, color: kprimarycolor, size: screenWidth < 900 ? 40 : 70),
              text: '팬',
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
                final String manual = '수동'; // URL 파라미터 값
                final String barrier_control = "1"; // URL 파라미터 값
                final String kinds = '자동'; // 웹 서버로 보낼 정보
                final int barrier_value = _checked_barrier;
                // 정수를 문자열로 변환

                // 필요한 파라미터를 URL 파라미터와 JSON 데이터로 생성
                final Map<String, dynamic> data = {
                  "manual": manual,
                  "barrier_control": barrier_control, // 문자열로 변환
                  "kinds": kinds,
                  "barrier_value": barrier_value,
                };
                try {
                  // insertData 함수를 호출하고 네 개의 인수를 전달
                  final dynamic response = await networking.insertData(manual, barrier_control, kinds, barrier_value);
                  // 서버 응답에 따라 필요한 작업 수행
                  if (response is String) {
                    // 서버에서 문자열 형태로 응답한 경우
                    // 응답 데이터 사용 또는 처리
                    print("데이터 전송 성공: $response");
                  } else if (response is int) {
                    // 서버에서 정수 형태로 응답한 경우
                    // 응답 데이터 사용 또는 처리
                    print("데이터 전송 성공: $response");
                  } else {
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
