import 'model.dart';
import 'package:parkshare/network.dart';

class DataManager {
  NetworkSendData _networksenddata = NetworkSendData();

  Future<List<Model>> getExampleData() async {
    try {
      List<Map<String, dynamic>> rawDataList = await _networksenddata.getExampleData();
      List<Model> dataList = rawDataList.map((json) => Model.fromJson(json)).toList();
      return dataList;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
