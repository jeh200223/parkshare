import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkSendData {
  Future<List<Map<String, dynamic>>> getAllData() async {
    final response = await http.get(Uri.parse('http://capstone.dothome.co.kr/wemos_app.php?mode=select'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('데이터를 받아오지 못했습니다.');
    }
  }

  Future<List<Map<String, dynamic>>> getBarrierData() async {
    final response = await http.get(Uri.parse('http://capstone.dothome.co.kr/app_wemos.php?mode=select'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('데이터를 받아오지 못했습니다.');
    }
  }
}

class Insert {
  Future<dynamic> insertData(String manual, String barrier_control) async {
    // URL 변경
    final Uri uri = Uri.parse(
        'http://capstone.dothome.co.kr/app_wemos.php?mode=insert&manual=${manual}&barrier_control=${barrier_control}');

    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: <String, dynamic>{
        "manual": manual,
        "barrier_control": barrier_control,
      },
    );

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
          json.decode(response.body));
      return data;
    } else {
      throw Exception('데이터를 보내지 못했습니다.');
    }
  }


  Future<List<Map<String, dynamic>>> insertData_auto(String manual, String barrier_control) async {
    String menu = manual;

    final Uri uri = Uri.parse(
        'http://capstone.dothome.co.kr/app_wemos.php?mode=insert&manual=${manual}&barrier_control=${barrier_control}');
    print(uri);
    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: <String, dynamic>{
        "manual": menu,
        "barrier_control": barrier_control,
      },
    );

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
          json.decode(response.body));
      return data;
    } else {
      throw Exception('데이터를 보내지 못했습니다.');
    }
  }
}

