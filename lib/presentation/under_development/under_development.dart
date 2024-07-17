import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:label/common/helper/screen_helper.dart';
import 'package:label/presentation/initial_page/initial_page.dart';
import 'package:lottie/lottie.dart';

class UnderDevelopoment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          LottieBuilder.asset(
            width: ScreenHelper.deWidth / 2,
            height: ScreenHelper.deWidth / 8,
            'assets/Artist/under_development.json',
            fit: BoxFit.cover,
          ),
          Text('Under Development!'),
          Container(
            width: ScreenHelper().setWidth(320),
            height: ScreenHelper().setheight(46),
            child: ElevatedButton(
              child: Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFF0055),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(ScreenHelper().setRadius(10)),
                ),
              ),
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => InitialPage(),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
