import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Model/model.dart';

class NetworkSendData {
  Future<List<Model>> getExampleData() async {
    try {
      final response = await http.get(Uri.parse('http://capstone.ctrls-studio.com/db.php'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List;
        return jsonData.map((json) => Model.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
