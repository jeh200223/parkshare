import 'package:flutter/cupertino.dart';

import '../network.dart';

class Barrierget extends StatefulWidget {
  const Barrierget ({Key ? key}) : super (key: key);

  @override
  State<Barrierget> createState() => _BarrierState();
}

class _BarrierState extends State<Barrierget>{
  List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    getDatas();
    super.initState();
  }

  void getDatas() async {
    try {
      List<Map<String, dynamic>> dataList = await NetworkSendData().getBarrierData();
      setState(() {
        _dataList = dataList;
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context ) {
    return Container();
  }
}