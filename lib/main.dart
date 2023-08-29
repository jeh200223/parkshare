import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class Networksenddata {
  Future<List<Map<String, dynamic>>> getExampleData() async {
    try {
      var response = await Dio().get('http://capstone.ctrls-studio.com/db.php');
      if (response.statusCode == 200) {
        List<dynamic> rawData = jsonDecode(response.data);
        List<Map<String, dynamic>> dataList = List<Map<String, dynamic>>.from(rawData);
        return dataList;
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Networksenddata _networksenddata = Networksenddata();
  List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    List<Map<String, dynamic>> dataList = await _networksenddata.getExampleData();
    setState(() {
      _dataList = dataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Example Data:'),
            for (var data in _dataList)
              Column(
                children: [
                  Text('ID: ${data['id']}'),
                  Text('App Code: ${data['app_code']}'),
                  Text('Car Value: ${data['car_value']}'),
                  Text('Barrier Value: ${data['barrier_value']}'),
                  Text('Temp Value: ${data['temp_value']}'),
                  Text('Humi Value: ${data['humi_value']}'),
                  Text('Uptime: ${data['uptime']}'),
                  Divider(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
