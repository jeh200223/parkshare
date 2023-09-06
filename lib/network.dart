import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkSendData {
  Future<List<Map<String, dynamic>>> getExampleData() async {
    final response = await http.get(Uri.parse('http://capstone.dothome.co.kr/wemos_app.php?mode=select'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('데이터를 받아오지 못했습니다.');
    }
  }
}

class Insert {
  Future<dynamic> insertData(String manual, String barrier_control, String kinds, int barrier_value) async {
    String kind = kinds;
    int barrie_values = barrier_value;

    // URL 변경
    final Uri uri = Uri.parse(
        'http://capstone.dothome.co.kr/app_wemos.php?mode=insert&manual=${manual}&barrier_control=${barrier_control}');

    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: <String, dynamic>{
        "manual": kind,
        "barrier_control": barrie_values.toString(),
      },
    );

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(json.decode(response.body));
      return data;
    } else {
      throw Exception('데이터를 보내지 못했습니다.');
    }
  }


  Future<List<Map<String, dynamic>>> insertData_auto(String manual) async {
    String menu = manual;

    final Uri uri = Uri.parse('http://capstone.dothome.co.kr/app_wemos.php?mode=insert&manual=${manual}');
    print(uri);
    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: <String, dynamic>{
        "manual": menu,
      },
    );

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(json.decode(response.body));
      return data;
    } else {
      throw Exception('데이터를 보내지 못했습니다.');
    }
  }


  int toint(bool bool_value) {
    return bool_value? 1 : 0;
  }
}

