import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UnderDevelopoment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            LottieBuilder.asset('assets/Artist/under_development.json')
          ],
        ),
      )),
    );
  }
}
