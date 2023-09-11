class DataModel {
  final int id;
  final String appCode;
  final double carValue;
  final String barrierValue;
  final double tempValue;
  final double humiValue;
  final String uptime;
  final String manual;
  final int barriercontrol;

  DataModel({
    required this.id,
    required this.appCode,
    required this.carValue,
    required this.barrierValue,
    required this.tempValue,
    required this.humiValue,
    required this.uptime,
    required this.manual,
    required this.barriercontrol,
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
      manual: json['manual'],
      barriercontrol: json['barrier_control'],
    );
  }
}
