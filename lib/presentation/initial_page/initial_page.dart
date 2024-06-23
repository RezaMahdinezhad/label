import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:label/common/helper/screen_helper.dart';
import 'package:label/presentation/label_login/label_login.dart';
import 'package:label/presentation/login/login.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 59,
        automaticallyImplyLeading: false,
        // leading: Row(
        //   children: [
        //     SvgPicture.asset(
        //       'assets/LogIn/dangify-artists.svg',
        //       fit: BoxFit.cover,
        //     ),
        //   ],
        // ),
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/LogIn/dangify-artists.svg',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login to Dangify for Artists',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenHelper().setFont(28)),
              ),
              Text('First, tell us who you are.'),
              SizedBox(
                height: ScreenHelper().setheight(25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => ArtistLogInPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Artist or Manager'),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: ScreenHelper.deWidth / 8,
                              child: Image.asset(
                                'assets/LogIn/artist.png',
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenHelper.deWidth / 14,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => LabelLogInPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Label or Copyright holder'),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: ScreenHelper.deWidth / 8,
                              child: Image.asset(
                                'assets/LogIn/label.png',
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
