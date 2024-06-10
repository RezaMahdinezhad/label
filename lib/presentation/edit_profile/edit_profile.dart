import 'package:label/common/helper/screen_helper.dart';
import 'package:label/presentation/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  var controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Color(0xff3B4E5F)),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset('assets/TrackChart/arrow-back.svg')),
      ),
      body: GetBuilder<EditProfileController>(
        builder: (_) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(ScreenHelper().setRadius(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: TextStyle(color: Color(0xff3B4E5F)),
                  ),
                  SizedBox(
                    height: ScreenHelper().setheight(15),
                  ),
                  Column(
                    children: [
                      Container(
                        height: ScreenHelper().setheight(50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              ScreenHelper().setRadius(10),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              ' Name : ',
                              style: TextStyle(color: Colors.black),
                            ),
                            Expanded(
                              child: Text(
                                '${controller.profileController.userdataModel.name}',
                                style: TextStyle(color: Color(0xffFF0055)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenHelper().setheight(5),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              ScreenHelper().setRadius(10),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              ' Username : ',
                              style: TextStyle(color: Colors.black),
                            ),
                            Expanded(
                              child: FocusScope(
                                child: TextFormField(
                                  focusNode: FocusNode(canRequestFocus: false),
                                  onChanged: (value) {
                                    controller.editProfileModelSend.username =
                                        value;
                                  },
                                  controller: controller.userNameController,
                                  style: TextStyle(color: Color(0xff3B4E5F)),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenHelper().setheight(5),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              ScreenHelper().setRadius(10),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              ' Email : ',
                              style: TextStyle(color: Colors.black),
                            ),
                            Expanded(
                              child: FocusScope(
                                child: TextFormField(
                                  focusNode: FocusNode(canRequestFocus: false),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    controller.editProfileModelSend.email =
                                        value;
                                  },
                                  controller: controller.emailController,
                                  style: TextStyle(color: Color(0xff3B4E5F)),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenHelper().setheight(40),
                  ),
                  Text(
                    'Biography',
                    style: TextStyle(color: Color(0xff3B4E5F)),
                  ),
                  SizedBox(
                    height: ScreenHelper().setheight(15),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              ScreenHelper().setRadius(10),
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: ScreenHelper().setheight(10),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenHelper().setWidth(8),
                                  vertical: ScreenHelper().setheight(12)),
                              child: Text(
                                ' Bio : ',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: FocusScope(
                                child: TextFormField(
                                  focusNode: FocusNode(canRequestFocus: false),
                                  onChanged: (value) {
                                    controller.editProfileModelSend.bio = value;
                                  },
                                  maxLines: 8,
                                  style: TextStyle(color: Color(0xff3B4E5F)),
                                  controller: controller.bioController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your Biography',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenHelper().setheight(40),
                  ),
                  Text(
                    'Social Network',
                    style: TextStyle(color: Color(0xff3B4E5F)),
                  ),
                  SizedBox(
                    height: ScreenHelper().setheight(15),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              ScreenHelper().setRadius(10),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              ' Instagram : ',
                              style: TextStyle(color: Colors.black),
                            ),
                            Expanded(
                              child: FocusScope(
                                child: TextFormField(
                                  focusNode: FocusNode(canRequestFocus: false),
                                  onChanged: (value) {
                                    controller.editProfileModelSend
                                        .instagram_url = value;
                                  },
                                  style: TextStyle(color: Color(0xff3B4E5F)),
                                  controller: controller.instagramController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your instagram url',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenHelper().setheight(5),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              ScreenHelper().setRadius(10),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              ' YouTube : ',
                              style: TextStyle(color: Colors.black),
                            ),
                            Expanded(
                              child: FocusScope(
                                child: TextFormField(
                                  focusNode: FocusNode(canRequestFocus: false),
                                  onChanged: (value) {
                                    controller.editProfileModelSend
                                        .youtube_url = value;
                                  },
                                  style: TextStyle(color: Color(0xff3B4E5F)),
                                  controller: controller.youtubeController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your youtube url',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenHelper().setheight(5),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              ScreenHelper().setRadius(10),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              ' Facebook : ',
                              style: TextStyle(color: Colors.black),
                            ),
                            Expanded(
                              child: FocusScope(
                                child: TextFormField(
                                  focusNode: FocusNode(canRequestFocus: false),
                                  onChanged: (value) {
                                    controller.editProfileModelSend
                                        .facebook_url = value;
                                  },
                                  style: TextStyle(color: Color(0xff3B4E5F)),
                                  controller: controller.facebookController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your facebook url',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenHelper().setheight(40),
                  ),
                  Text(
                    'Page Color',
                    style: TextStyle(color: Color(0xff3B4E5F)),
                  ),
                  SizedBox(
                    height: ScreenHelper().setheight(15),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              ScreenHelper().setRadius(10),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              ' Color : ',
                              style: TextStyle(color: Colors.black),
                            ),
                            Spacer(),
                            Obx(
                              () => Text(
                                'Auto',
                                style: TextStyle(
                                  color: controller.isSwitched.value
                                      ? Color(0xff3B4E5F)
                                      : Color(0xffFF0055),
                                ),
                              ),
                            ),
                            Obx(
                              () => SizedBox(
                                child: Switch(
                                    activeColor: Color(0xffFF0055),
                                    value: controller.isSwitched.value,
                                    onChanged: controller.toggleSwitch),
                              ),
                            ),
                            Obx(
                              () => Text(
                                'Custom',
                                style: TextStyle(
                                  color: controller.isSwitched.value
                                      ? Color(0xffFF0055)
                                      : Color(0xff3B4E5F),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: ScreenHelper().setWidth(5),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenHelper().setheight(5),
                      ),
                      Obx(
                        () => SizedBox(
                          child: controller.isSwitched.value
                              ? Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            ScreenHelper().setRadius(10),
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            ' Color1 : ',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Container(
                                            width: ScreenHelper().setWidth(10),
                                            height:
                                                ScreenHelper().setheight(10),
                                            decoration: BoxDecoration(
                                              color: Color(int.parse(
                                                  '0xff${controller.usercolor1Controller.text}')),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenHelper().setWidth(5),
                                          ),
                                          Expanded(
                                            child: FocusScope(
                                              child: TextFormField(
                                                focusNode: FocusNode(
                                                    canRequestFocus: false),
                                                style: TextStyle(
                                                    color: Color(0xff3B4E5F)),
                                                controller: controller
                                                    .usercolor1Controller,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Enter or select your color',
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (controller
                                                  .isHexColor1Valid()) {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        content:
                                                            SingleChildScrollView(
                                                          child: ColorPicker(
                                                            onColorChanged:
                                                                (value) {
                                                              controller
                                                                      .usercolor1Controller
                                                                      .text =
                                                                  value
                                                                      .toString()
                                                                      .substring(
                                                                          10,
                                                                          16);
                                                            },
                                                            pickerColor: Color(
                                                                int.parse(
                                                                    '0xff${controller.usercolor1Controller.text}')),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              }
                                            },
                                            child: Container(
                                              width:
                                                  ScreenHelper().setWidth(36),
                                              height:
                                                  ScreenHelper().setheight(36),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Color(0xffF9F9F9)),
                                              child: Icon(
                                                Icons.color_lens,
                                                color: Color(0xffFF0055),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenHelper().setWidth(5),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: ScreenHelper().setheight(5),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            ScreenHelper().setRadius(10),
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            ' Color2 : ',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Container(
                                            width: ScreenHelper().setWidth(10),
                                            height:
                                                ScreenHelper().setheight(10),
                                            decoration: BoxDecoration(
                                              color: Color(int.parse(
                                                  '0xff${controller.usercolor2Controller.text}')),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenHelper().setWidth(5),
                                          ),
                                          Expanded(
                                            child: FocusScope(
                                              child: TextFormField(
                                                focusNode: FocusNode(
                                                    canRequestFocus: false),
                                                style: TextStyle(
                                                    color: Color(0xff3B4E5F)),
                                                controller: controller
                                                    .usercolor2Controller,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Enter or select your color',
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (controller
                                                  .isHexColor2Valid()) {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        content:
                                                            SingleChildScrollView(
                                                          child: ColorPicker(
                                                            onColorChanged:
                                                                (value) {
                                                              controller
                                                                      .usercolor2Controller
                                                                      .text =
                                                                  value
                                                                      .toString()
                                                                      .substring(
                                                                          10,
                                                                          16);
                                                            },
                                                            pickerColor: Color(
                                                                int.parse(
                                                                    '0xff${controller.usercolor2Controller.text}')),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              }
                                            },
                                            child: Container(
                                              width:
                                                  ScreenHelper().setWidth(36),
                                              height:
                                                  ScreenHelper().setheight(36),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Color(0xffF9F9F9)),
                                              child: Icon(
                                                Icons.color_lens,
                                                color: Color(0xffFF0055),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenHelper().setWidth(5),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: ScreenHelper().setheight(15),
                                    ),
                                    Text(
                                      'These are detected colors from your profile photo.',
                                      style:
                                          TextStyle(color: Color(0xff3B4E5F)),
                                    ),
                                    SizedBox(
                                      height: ScreenHelper().setheight(15),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: ScreenHelper().setWidth(15),
                                        ),
                                        Container(
                                          width: ScreenHelper().setWidth(80),
                                          height: ScreenHelper().setheight(80),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(ScreenHelper()
                                                    .setRadius(10))),
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                controller.color1.value,
                                                controller.color2.value
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: ScreenHelper().setWidth(15),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Color1:',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(10),
                                                ),
                                                Container(
                                                  width: ScreenHelper()
                                                      .setWidth(10),
                                                  height: ScreenHelper()
                                                      .setheight(10),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        controller.color1.value,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                100)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  '${controller.color1.value.toString().substring(10, 16)}',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height:
                                                  ScreenHelper().setheight(15),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Color2:',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(10),
                                                ),
                                                Container(
                                                  width: ScreenHelper()
                                                      .setWidth(10),
                                                  height: ScreenHelper()
                                                      .setheight(10),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        controller.color2.value,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                100)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  '${controller.color2.value.toString().substring(10, 16)}',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenHelper().setheight(15),
                  ),
                  SizedBox(
                    height: ScreenHelper().setheight(40),
                  ),
                  Container(
                    width: ScreenHelper.deWidth,
                    height: ScreenHelper().setheight(46),
                    child: ElevatedButton(
                      child: Obx(() {
                        if (controller.isEditingProfile.value == true) {
                          return Container(child: CircularProgressIndicator());
                        } else {
                          return Text('Save');
                        }
                      }),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFF0055),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              ScreenHelper().setRadius(10)),
                        ),
                      ),
                      onPressed: () async {
                        if (controller.isSwitched.value == false) {
                          controller.editProfileModelSend.color1 = controller
                              .color1.value
                              .toString()
                              .substring(10, 16);
                          controller.editProfileModelSend.color2 = controller
                              .color2.value
                              .toString()
                              .substring(10, 16);
                        } else {
                          controller.editProfileModelSend.color1 =
                              controller.usercolor1Controller.text;
                          controller.editProfileModelSend.color2 =
                              controller.usercolor2Controller.text;
                        }
                        if (controller.isValid() == true) {
                          controller.editProfile(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
