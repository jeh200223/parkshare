import 'package:flutter/material.dart';

class Customswitch extends StatefulWidget {
  final bool initialvalue;
  final Function(bool) onchanged;

  const Customswitch({required this.initialvalue, required this.onchanged});

  @override
  _CustomswitchState createState() => _CustomswitchState();
}

class _CustomswitchState extends State<Customswitch>{
  bool _isswitched = false;

  @override
  void initState() {
    super.initState();
    _isswitched = widget.initialvalue;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(value: _isswitched,
        onChanged: (value) {
        setState(() {
          _isswitched = value;
        });
        widget.onchanged(value);
        },
      activeTrackColor: Colors.greenAccent,
      activeColor: Colors.green,
    );
  }
}