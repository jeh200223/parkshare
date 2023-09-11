import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkshare/Components/DatasBorder.dart';
import 'package:parkshare/constans.dart';
import 'package:parkshare/network.dart';

class Temperature extends StatefulWidget {
  const Temperature({Key? key}) : super(key: key);

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    getDatas();
    super.initState();
  }

  void getDatas() async {
    try {
      List<Map<String, dynamic>> dataList = await NetworkSendData().getAllData();
      setState(() {
        _dataList = dataList;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          border: Border.all(
              color: Colors.black, width: 1, style: BorderStyle.solid)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DatasBorder(
            title: '실내온도',
            textV: '${_dataList.isNotEmpty ? _dataList[0]['temp_value'] : 'N/A'}°C',
            icon: Icon(CupertinoIcons.thermometer,
                color: kprimarycolor, size: 50),
          ),
          DatasBorder(
            title: '실내습도',
            textV: '${_dataList.isNotEmpty ? _dataList[0]['humi_value'] : 'N/A'}%',
            icon: Icon(CupertinoIcons.drop,
                color: kprimarycolor, size: 50),
          ),
        ],
      ),
    );
  }
}
