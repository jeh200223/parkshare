class Model {
  final String id;
  final String car_value;
  final String barrier_value;
  final String temp_value;
  final String humi_value;
  final String uptime;

  Model({
    required this.id,
    required this.car_value,
    required this.barrier_value,
    required this.temp_value,
    required this.humi_value,
    required this.uptime,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'],
      car_value: json['car_value'],
      barrier_value: json['barrier_value'],
      temp_value: json['temp_value'],
      humi_value: json['humi_value'],
      uptime: json['uptime'],
    );
  }
}
