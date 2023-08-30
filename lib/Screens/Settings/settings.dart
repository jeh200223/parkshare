import 'package:flutter/material.dart';
import 'package:parkshare/network.dart';

class Settings extends StatefulWidget {
  const Settings ({Key ? key}) : super (key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings>{

  NetworkSendData _networksenddata = NetworkSendData();
  List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      List<Map<String, dynamic>> dataList = await _networksenddata.getExampleData();
      setState(() {
        _dataList = dataList;
      });
    } catch (e) {
      print(e);
    }
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