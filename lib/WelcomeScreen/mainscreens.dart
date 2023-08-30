import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkshare/Screens/Barrier/barrier.dart';
import 'package:parkshare/Screens/Settings/settings.dart';
import 'package:parkshare/constans.dart';
import 'package:parkshare/Screens/User/user.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen ({Key ? key}) : super (key: key);

  @override
  State<Mainscreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<Mainscreen> {
  int selecteindex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Size screensize = MediaQuery.of(context).size;
    final double screenwidth = screensize.width;
    final double screenheight = screensize.height;
    return Scaffold(
      body: IndexedStack(
        index: selecteindex,
        children: [
          User(),
          Settings(),
          Barrier(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: textcolor,
        currentIndex: selecteindex,
        backgroundColor: kprimarycolor,
        onTap: onTaped,
        items: [
          BottomNavigationBarItem(label: '유저', icon: Icon(CupertinoIcons.person, size: screenwidth < 900 ? 30.0 : 40.0)),
          BottomNavigationBarItem(label: '설정', icon: Icon(CupertinoIcons.gear, size: screenwidth < 900 ? 30.0 : 40.0)),
          BottomNavigationBarItem(label: '차수막', icon: Icon(CupertinoIcons.shield_lefthalf_fill, size: screenwidth < 900 ? 30.0 : 40.0)),
        ],
      ),
    );
  }
  void onTaped(int value) {
    setState(() {
      selecteindex = value;
    });
  }
}