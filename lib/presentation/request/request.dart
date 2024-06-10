import 'package:label/common/helper/screen_helper.dart';
import 'package:label/presentation/request/request_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RequesttoJoin extends StatelessWidget {
  RequesttoJoin({super.key});
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(RequestController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Request',
          style: TextStyle(color: Color(0xff3B4E5F)),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset('assets/TrackChart/arrow-back.svg')),
      ),
      body: GetX<RequestController>(builder: (_) {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: ScreenHelper().setheight(60),
                ),
                SvgPicture.asset('assets/LogIn/dangify-artists.svg'),
                SizedBox(
                  height: ScreenHelper().setheight(40),
                ),
                Container(
                  width: ScreenHelper().setWidth(320),
                  height: ScreenHelper().setheight(46),
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
                        'Name : ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(
                        child: FocusScope(
                          child: TextFormField(
                            focusNode: FocusNode(canRequestFocus: false),
                            onChanged: (value) {},
                            controller: controller.nameController,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your name',
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
                  width: ScreenHelper().setWidth(320),
                  height: ScreenHelper().setheight(46),
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
                        'Email : ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(
                        child: FocusScope(
                          child: TextFormField(
                            focusNode: FocusNode(canRequestFocus: false),
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your email',
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
                  width: ScreenHelper().setWidth(320),
                  height: ScreenHelper().setheight(46),
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
                        'Phone Number : ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(
                        child: FocusScope(
                          child: TextFormField(
                            focusNode: FocusNode(canRequestFocus: false),
                            keyboardType: TextInputType.phone,
                            controller: controller.phoneNumberController,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your phone number',
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
                  width: ScreenHelper().setWidth(320),
                  height: ScreenHelper().setheight(46),
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
                        'Social Network : ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(
                        child: FocusScope(
                          child: TextFormField(
                            focusNode: FocusNode(canRequestFocus: false),
                            controller: controller.socialController,
                            // minLines: 8,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  'Enter your social network address that you have professional page ',
                              isDense: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenHelper().setheight(15),
                ),
                SizedBox(
                  height: ScreenHelper().setheight(20),
                ),
                Container(
                  width: ScreenHelper().setWidth(320),
                  height: ScreenHelper().setheight(46),
                  child: ElevatedButton(
                    child: controller.isUploading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff3B4E5F).withOpacity(0.75),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenHelper().setRadius(10)),
                      ),
                    ),
                    onPressed: () {
                      if (controller.isValid()) {
                        controller.requestJoin(context);
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: ScreenHelper().setheight(40),
                ),
                Column(
                  children: [
                    Text(
                      'After authentication, user account information',
                      style:
                          TextStyle(color: Color(0xff3B4E5F).withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: ScreenHelper().setheight(5),
                    ),
                    Text('will be sent to your email and mobile number',
                        style: TextStyle(
                            color: Color(0xff3B4E5F).withOpacity(0.5)))
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
