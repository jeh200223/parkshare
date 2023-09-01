import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkSendData {
  Future<List<Map<String, dynamic>>> getExampleData() async {
    final response = await http.get(Uri.parse('http://capstone.dothome.co.kr/wemos_app.php?mode=select'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

