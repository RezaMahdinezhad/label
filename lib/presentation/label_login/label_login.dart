import 'package:label/common/helper/screen_helper.dart';
import 'package:label/presentation/label_login/label_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LabelLogInPage extends StatelessWidget {
  LabelLogInPage({super.key});
  final LabelLoginController controller = Get.put(LabelLoginController());
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: GetX<LabelLoginController>(builder: (_) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(bottom: ScreenHelper().setheight(40)),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: ScreenHelper().setheight(130),
                ),
                SvgPicture.asset('assets/LogIn/dangify-artists.svg'),
                SizedBox(
                  height: ScreenHelper().setheight(40),
                ),
                Container(
                  height: ScreenHelper().setheight(46),
                  width: ScreenHelper().setWidth(320),
                  decoration: BoxDecoration(
                    color: Color(0xff5F6268).withOpacity(0.04),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        ScreenHelper().setRadius(10),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: ScreenHelper().setWidth(5),
                      ),
                      Text(
                        'Username : ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(
                        child: FocusScope(
                          child: TextFormField(
                            focusNode: FocusNode(canRequestFocus: false),
                            onChanged: (value) {
                              if (value.isEmail) {
                                controller.loginModelSend.email = value;
                                controller.loginModelSend.username = null;
                              } else {
                                controller.loginModelSend.username = value;
                                controller.loginModelSend.email = null;
                              }
                            },
                            controller: controller.usernameController,
                            textAlign: TextAlign.left,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter username or email';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              if (RegExp(
                                      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|'(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*')@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])")
                                  .hasMatch(value!)) {
                              } else {}
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your username or email',
                              isDense: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenHelper().setheight(20),
                ),
                Container(
                  height: ScreenHelper().setheight(46),
                  width: ScreenHelper().setWidth(320),
                  decoration: BoxDecoration(
                    color: Color(0xff5F6268).withOpacity(0.04),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        ScreenHelper().setRadius(10),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: ScreenHelper().setWidth(5),
                      ),
                      Text(
                        'Password : ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(
                        child: FocusScope(
                          child: TextFormField(
                            focusNode: FocusNode(canRequestFocus: false),
                            onChanged: (value) {
                              controller.loginModelSend.password = value;
                            },
                            controller: controller.passwordController,
                            textAlign: TextAlign.left,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              // _formData.password = value;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // labelText: 'Enter your password',
                              hintText: 'Enter your password',
                              isDense: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenHelper().setheight(40),
                ),
                SizedBox(
                  height: ScreenHelper().setheight(20),
                ),
                controller.isValid.value == false
                    ? CountdownTimer(
                        controller: controller.timerController,
                        widgetBuilder: (context, time) {
                          if (time == null) {
                            return SizedBox();
                          }
                          return controller.logInAttempts.value == 3
                              ? Text(
                                  'You can submit your request in 00:${time.sec}')
                              : controller.logInAttempts.value == 6
                                  ? Text(
                                      'You can submit your request in ${time.min == null ? 00 : time.min}:${time.sec}')
                                  : Text(
                                      'You can submit your request in ${time.hours == null ? 00 : time.hours}:${time.min == null ? 00 : time.min}:${time.sec}');
                        },
                      )
                    : Container(
                        width: ScreenHelper().setWidth(320),
                        height: ScreenHelper().setheight(46),
                        child: ElevatedButton(
                          child: controller.isLoading.value
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xff3B4E5F).withOpacity(0.75),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  ScreenHelper().setRadius(10)),
                            ),
                          ),
                          onPressed: () async {
                            await controller.login(context);
                          },
                        ),
                      ),
                SizedBox(
                  height: ScreenHelper().setheight(40),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
