class Barriermodel {
  final int id;
  final String manual;
  final int barriercontrol;
  final String uptime;

  Barriermodel({
    required this.id,
    required this.manual,
    required this.barriercontrol,
    required this.uptime,
  });

  factory Barriermodel.fromJson(Map<String, dynamic> json) {
    return Barriermodel(
      id: json['id'],
      manual: json['manual'],
      barriercontrol: json['barrier_control'],
      uptime: json['uptime'],
    );
  }
}
