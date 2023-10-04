import 'package:flutter/cupertino.dart';
import 'package:parkshare/constans.dart';

class header extends StatelessWidget {
  const header ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      width: double.infinity,
      color: secondcolor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: screenWidth < 900 ? 20: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('수해방지플랫폼',
                    style: screenWidth < 900 ? kheadertitlemobile : kheadertitletablet
                ),
                Text('환영합니다', style: TextStyle(color: kprimarycolor, fontSize: 20),)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: screenWidth < 900 ? 20 : 40),
            child: Row(
              children: [
                Container(
                  child: Image.asset('images/kyngbook.png', height: screenWidth < 900 ? 50 : 100),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}