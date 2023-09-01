class DataModel {
  final int id;
  final String appCode;
  final int carValue;
  final String barrierValue;
  final double tempValue;
  final double humiValue;
  final String uptime;

  DataModel({
    required this.id,
    required this.appCode,
    required this.carValue,
    required this.barrierValue,
    required this.tempValue,
    required this.humiValue,
    required this.uptime,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      appCode: json['app_code'],
      carValue: json['car_value'],
      barrierValue: json['barrier_value'],
      tempValue: json['temp_value'],
      humiValue: json['humi_value'],
      uptime: json['uptime'],
    );
  }
}
