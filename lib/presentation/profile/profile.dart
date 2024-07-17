import 'package:label/common/helper/screen_helper.dart';
import 'package:label/domain/repository/remote/endpoint.dart';
import 'package:label/presentation/edit_profile/edit_profile.dart';
import 'package:label/presentation/edit_profile/edit_profile_controller.dart';
import 'package:label/presentation/login/login.dart';
import 'package:label/presentation/preview/preview.dart';
import 'package:label/presentation/preview/preview_controller.dart';
import 'package:label/presentation/profile/profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GetBuilder<ProfileController>(
              builder: (_) {
                return controller.globeController.loginType.value == 1
                    ? SafeArea(
                        child: RefreshIndicator(
                          onRefresh: controller.getProfileData,
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                                bottom: ScreenHelper().setheight(20)),
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    content:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              GestureDetector(
                                                                child: Icon(
                                                                    Icons
                                                                        .close),
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(); // Close the dialog
                                                                },
                                                              ),
                                                              Spacer(),
                                                              TextButton(
                                                                onPressed: () {
                                                                  controller
                                                                      .getProfileData();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                  'Save',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xffFF0055)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                ScreenHelper()
                                                                    .setheight(
                                                                        10),
                                                          ),
                                                          Text(
                                                            'Edit Cover',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff3B4E5F)),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                ScreenHelper()
                                                                    .setheight(
                                                                        10),
                                                          ),
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                ScreenHelper()
                                                                    .setRadius(
                                                                        10),
                                                              ),
                                                            ),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: EndPoint
                                                                      .base +
                                                                  controller
                                                                      .userdataModel
                                                                      .cover_url
                                                                      .toString(),
                                                              errorWidget:
                                                                  (context, url,
                                                                      error) {
                                                                return SvgPicture
                                                                    .asset(
                                                                        'assets/LogIn/dangify-artists.svg');
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                ScreenHelper()
                                                                    .setheight(
                                                                        30),
                                                          ),
                                                          Container(
                                                            height:
                                                                ScreenHelper()
                                                                    .setheight(
                                                                        50),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                      0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          10),
                                                                ),
                                                              ),
                                                            ),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                controller.getImage(
                                                                    context,
                                                                    ImageSource
                                                                        .camera,
                                                                    true);
                                                              },
                                                              child: Container(
                                                                color: Colors
                                                                    .transparent,
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: ScreenHelper()
                                                                          .setWidth(
                                                                              5),
                                                                    ),
                                                                    Text(
                                                                        'Take a Photo'),
                                                                    Spacer(),
                                                                    Icon(
                                                                      Icons
                                                                          .arrow_forward_ios,
                                                                      color: Color(
                                                                          0xff3B4E5F),
                                                                      size: ScreenHelper()
                                                                          .setRadius(
                                                                              15),
                                                                    ),
                                                                    SizedBox(
                                                                      width: ScreenHelper()
                                                                          .setWidth(
                                                                              5),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                ScreenHelper()
                                                                    .setheight(
                                                                        5),
                                                          ),
                                                          Container(
                                                            height:
                                                                ScreenHelper()
                                                                    .setheight(
                                                                        50),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                      0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          10),
                                                                ),
                                                              ),
                                                            ),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                controller.getImage(
                                                                    context,
                                                                    ImageSource
                                                                        .gallery,
                                                                    true);
                                                              },
                                                              child: Container(
                                                                color: Colors
                                                                    .transparent,
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: ScreenHelper()
                                                                          .setWidth(
                                                                              5),
                                                                    ),
                                                                    Text(
                                                                        'Upload from Photos'),
                                                                    Spacer(),
                                                                    Icon(
                                                                      Icons
                                                                          .arrow_forward_ios,
                                                                      color: Color(
                                                                          0xff3B4E5F),
                                                                      size: ScreenHelper()
                                                                          .setRadius(
                                                                              15),
                                                                    ),
                                                                    SizedBox(
                                                                      width: ScreenHelper()
                                                                          .setWidth(
                                                                              5),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                ScreenHelper()
                                                                    .setheight(
                                                                        5),
                                                          ),
                                                          Container(
                                                            height:
                                                                ScreenHelper()
                                                                    .setheight(
                                                                        50),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                      0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          10),
                                                                ),
                                                              ),
                                                            ),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                controller
                                                                    .deleteCoverImage();
                                                              },
                                                              child: Container(
                                                                color: Colors
                                                                    .transparent,
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: ScreenHelper()
                                                                          .setWidth(
                                                                              5),
                                                                    ),
                                                                    Text(
                                                                        ' Remove Photo'),
                                                                    Spacer(),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: CachedNetworkImage(
                                            width: ScreenHelper.deWidth,
                                            height:
                                                ScreenHelper().setheight(160),
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url, error) {
                                              return Column(
                                                children: [
                                                  SizedBox(
                                                    height: ScreenHelper()
                                                        .setheight(30),
                                                  ),
                                                  SvgPicture.asset(
                                                      'assets/LogIn/dangify-artists.svg'),
                                                  Text(
                                                      'Upload your Cover Photo'),
                                                ],
                                              );
                                            },
                                            imageUrl: EndPoint.base +
                                                controller
                                                    .userdataModel.cover_url
                                                    .toString(),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left:
                                                  ScreenHelper().setWidth(300)),
                                          child: TextButton(
                                              style: ButtonStyle(),
                                              onPressed: () {
                                                Navigator.of(
                                                  context,
                                                )
                                                    .push(
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        EditProfileScreen(),
                                                  ),
                                                )
                                                    .then((value) {
                                                  Get.delete<
                                                      EditProfileController>();
                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.edit,
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                  SizedBox(
                                                    width: ScreenHelper()
                                                        .setWidth(5),
                                                  ),
                                                  Text(
                                                    'Edit',
                                                    style: TextStyle(
                                                      color: Color(0xff3B4E5F),
                                                    ),
                                                  )
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: ScreenHelper().setWidth(15),
                                              top: ScreenHelper().setheight(
                                                  ScreenHelper.deWidth / 5)),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          content:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    GestureDetector(
                                                                      child: Icon(
                                                                          Icons
                                                                              .close),
                                                                      onTap:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop(); // Close the dialog
                                                                      },
                                                                    ),
                                                                    Spacer(),
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        controller
                                                                            .getProfileData();
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Save',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0xffFF0055)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: ScreenHelper()
                                                                      .setheight(
                                                                          10),
                                                                ),
                                                                Text(
                                                                  'Edit Profile',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff3B4E5F)),
                                                                ),
                                                                SizedBox(
                                                                  height: ScreenHelper()
                                                                      .setheight(
                                                                          10),
                                                                ),
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                      ScreenHelper()
                                                                          .setRadius(
                                                                              10),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    imageUrl: EndPoint
                                                                            .base +
                                                                        controller
                                                                            .userdataModel
                                                                            .picture_url
                                                                            .toString(),
                                                                    errorWidget:
                                                                        (context,
                                                                            url,
                                                                            error) {
                                                                      return SvgPicture
                                                                          .asset(
                                                                              'assets/LogIn/dangify-artists.svg');
                                                                    },
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: ScreenHelper()
                                                                      .setheight(
                                                                          30),
                                                                ),
                                                                Container(
                                                                  height: ScreenHelper()
                                                                      .setheight(
                                                                          50),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                            0xff5F6268)
                                                                        .withOpacity(
                                                                            0.04),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius
                                                                          .circular(
                                                                        ScreenHelper()
                                                                            .setRadius(10),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      controller.getImage(
                                                                          context,
                                                                          ImageSource
                                                                              .camera,
                                                                          false);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                ScreenHelper().setWidth(5),
                                                                          ),
                                                                          Text(
                                                                              'Take a Photo'),
                                                                          Spacer(),
                                                                          Icon(
                                                                            Icons.arrow_forward_ios,
                                                                            color:
                                                                                Color(0xff3B4E5F),
                                                                            size:
                                                                                ScreenHelper().setRadius(15),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                ScreenHelper().setWidth(5),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: ScreenHelper()
                                                                      .setheight(
                                                                          5),
                                                                ),
                                                                Container(
                                                                  height: ScreenHelper()
                                                                      .setheight(
                                                                          50),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                            0xff5F6268)
                                                                        .withOpacity(
                                                                            0.04),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius
                                                                          .circular(
                                                                        ScreenHelper()
                                                                            .setRadius(10),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      controller.getImage(
                                                                          context,
                                                                          ImageSource
                                                                              .gallery,
                                                                          false);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                ScreenHelper().setWidth(5),
                                                                          ),
                                                                          Text(
                                                                              'Upload from Photos'),
                                                                          Spacer(),
                                                                          Icon(
                                                                            Icons.arrow_forward_ios,
                                                                            color:
                                                                                Color(0xff3B4E5F),
                                                                            size:
                                                                                ScreenHelper().setRadius(15),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                ScreenHelper().setWidth(5),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                },
                                                child: CachedNetworkImage(
                                                  imageUrl: EndPoint.base +
                                                      controller.userdataModel
                                                          .picture_url
                                                          .toString(),
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      CircleAvatar(
                                                    radius: ScreenHelper()
                                                        .setRadius(80),
                                                    backgroundImage:
                                                        imageProvider,
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) {
                                                    return CircleAvatar(
                                                      radius: ScreenHelper()
                                                          .setRadius(80),
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: Center(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/Navigationbar/IconProfile.svg',
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  ScreenHelper()
                                                                      .setheight(
                                                                          5),
                                                            ),
                                                            Text(
                                                              'Upload your Profile photo',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                      0xff3B4E5F)),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width:
                                                    ScreenHelper().setWidth(5),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: ScreenHelper().setheight(10),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left:
                                                  ScreenHelper().setWidth(15)),
                                          child: Text(
                                            '${controller.name}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff3B4E5F)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: ScreenHelper().setheight(5),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left:
                                                  ScreenHelper().setWidth(15)),
                                          child: Text(
                                            '${controller.email}',
                                            style: TextStyle(
                                              color: Color(0xff3B4E5F),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenHelper().setheight(30),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: ScreenHelper().setWidth(15),
                                    ),
                                    Text(
                                      'Financial',
                                      style: TextStyle(
                                          color: Color(0xff3B4E5F),
                                          fontSize: ScreenHelper().setFont(14),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenHelper().setheight(10),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: ScreenHelper().setWidth(15),
                                        ),
                                        Text('Total Income'),
                                        SizedBox(
                                          width: ScreenHelper().setWidth(5),
                                        ),
                                        Text(controller.profileModel
                                                        .total_income !=
                                                    0.0 &&
                                                controller.profileModel
                                                        .total_income! <=
                                                    0.5
                                            ? '<1\$'
                                            : '${controller.profileModel.total_income}\$')
                                      ],
                                    ),
                                    SizedBox(
                                      height: ScreenHelper().setheight(8),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: ScreenHelper().setWidth(15),
                                        ),
                                        Text('Bank'),
                                        SizedBox(
                                          width: ScreenHelper().setWidth(5),
                                        ),
                                        Text(controller.profileModel.bank !=
                                                    0.0 &&
                                                controller.profileModel.bank! <=
                                                    0.5
                                            ? '<1\$'
                                            : '${controller.profileModel.bank}\$')
                                      ],
                                    ),
                                    SizedBox(
                                      height: ScreenHelper().setheight(8),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              ScreenHelper().setWidth(15)),
                                      child: LinearProgressIndicator(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                ScreenHelper().setRadius(8))),
                                        minHeight: ScreenHelper().setheight(35),
                                        value: controller.profileModel.bank /
                                            controller.profileModel
                                                .threshold, // Set the value between 0.0 and 1.0 based on the progress (50% in this example)
                                        backgroundColor: Colors
                                            .grey, // Set the background color of the progress bar
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(Colors
                                                .blueAccent), // Set the color of the filled portion
                                      ),
                                    ),
                                    SizedBox(
                                      height: ScreenHelper().setheight(8),
                                    ),
                                    Text('${controller.profileModel.message}'),
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenHelper().setheight(15),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: ScreenHelper().setWidth(15),
                                    ),
                                    Text(
                                      'Bio',
                                      style: TextStyle(
                                          color: Color(0xff3B4E5F),
                                          fontSize: ScreenHelper().setFont(14),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenHelper().setheight(10),
                                ),
                                controller.bio != ''
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              ScreenHelper().setRadius(10),
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              controller.bio,
                                              softWrap: true,
                                              maxLines: controller
                                                  .descriptionMaxLines,
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                color: Color(0xff3B4E5F),
                                              ),
                                            ),
                                            controller.bio.characters.length >=
                                                    1000
                                                ? SizedBox()
                                                : SizedBox(
                                                    width: ScreenHelper.deWidth,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        if (controller
                                                                .descriptionMaxLines ==
                                                            6) {
                                                          setState(() {
                                                            controller
                                                                    .descriptionMaxLines =
                                                                100;
                                                            controller
                                                                    .description =
                                                                'Show Less';
                                                          });
                                                        } else {
                                                          setState(() {
                                                            controller
                                                                .descriptionMaxLines = 6;
                                                            controller
                                                                    .description =
                                                                'Show More';
                                                          });
                                                        }
                                                      },
                                                      child: Text(
                                                        controller.description,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffFF0055)),
                                                      ),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      )
                                    : Text(
                                        'Add your biography in editing profile.',
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
                                    Text(
                                      'Social network',
                                      style: TextStyle(
                                          color: Color(0xff3B4E5F),
                                          fontSize: ScreenHelper().setFont(14),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenHelper().setheight(15),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: ScreenHelper().setWidth(15),
                                    ),
                                    SvgPicture.asset(
                                        'assets/Artist/instagram.svg'),
                                    SizedBox(
                                      width: ScreenHelper().setWidth(5),
                                    ),
                                    controller.instagram == ''
                                        ? Text(
                                            'Try to set your Instagram account in editing profile',
                                            style: TextStyle(
                                              color: Color(0xff3B4E5F),
                                            ),
                                          )
                                        : Text(
                                            '${controller.instagram}',
                                            style: TextStyle(
                                              color: Color(0xff3B4E5F),
                                            ),
                                          ),
                                    Spacer()
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenHelper().setheight(15),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: ScreenHelper().setWidth(15),
                                    ),
                                    SvgPicture.asset(
                                        'assets/Artist/youtube.svg'),
                                    SizedBox(
                                      width: ScreenHelper().setWidth(5),
                                    ),
                                    controller.youtube == ''
                                        ? Text(
                                            'Try to set your Youtube chanel in editing profile',
                                            style: TextStyle(
                                              color: Color(0xff3B4E5F),
                                            ),
                                          )
                                        : Text(
                                            '${controller.youtube.substring(0, 33)} ...',
                                            style: TextStyle(
                                              color: Color(0xff3B4E5F),
                                            ),
                                          ),
                                    Spacer()
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenHelper().setheight(15),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: ScreenHelper().setWidth(15),
                                    ),
                                    SvgPicture.asset(
                                        'assets/Artist/facebook.svg'),
                                    SizedBox(
                                      width: ScreenHelper().setWidth(5),
                                    ),
                                    controller.facebook == ''
                                        ? Text(
                                            'Try to set your Facebook account in editing profile',
                                            style: TextStyle(
                                              color: Color(0xff3B4E5F),
                                            ),
                                          )
                                        : Text(
                                            '${controller.facebook}',
                                            style: TextStyle(
                                              color: Color(0xff3B4E5F),
                                            ),
                                          ),
                                    Spacer()
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenHelper().setheight(30),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: ScreenHelper().setWidth(15),
                                    ),
                                    Text(
                                      'Page Color',
                                      style: TextStyle(
                                          color: Color(0xff3B4E5F),
                                          fontSize: ScreenHelper().setFont(14),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                  ],
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
                                            Radius.circular(
                                                ScreenHelper().setRadius(10))),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(int.parse(
                                                '0xff${controller.color1}')),
                                            Color(int.parse(
                                                '0xff${controller.color2}')),
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
                                              width:
                                                  ScreenHelper().setWidth(10),
                                            ),
                                            Container(
                                              width:
                                                  ScreenHelper().setWidth(10),
                                              height:
                                                  ScreenHelper().setheight(10),
                                              decoration: BoxDecoration(
                                                color: Color(int.parse(
                                                    '0xff${controller.color1}')),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100)),
                                              ),
                                            ),
                                            SizedBox(
                                              width: ScreenHelper().setWidth(5),
                                            ),
                                            Text(
                                              '${controller.color1}',
                                              style: TextStyle(
                                                color: Color(0xff3B4E5F),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: ScreenHelper().setheight(15),
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
                                              width:
                                                  ScreenHelper().setWidth(10),
                                            ),
                                            Container(
                                              width:
                                                  ScreenHelper().setWidth(10),
                                              height:
                                                  ScreenHelper().setheight(10),
                                              decoration: BoxDecoration(
                                                color: Color(int.parse(
                                                    '0xff${controller.color2}')),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100)),
                                              ),
                                            ),
                                            SizedBox(
                                              width: ScreenHelper().setWidth(5),
                                            ),
                                            Text(
                                              '${controller.color2}',
                                              style: TextStyle(
                                                color: Color(0xff3B4E5F),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Spacer()
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenHelper().setheight(40),
                                ),
                                Container(
                                  width: ScreenHelper().setWidth(320),
                                  height: ScreenHelper().setheight(46),
                                  child: ElevatedButton(
                                    child: Text('Preview On Dangify'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color(0xff3B4E5F).withOpacity(0.75),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            ScreenHelper().setRadius(10)),
                                      ),
                                    ),
                                    onPressed: () async {
                                      Navigator.of(
                                        context,
                                      )
                                          .push(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              PreviewPage(),
                                        ),
                                      )
                                          .then((value) {
                                        Get.delete<PreviewController>();
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenHelper().setheight(20),
                                ),
                                Container(
                                  width: ScreenHelper().setWidth(320),
                                  height: ScreenHelper().setheight(46),
                                  child: ElevatedButton(
                                    child: Text('Log Out'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xffFF0055),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            ScreenHelper().setRadius(10)),
                                      ),
                                    ),
                                    onPressed: () async {
                                      controller.globeController.logOut();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ArtistLogInPage(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : SafeArea(
                        child: SingleChildScrollView(
                        controller: controller.scrollController,
                        child: Column(
                          children: [
                            SizedBox(
                              width: ScreenHelper.deWidth,
                              height: ScreenHelper.dHeight,
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.profileTracks.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      height: ScreenHelper().setheight(80),
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              ScreenHelper().setheight(6)),
                                      decoration: BoxDecoration(
                                          color: Color(0xff3B4E5F)
                                              .withOpacity(0.04),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                ScreenHelper().setRadius(10)),
                                          )),
                                      child: Row(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: EndPoint.base +
                                                controller.profileTracks[index]
                                                    .picture_url
                                                    .toString(),
                                            errorWidget: (context, url, error) {
                                              return Image.asset(
                                                  'assets/logo.png');
                                            },
                                          ),
                                          SizedBox(
                                            width: ScreenHelper().setWidth(8),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller.profileTracks[index]
                                                    .artist_name
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: ScreenHelper()
                                                      .setFont(16),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Text(
                                            '${index + 1}',
                                            style: TextStyle(
                                              color: Color(0xffFF0055),
                                              fontSize:
                                                  ScreenHelper().setFont(20),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenHelper().setWidth(5),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ));
              },
            ),
    );
  }
}
