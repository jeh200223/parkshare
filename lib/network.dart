import 'dart:convert';
import 'package:dio/dio.dart';

class Networksenddata {
  Future<List<dynamic>> getExampleData() async {
    try {
      var response = await Dio().get('http://capstone.ctrls-studio.com/db.php');
      if (response.statusCode == 200) {
        return jsonDecode(response.data);
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}

class Insert {
  Future<void> insertData(
      String carValue, String barrierValue, String tempValue, String humiValue) async {
    try {
      var response = await Dio().post(
        'http://capstone.ctrls-studio.com/data.php',
        data: {
          'car_value': carValue,
          'barrier_value': barrierValue,
          'temp_value': tempValue,
          'humi_value': humiValue,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      print(response.data);
    } catch (e) {
      print('Error inserting data: $e');
    }
  }
}
