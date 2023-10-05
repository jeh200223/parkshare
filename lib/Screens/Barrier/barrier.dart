import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:parkshare/Components/marker_pointer.dart';
import 'package:parkshare/Screens/Barrier/screen_detail.dart';
import 'package:parkshare/constans.dart';
import 'package:parkshare/Screens/Barrier/Components/header.dart';

class Barrier extends StatefulWidget {
  const Barrier({Key? key}) : super(key: key);

  @override
  State<Barrier> createState() => _BarrierState();
}

class _BarrierState extends State<Barrier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const header(),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          color: secondcolor,
          child: SizedBox(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(37.733332, 127.212573),
                zoom: 7,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'http://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.ctrls.ipms.parkshare.parkshare',
                ),
                MarkerLayer(
                  markers: [
                    StationMarker(
                      stationLabel: '1호기',
                      x: 37.933332,
                      y: 127.512573,
                      context: context,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailScreen(),
                          ),
                        );
                      },
                    ),
                    StationMarker(
                      stationLabel: '2호기',
                      x: 36.569218,
                      y: 128.167877,
                      context: context,
                      markerOnOffState: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
