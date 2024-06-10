import 'package:label/common/helper/screen_helper.dart';
import 'package:label/presentation/upload/review/review_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewController());
    return GetX<ReviewController>(builder: (_) {
      return !controller.isLoading.value
          ? Column(
              children: [
                SizedBox(
                  height: ScreenHelper().setheight(40),
                ),
                // Container(
                //   width: ScreenHelper.deWidth,
                //   decoration:
                //       BoxDecoration(color: Color(0xff5F6268).withOpacity(0.04)),
                //   child: IconButton(
                //     onPressed: () {
                //       controller.getTracks();
                //     },
                //     icon: Icon(Icons.refresh),
                //   ),
                // ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.reviewTrack.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(ScreenHelper().setRadius(5)),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Spacer(),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  icon: Icon(Icons.close)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(
                                                        ScreenHelper()
                                                            .setRadius(10),
                                                      ),
                                                    ),
                                                    child: CachedNetworkImage(
                                                        errorWidget: (context,
                                                            url, error) {
                                                          return SvgPicture.asset(
                                                              'assets/LogIn/dangify-artists.svg');
                                                        },
                                                        fit: BoxFit.cover,
                                                        height: ScreenHelper()
                                                            .setRadius(80),
                                                        width: ScreenHelper()
                                                            .setRadius(80),
                                                        imageUrl:
                                                            '${controller.reviewTrack[index].picture_url!}'),
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: ScreenHelper()
                                                            .setWidth(80),
                                                      ),
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                ScreenHelper()
                                                                    .setheight(
                                                                        80),
                                                          ),
                                                          controller
                                                                      .reviewTrack[
                                                                          index]
                                                                      .status ==
                                                                  0
                                                              ? Icon(
                                                                  Icons
                                                                      .auto_mode,
                                                                  size: ScreenHelper()
                                                                      .setRadius(
                                                                          28),
                                                                  color: Color(
                                                                      0xff3B4E5F),
                                                                )
                                                              : controller
                                                                          .reviewTrack[
                                                                              index]
                                                                          .status ==
                                                                      1
                                                                  ? Icon(
                                                                      Icons
                                                                          .add_task,
                                                                      size: ScreenHelper()
                                                                          .setRadius(
                                                                              28),
                                                                      color: Color(
                                                                          0xff3B4E5F),
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .block,
                                                                      size: ScreenHelper()
                                                                          .setRadius(
                                                                              28),
                                                                      color: Color(
                                                                          0xff3B4E5F),
                                                                    ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: ScreenHelper()
                                                        .setheight(10),
                                                  ),
                                                  Text(
                                                    controller
                                                        .reviewTrack[index]
                                                        .track_name
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff3B4E5F),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: ScreenHelper()
                                                        .setheight(5),
                                                  ),
                                                  controller.reviewTrack[index]
                                                              .is_album ==
                                                          1
                                                      ? Text(
                                                          controller
                                                              .reviewTrack[
                                                                  index]
                                                              .album_name
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff3B4E5F)),
                                                        )
                                                      : Text(
                                                          'Single Track',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff3B4E5F)),
                                                        ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: ScreenHelper().setWidth(20),
                                          ),
                                          Container(
                                            width: ScreenHelper.deWidth,
                                            // height: ScreenHelper().setheight(
                                            //     controller.reviewTrack[index]
                                            //                 .detailes
                                            //                 .toString()
                                            //                 .characters
                                            //                 .length >=
                                            //             20
                                            //         ? 80
                                            //         : 40),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        ScreenHelper()
                                                            .setRadius(4))),
                                                color: controller
                                                            .reviewTrack[index]
                                                            .status ==
                                                        0
                                                    ? Color(0xff5F6268)
                                                        .withOpacity(0.04)
                                                    : controller
                                                                .reviewTrack[
                                                                    index]
                                                                .status ==
                                                            1
                                                        ? Colors.green
                                                            .withOpacity(0.4)
                                                        : Colors.red
                                                            .withOpacity(0.8)),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                bottom: ScreenHelper()
                                                    .setheight(15),
                                                top: ScreenHelper()
                                                    .setheight(15),
                                                left:
                                                    ScreenHelper().setWidth(5),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Status: ${controller.reviewTrack[index].detailes}',
                                                    style: TextStyle(
                                                      color: Color(0xff3B4E5F),
                                                    ),
                                                    maxLines: 5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenHelper().setWidth(5),
                                          ),
                                          Container(
                                            width: ScreenHelper.deWidth,
                                            height:
                                                ScreenHelper().setheight(50),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        ScreenHelper()
                                                            .setRadius(4))),
                                                color: Color(0xff5F6268)
                                                    .withOpacity(0.04)),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  'Genre:',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  controller.reviewTrack[index]
                                                      .genre_name
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenHelper().setWidth(5),
                                          ),
                                          Container(
                                            width: ScreenHelper.deWidth,
                                            height:
                                                ScreenHelper().setheight(50),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        ScreenHelper()
                                                            .setRadius(4))),
                                                color: Color(0xff5F6268)
                                                    .withOpacity(0.04)),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  'Tag:',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  controller.reviewTrack[index]
                                                      .track_tag
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenHelper().setWidth(5),
                                          ),
                                          Container(
                                            width: ScreenHelper.deWidth,
                                            height:
                                                ScreenHelper().setheight(50),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        ScreenHelper()
                                                            .setRadius(4))),
                                                color: Color(0xff5F6268)
                                                    .withOpacity(0.04)),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  'Lyric:',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  controller.reviewTrack[index]
                                                              .lyrics !=
                                                          null
                                                      ? controller
                                                          .reviewTrack[index]
                                                          .lyrics
                                                          .toString()
                                                          .substring(
                                                              0,
                                                              controller
                                                                          .reviewTrack[
                                                                              index]
                                                                          .lyrics
                                                                          .toString()
                                                                          .characters
                                                                          .length >
                                                                      10
                                                                  ? 10
                                                                  : controller
                                                                      .reviewTrack[
                                                                          index]
                                                                      .lyrics
                                                                      .toString()
                                                                      .characters
                                                                      .length)
                                                      : '',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenHelper().setWidth(5),
                                          ),
                                          Container(
                                            width: ScreenHelper.deWidth,
                                            height:
                                                ScreenHelper().setheight(50),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        ScreenHelper()
                                                            .setRadius(4))),
                                                color: Color(0xff5F6268)
                                                    .withOpacity(0.04)),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  'Lyrics by:',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  controller.reviewTrack[index]
                                                              .lyrics_by !=
                                                          null
                                                      ? controller
                                                          .reviewTrack[index]
                                                          .lyrics_by
                                                          .toString()
                                                      : '',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenHelper().setWidth(5),
                                          ),
                                          Container(
                                            width: ScreenHelper.deWidth,
                                            height:
                                                ScreenHelper().setheight(50),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        ScreenHelper()
                                                            .setRadius(4))),
                                                color: Color(0xff5F6268)
                                                    .withOpacity(0.04)),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  'Melody by:',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  controller.reviewTrack[index]
                                                              .melody !=
                                                          null
                                                      ? controller
                                                          .reviewTrack[index]
                                                          .melody
                                                          .toString()
                                                      : '',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenHelper().setWidth(5),
                                          ),
                                          Container(
                                            width: ScreenHelper.deWidth,
                                            height:
                                                ScreenHelper().setheight(50),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        ScreenHelper()
                                                            .setRadius(4))),
                                                color: Color(0xff5F6268)
                                                    .withOpacity(0.04)),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  'Composer:',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  controller.reviewTrack[index]
                                                              .composer !=
                                                          null
                                                      ? controller
                                                          .reviewTrack[index]
                                                          .composer
                                                          .toString()
                                                      : '',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenHelper().setWidth(5),
                                          ),
                                          Container(
                                            width: ScreenHelper.deWidth,
                                            height:
                                                ScreenHelper().setheight(50),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        ScreenHelper()
                                                            .setRadius(4))),
                                                color: Color(0xff5F6268)
                                                    .withOpacity(0.04)),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  'Produced by:',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  controller.reviewTrack[index]
                                                              .produced_by !=
                                                          null
                                                      ? controller
                                                          .reviewTrack[index]
                                                          .produced_by
                                                          .toString()
                                                      : '',
                                                  style: TextStyle(
                                                    color: Color(0xff3B4E5F),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenHelper().setWidth(5),
                                          ),
                                          controller.reviewTrack[index]
                                                      .sec_artists_name !=
                                                  null
                                              ? Container(
                                                  width: ScreenHelper.deWidth,
                                                  height: ScreenHelper()
                                                      .setheight(50),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .all(Radius.circular(
                                                              ScreenHelper()
                                                                  .setRadius(
                                                                      4))),
                                                      color: Color(0xff5F6268)
                                                          .withOpacity(0.04)),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: ScreenHelper()
                                                            .setWidth(5),
                                                      ),
                                                      Text(
                                                        'Fetured Artists:',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff3B4E5F),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: ScreenHelper()
                                                            .setWidth(5),
                                                      ),
                                                      Text(
                                                        controller
                                                            .reviewTrack[index]
                                                            .sec_artists_name
                                                            .toString()
                                                            .substring(
                                                                0,
                                                                controller
                                                                            .reviewTrack[
                                                                                index]
                                                                            .sec_artists_name
                                                                            .toString()
                                                                            .characters
                                                                            .length >
                                                                        10
                                                                    ? 10
                                                                    : controller
                                                                        .reviewTrack[
                                                                            index]
                                                                        .sec_artists_name
                                                                        .toString()
                                                                        .characters
                                                                        .length),
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff3B4E5F),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: ScreenHelper().setWidth(5),
                                          ),
                                          controller.reviewTrack[index]
                                                          .spotify ==
                                                      0 &&
                                                  controller.reviewTrack[index]
                                                          .youtube_muisc ==
                                                      0 &&
                                                  controller.reviewTrack[index]
                                                          .apple_music ==
                                                      0 &&
                                                  controller.reviewTrack[index]
                                                          .amazon_music ==
                                                      0 &&
                                                  controller.reviewTrack[index]
                                                          .instagram ==
                                                      0 &&
                                                  controller.reviewTrack[index]
                                                          .facebook ==
                                                      0
                                              ? SizedBox()
                                              : Container(
                                                  width: ScreenHelper.deWidth,
                                                  height: ScreenHelper()
                                                      .setheight(50),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .all(Radius.circular(
                                                              ScreenHelper()
                                                                  .setRadius(
                                                                      4))),
                                                      color: Color(0xff5F6268)
                                                          .withOpacity(0.04)),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Publish requests',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff3B4E5F),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: ScreenHelper()
                                                            .setWidth(10),
                                                      ),
                                                      SvgPicture.asset(
                                                        'assets/Preview/arrow-down.svg',
                                                        color:
                                                            Color(0xff3B4E5F),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                          controller.reviewTrack[index]
                                                      .spotify ==
                                                  1
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setWidth(5),
                                                    ),
                                                    Container(
                                                      width:
                                                          ScreenHelper.deWidth,
                                                      height: ScreenHelper()
                                                          .setheight(50),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .all(Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          4))),
                                                          color:
                                                              Color(0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04)),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width:
                                                                ScreenHelper()
                                                                    .setWidth(
                                                                        5),
                                                          ),
                                                          Text(
                                                            'Spotify',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff3B4E5F),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          SvgPicture.asset(
                                                            'assets/ReviewTracks/tick-circle.svg',
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                ScreenHelper()
                                                                    .setWidth(
                                                                        5),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                          controller.reviewTrack[index]
                                                      .apple_music ==
                                                  1
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setWidth(5),
                                                    ),
                                                    Container(
                                                      width:
                                                          ScreenHelper.deWidth,
                                                      height: ScreenHelper()
                                                          .setheight(50),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .all(Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          4))),
                                                          color:
                                                              Color(0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04)),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width:
                                                                ScreenHelper()
                                                                    .setWidth(
                                                                        5),
                                                          ),
                                                          Text(
                                                            'Apple Music',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff3B4E5F),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          SvgPicture.asset(
                                                            'assets/ReviewTracks/tick-circle.svg',
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                ScreenHelper()
                                                                    .setWidth(
                                                                        5),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                          controller.reviewTrack[index]
                                                      .youtube_muisc ==
                                                  1
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setWidth(5),
                                                    ),
                                                    Container(
                                                      width:
                                                          ScreenHelper.deWidth,
                                                      height: ScreenHelper()
                                                          .setheight(50),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .all(Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          4))),
                                                          color:
                                                              Color(0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04)),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width:
                                                                ScreenHelper()
                                                                    .setWidth(
                                                                        5),
                                                          ),
                                                          Text(
                                                            'Youtube Music',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff3B4E5F),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          SvgPicture.asset(
                                                            'assets/ReviewTracks/tick-circle.svg',
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                ScreenHelper()
                                                                    .setWidth(
                                                                        5),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                          controller.reviewTrack[index]
                                                      .amazon_music ==
                                                  1
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setWidth(5),
                                                    ),
                                                    Container(
                                                      width:
                                                          ScreenHelper.deWidth,
                                                      height: ScreenHelper()
                                                          .setheight(50),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .all(Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          4))),
                                                          color:
                                                              Color(0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04)),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width:
                                                                ScreenHelper()
                                                                    .setWidth(
                                                                        5),
                                                          ),
                                                          Text(
                                                            'Amazon Music',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff3B4E5F),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          SvgPicture.asset(
                                                            'assets/ReviewTracks/tick-circle.svg',
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                ScreenHelper()
                                                                    .setWidth(
                                                                        5),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                          controller.reviewTrack[index]
                                                      .instagram ==
                                                  1
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setWidth(5),
                                                    ),
                                                    Container(
                                                      width:
                                                          ScreenHelper.deWidth,
                                                      height: ScreenHelper()
                                                          .setheight(50),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .all(Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          4))),
                                                          color:
                                                              Color(0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04)),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width:
                                                                ScreenHelper()
                                                                    .setWidth(
                                                                        5),
                                                          ),
                                                          Text(
                                                            'Instagram Music Library',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff3B4E5F),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          SvgPicture.asset(
                                                            'assets/ReviewTracks/tick-circle.svg',
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                ScreenHelper()
                                                                    .setWidth(
                                                                        5),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                          controller.reviewTrack[index]
                                                      .facebook ==
                                                  1
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setWidth(5),
                                                    ),
                                                    Container(
                                                      width:
                                                          ScreenHelper.deWidth,
                                                      height: ScreenHelper()
                                                          .setheight(50),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .all(Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          4))),
                                                          color:
                                                              Color(0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04)),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width:
                                                                ScreenHelper()
                                                                    .setWidth(
                                                                        5),
                                                          ),
                                                          Text(
                                                            'Facebook Music Library',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff3B4E5F),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          SvgPicture.asset(
                                                            'assets/ReviewTracks/tick-circle.svg',
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                ScreenHelper()
                                                                    .setWidth(
                                                                        5),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: ScreenHelper().setheight(100),
                            decoration: BoxDecoration(
                                color: controller.reviewTrack[index].status == 0
                                    ? Color(0xff5F6268).withOpacity(0.04)
                                    : controller.reviewTrack[index].status == 1
                                        ? Colors.green.withOpacity(0.4)
                                        : Colors.red.withOpacity(0.8),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    ScreenHelper().setRadius(10)))),
                            child: Padding(
                              padding:
                                  EdgeInsets.all(ScreenHelper().setRadius(5)),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        ScreenHelper().setRadius(10),
                                      ),
                                    ),
                                    child: CachedNetworkImage(
                                        errorWidget: (context, url, error) {
                                          return SvgPicture.asset(
                                              'assets/LogIn/dangify-artists.svg');
                                        },
                                        fit: BoxFit.cover,
                                        height: ScreenHelper().setRadius(90),
                                        width: ScreenHelper().setRadius(90),
                                        imageUrl:
                                            '${controller.reviewTrack[index].picture_url!}'),
                                  ),
                                  SizedBox(
                                    width: ScreenHelper().setWidth(10),
                                  ),
                                  SizedBox(
                                    width: ScreenHelper().setWidth(180),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: ScreenHelper().setheight(10),
                                        ),
                                        Text(
                                          controller
                                              .reviewTrack[index].track_name
                                              .toString(),
                                          style: TextStyle(
                                              color: Color(0xff3B4E5F),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: ScreenHelper().setheight(5),
                                        ),
                                        controller.reviewTrack[index]
                                                    .is_album ==
                                                1
                                            ? Text(
                                                controller.reviewTrack[index]
                                                    .album_name
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Color(0xff3B4E5F)),
                                              )
                                            : Text(
                                                'Single Track',
                                                style: TextStyle(
                                                    color: Color(0xff3B4E5F)),
                                              ),
                                        SizedBox(
                                          height: ScreenHelper().setheight(5),
                                        ),
                                        Text(
                                          maxLines: 4,
                                          '${controller.reviewTrack[index].artist_name}${controller.reviewTrack[index].sec_artists_name != null ? '(Ft.${controller.reviewTrack[index].sec_artists_name})' : ''}',
                                          style: TextStyle(
                                            fontSize:
                                                ScreenHelper().setFont(12),
                                            color: Color(0xff3B4E5F),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  controller.reviewTrack[index].status == 0
                                      ? Icon(
                                          Icons.auto_mode,
                                          size: ScreenHelper().setRadius(28),
                                          color: Color(0xff3B4E5F),
                                        )
                                      : controller.reviewTrack[index].status ==
                                              1
                                          ? Icon(
                                              Icons.add_task,
                                              size:
                                                  ScreenHelper().setRadius(28),
                                              color: Color(0xff3B4E5F),
                                            )
                                          : Icon(
                                              Icons.block,
                                              size:
                                                  ScreenHelper().setRadius(28),
                                              color: Color(0xff3B4E5F),
                                            ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            )
          : Padding(
              padding: EdgeInsets.all(ScreenHelper().setRadius(50)),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
    });
  }
}
