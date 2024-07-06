import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:label/common/helper/screen_helper.dart';
import 'package:label/domain/repository/remote/endpoint.dart';
import 'package:label/presentation/artist_screen/artist_controller.dart';
import 'package:label/presentation/trackchart/track_chart_controller.dart';
import 'package:label/presentation/trackchart/track_chart_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ArtistScreen extends StatelessWidget {
  final controller = Get.put(ArtistDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/LogIn/dangify-artists.svg',
          height: ScreenHelper().setheight(50),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: GetBuilder<ArtistDataController>(
        builder: (_) {
          controller.getMessage(context);
          return controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : NotificationListener<ScrollNotification>(
                  onNotification: (scrollInfo) {
                    if (!controller.isLoadingMore.value &&
                        scrollInfo.metrics.pixels >=
                            scrollInfo.metrics.maxScrollExtent) {
                      controller.isLoadingMore.value = true;
                      controller.loadMoreTracks().then((_) {
                        controller.isLoadingMore.value = false;
                      });
                    }
                    return true;
                  },
                  child: controller.globeController.loginType.value == 1
                      ? RefreshIndicator(
                          onRefresh: controller.fetchArtistDataOnrefresh,
                          child: SafeArea(
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Home/circle.svg',
                                          width: ScreenHelper.dHeight,
                                          height: ScreenHelper().setheight(150),
                                        ),
                                        SvgPicture.asset(
                                          'assets/Home/vector.svg',
                                          width: ScreenHelper.dHeight,
                                          height: ScreenHelper().setheight(200),
                                        ),
                                        // CachedNetworkImage(
                                        //     imageUrl: EndPoint.base +
                                        //         controller.artistData.pictureUrl.toString()),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width:
                                                  ScreenHelper().setWidth(25),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${controller.formatNumber(controller.artistData.totla_listener!)}',
                                                  style: TextStyle(
                                                      fontSize: ScreenHelper()
                                                          .setFont(28),
                                                      color: Color(0xffFF0055),
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  'People listened to',
                                                  style: TextStyle(
                                                      fontSize: ScreenHelper()
                                                          .setFont(28),
                                                      color: Color(0xffFF0055),
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  'your songs',
                                                  style: TextStyle(
                                                      fontSize: ScreenHelper()
                                                          .setFont(28),
                                                      color: Color(0xffFF0055),
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                SizedBox(
                                                  height: ScreenHelper()
                                                      .setheight(15),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              children: [
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    LoadingAnimationWidget.beat(
                                                        size: ScreenHelper()
                                                            .setRadius(35),
                                                        color: Color(0xffFF0055)
                                                            .withOpacity(0.5)),
                                                    Text(
                                                      '${controller.formatNumber(controller.artistData.live_listen!)}',
                                                      style: TextStyle(
                                                          fontSize:
                                                              ScreenHelper()
                                                                  .setFont(18),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: ScreenHelper()
                                                      .setheight(5),
                                                ),
                                                Text(
                                                  'Streams',
                                                  style: TextStyle(
                                                      fontSize: ScreenHelper()
                                                          .setFont(14),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width:
                                                  ScreenHelper().setWidth(25),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: ScreenHelper().setheight(20),
                                    ),
                                    SizedBox(
                                      // width: ScreenHelper.deWidth,
                                      height: ScreenHelper().setheight(60),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            7, // Adjust the itemCount as per your requirement
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: ScreenHelper()
                                                    .setWidth(12)),
                                            child: Column(
                                              children: [
                                                Text(
                                                  index == 0
                                                      ? '${controller.formatNumber(controller.artistData.rank!)}'
                                                      : index == 1
                                                          ? '${controller.formatNumber(controller.artistData.followers!)}'
                                                          : index == 2
                                                              ? '${controller.formatNumber(controller.artistData.likes!)}'
                                                              : index == 3
                                                                  ? '${controller.formatNumber(controller.artistData.monthly_listener!)}'
                                                                  : index == 4
                                                                      ? '${controller.formatNumber(controller.artistData.total_play!)}'
                                                                      : index ==
                                                                              5
                                                                          ? controller.artistData.total_income != 0.0 && controller.artistData.total_income <= 0.5
                                                                              ? '<1\$'
                                                                              : '${controller.artistData.total_income.toStringAsFixed(2)}\$'
                                                                          : controller.artistData.bank != 0.0 && controller.artistData.bank <= 0.5
                                                                              ? '<1\$'
                                                                              : '${controller.artistData.bank.toStringAsFixed(2)}\$',
                                                  style: TextStyle(
                                                      fontSize: ScreenHelper()
                                                          .setFont(18),
                                                      color: Color(0xff3B4E5F)),
                                                ),
                                                SizedBox(
                                                  height: ScreenHelper()
                                                      .setheight(5),
                                                ),
                                                Text(
                                                  index == 0
                                                      ? 'Rank'
                                                      : index == 1
                                                          ? 'Followers'
                                                          : index == 2
                                                              ? 'Like'
                                                              : index == 3
                                                                  ? 'Monthly Listeners'
                                                                  : index == 4
                                                                      ? 'Total Play'
                                                                      : index ==
                                                                              5
                                                                          ? 'Income'
                                                                          : 'Bank',
                                                  style: TextStyle(
                                                      fontSize: ScreenHelper()
                                                          .setFont(14),
                                                      color: Color(0xff3B4E5F)
                                                          .withOpacity(0.5)),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: ScreenHelper().setheight(6),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: ScreenHelper().setWidth(20),
                                        ),
                                        Text(
                                          'Top Songs',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  ScreenHelper().setFont(16)),
                                        ),
                                        Spacer(),
                                        SizedBox(
                                          width: ScreenHelper().setWidth(20),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: ScreenHelper().setheight(12),
                                    ),
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: controller
                                              .artistTracks.length +
                                          (controller.hasMoreTracks ? 1 : 0),
                                      padding: EdgeInsets.only(
                                        right: ScreenHelper().setWidth(8),
                                        left: ScreenHelper().setWidth(8),
                                        bottom: ScreenHelper().setWidth(50),
                                      ),
                                      itemBuilder: (context, index) {
                                        if (index <
                                            controller.artistTracks.length) {
                                          final track =
                                              controller.artistTracks[index];
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(
                                                context,
                                              )
                                                  .push(
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          TrackChartScreen(
                                                              track
                                                                  .track_id
                                                                  .toString(),
                                                              track.track_name
                                                                  .toString()),
                                                ),
                                              )
                                                  .then((value) {
                                                Get.delete<
                                                    TrackChartController>();
                                              });
                                            },
                                            child: Container(
                                              height:
                                                  ScreenHelper().setheight(80),
                                              margin: EdgeInsets.symmetric(
                                                  vertical: ScreenHelper()
                                                      .setheight(6)),
                                              decoration: BoxDecoration(
                                                  color: Color(0xff3B4E5F)
                                                      .withOpacity(0.04),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        ScreenHelper()
                                                            .setRadius(30)),
                                                    bottomLeft: Radius.circular(
                                                        ScreenHelper()
                                                            .setRadius(30)),
                                                    topRight: Radius.circular(
                                                        ScreenHelper()
                                                            .setRadius(10)),
                                                    bottomRight:
                                                        Radius.circular(
                                                            ScreenHelper()
                                                                .setRadius(10)),
                                                  )),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Color(0xff3B4E5F)
                                                            .withOpacity(0.04),
                                                    radius: ScreenHelper()
                                                        .setRadius(35),
                                                    backgroundImage:
                                                        CachedNetworkImageProvider(
                                                      EndPoint.base +
                                                          track.picture_url
                                                              .toString(),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: ScreenHelper()
                                                        .setWidth(8),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        track.track_name
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize:
                                                              ScreenHelper()
                                                                  .setFont(16),
                                                        ),
                                                      ),
                                                      Text(
                                                        '${controller.formatNumber(track.listen_counter!)} Played',
                                                        style: TextStyle(
                                                          fontSize:
                                                              ScreenHelper()
                                                                  .setFont(14),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    '${index + 1}',
                                                    style: TextStyle(
                                                      color: Color(0xffFF0055),
                                                      fontSize: ScreenHelper()
                                                          .setFont(20),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: ScreenHelper()
                                                        .setWidth(5),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        } else if (controller.hasMoreTracks &&
                                            !controller.isLoadingMore.value &&
                                            controller.lastPage.value <
                                                controller
                                                    .currentTrackPage.value) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          return SizedBox.shrink();
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: ScreenHelper().setheight(20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : SafeArea(
                          child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Home/circle.svg',
                                        width: ScreenHelper.dHeight,
                                        height: ScreenHelper().setheight(150),
                                      ),
                                      SvgPicture.asset(
                                        'assets/Home/vector.svg',
                                        width: ScreenHelper.dHeight,
                                        height: ScreenHelper().setheight(200),
                                      ),
                                      // CachedNetworkImage(
                                      //     imageUrl: EndPoint.base +
                                      //         controller.artistData.pictureUrl.toString()),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: ScreenHelper().setWidth(25),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${controller.formatNumber(controller.artistData.totla_listener!)}',
                                                style: TextStyle(
                                                    fontSize: ScreenHelper()
                                                        .setFont(28),
                                                    color: Color(0xffFF0055),
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                'People listened to',
                                                style: TextStyle(
                                                    fontSize: ScreenHelper()
                                                        .setFont(28),
                                                    color: Color(0xffFF0055),
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                'your songs',
                                                style: TextStyle(
                                                    fontSize: ScreenHelper()
                                                        .setFont(28),
                                                    color: Color(0xffFF0055),
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: ScreenHelper()
                                                    .setheight(15),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            children: [
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  LoadingAnimationWidget.beat(
                                                      size: ScreenHelper()
                                                          .setRadius(35),
                                                      color: Color(0xffFF0055)
                                                          .withOpacity(0.5)),
                                                  Text(
                                                    '${controller.formatNumber(controller.artistData.live_listen!)}',
                                                    style: TextStyle(
                                                        fontSize: ScreenHelper()
                                                            .setFont(18),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height:
                                                    ScreenHelper().setheight(5),
                                              ),
                                              Text(
                                                'Streams',
                                                style: TextStyle(
                                                    fontSize: ScreenHelper()
                                                        .setFont(14),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: ScreenHelper().setWidth(25),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: ScreenHelper().setheight(20),
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'Bank',
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenHelper().setFont(14),
                                                color: Color(0xff3B4E5F)
                                                    .withOpacity(0.5)),
                                          ),
                                          Text(
                                            controller.artistData.bank != 0.0 &&
                                                    controller
                                                            .artistData.bank <=
                                                        0.5
                                                ? '<1\$'
                                                : '${controller.artistData.bank.toStringAsFixed(2)}\$',
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenHelper().setFont(18),
                                              color: Color(0xff3B4E5F),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: ScreenHelper().setWidth(16),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Income',
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenHelper().setFont(14),
                                                color: Color(0xff3B4E5F)
                                                    .withOpacity(0.5)),
                                          ),
                                          Text(
                                            controller.artistData
                                                            .total_income !=
                                                        0.0 &&
                                                    controller.artistData
                                                            .total_income <=
                                                        0.5
                                                ? '<1\$'
                                                : '${controller.artistData.total_income.toStringAsFixed(2)}\$',
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenHelper().setFont(18),
                                              color: Color(0xff3B4E5F),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: ScreenHelper().setWidth(16),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Total Play',
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenHelper().setFont(14),
                                                color: Color(0xff3B4E5F)
                                                    .withOpacity(0.5)),
                                          ),
                                          Text(
                                            '${controller.formatNumber(controller.artistData.total_play!)}',
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenHelper().setFont(18),
                                              color: Color(0xff3B4E5F),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: ScreenHelper().setWidth(16),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Likes',
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenHelper().setFont(14),
                                                color: Color(0xff3B4E5F)
                                                    .withOpacity(0.5)),
                                          ),
                                          Text(
                                            '${controller.formatNumber(controller.artistData.likes!)}',
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenHelper().setFont(18),
                                              color: Color(0xff3B4E5F),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: ScreenHelper().setWidth(16),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Monthly Listeners',
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenHelper().setFont(14),
                                                color: Color(0xff3B4E5F)
                                                    .withOpacity(0.5)),
                                          ),
                                          Text(
                                            '${controller.formatNumber(controller.artistData.monthly_listener!)}',
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenHelper().setFont(18),
                                              color: Color(0xff3B4E5F),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: ScreenHelper().setheight(6),
                                  ),
                                  TabBar(
                                    controller: controller.tabController,
                                    physics: NeverScrollableScrollPhysics(),
                                    tabs: [
                                      Tab(
                                        text: 'Tracks',
                                      ),
                                      Tab(
                                        text: 'Artists',
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: ScreenHelper.deWidth,
                                    height: ScreenHelper.dHeight *
                                        controller.artistTracks.length /
                                        5,
                                    child: TabBarView(
                                      physics: NeverScrollableScrollPhysics(),
                                      controller: controller.tabController,
                                      children: [
                                        SingleChildScrollView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      width:
                                                          ScreenHelper.deWidth /
                                                              2,
                                                      height:
                                                          ScreenHelper.dHeight /
                                                              15,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: TextFormField(
                                                        onChanged:
                                                            (value) async {
                                                          controller
                                                              .currentTrackPage
                                                              .value = 1;
                                                          controller
                                                              .isLoadingTracks
                                                              .value = true;

                                                          controller.update();
                                                          await controller.getLabelTracks(
                                                              order: controller
                                                                  .order.value,
                                                              name: value,
                                                              page: controller
                                                                  .currentTrackPage
                                                                  .value,
                                                              artistId:
                                                                  controller
                                                                      .artistId
                                                                      .value);
                                                        },
                                                        controller: controller
                                                            .searchInTracks,
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                'Search tracks, artists, lyrics...',
                                                            border: InputBorder
                                                                .none),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          ScreenHelper.deWidth /
                                                              4,
                                                      height:
                                                          ScreenHelper.dHeight /
                                                              15,
                                                      child:
                                                          DropdownButtonFormField<
                                                              String>(
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .disabled,
                                                        isExpanded: true,
                                                        hint:
                                                            Text('All Artists'),
                                                        elevation: 0,
                                                        onChanged:
                                                            (value) async {
                                                          controller
                                                              .currentTrackPage
                                                              .value = 1;
                                                          controller
                                                              .isLoadingTracks
                                                              .value = true;

                                                          controller.update();
                                                          await controller
                                                              .getLabelTracks(
                                                            order: controller
                                                                .order.value,
                                                            name: controller
                                                                .searchInTracks
                                                                .text,
                                                            page: controller
                                                                .currentTrackPage
                                                                .value,
                                                            artistId: value
                                                                .toString(),
                                                          );
                                                        },
                                                        items: controller
                                                            .allArtistItems,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    8)),
                                                        decoration:
                                                            InputDecoration(
                                                          icon:
                                                              const SizedBox(),
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          ScreenHelper.deWidth /
                                                              6,
                                                      height:
                                                          ScreenHelper.dHeight /
                                                              15,
                                                      child:
                                                          DropdownButtonFormField<
                                                              int>(
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .disabled,
                                                        isExpanded: true,
                                                        hint: Text('Sort by'),
                                                        elevation: 0,
                                                        onChanged:
                                                            (value) async {
                                                          controller
                                                              .currentTrackPage
                                                              .value = 1;
                                                          controller
                                                                  .order.value =
                                                              value ?? 2;
                                                          controller
                                                              .isLoadingTracks
                                                              .value = true;

                                                          controller.update();
                                                          await controller
                                                              .getLabelTracks(
                                                            order: controller
                                                                .order.value,
                                                            name: controller
                                                                .searchInTracks
                                                                .text,
                                                            page: controller
                                                                .currentTrackPage
                                                                .value,
                                                            artistId: controller
                                                                .artistId
                                                                .toString(),
                                                          );
                                                        },
                                                        items: [
                                                          DropdownMenuItem(
                                                            child:
                                                                Text('Newest'),
                                                            value: 0,
                                                          ),
                                                          DropdownMenuItem(
                                                            child:
                                                                Text('Oldest'),
                                                            value: 1,
                                                          ),
                                                          DropdownMenuItem(
                                                            child: Text(
                                                                'Most Popular'),
                                                            value: 2,
                                                          ),
                                                          DropdownMenuItem(
                                                            child: Text(
                                                                'Total Play'),
                                                            value: 3,
                                                          ),
                                                          DropdownMenuItem(
                                                            child:
                                                                Text('A -> Z'),
                                                            value: 4,
                                                          ),
                                                          DropdownMenuItem(
                                                            child:
                                                                Text('Z -> A'),
                                                            value: 5,
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    8)),
                                                        decoration:
                                                            InputDecoration(
                                                          icon:
                                                              const SizedBox(),
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: ScreenHelper()
                                                        .setWidth(20),
                                                  ),
                                                  Text(
                                                    'Top Songs',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: ScreenHelper()
                                                            .setFont(16)),
                                                  ),
                                                  Spacer(),
                                                  SizedBox(
                                                    width: ScreenHelper()
                                                        .setWidth(20),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: ScreenHelper()
                                                    .setheight(12),
                                              ),
                                              !controller.isLoadingTracks
                                                          .value &&
                                                      controller.artistTracks
                                                              .length >
                                                          0
                                                  ? ListView.builder(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemCount: controller
                                                              .artistTracks
                                                              .length +
                                                          (controller
                                                                  .hasMoreTracks
                                                              ? 1
                                                              : 0),
                                                      padding: EdgeInsets.only(
                                                        right: ScreenHelper()
                                                            .setWidth(8),
                                                        left: ScreenHelper()
                                                            .setWidth(8),
                                                        bottom: ScreenHelper()
                                                            .setWidth(50),
                                                      ),
                                                      itemBuilder:
                                                          (context, index) {
                                                        if (index <
                                                            controller
                                                                .artistTracks
                                                                .length) {
                                                          final track = controller
                                                                  .artistTracks[
                                                              index];
                                                          return GestureDetector(
                                                            onTap: () {
                                                              Navigator.of(
                                                                context,
                                                              )
                                                                  .push(
                                                                MaterialPageRoute(
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      TrackChartScreen(
                                                                          track
                                                                              .track_id
                                                                              .toString(),
                                                                          track
                                                                              .track_name
                                                                              .toString()),
                                                                ),
                                                              )
                                                                  .then(
                                                                      (value) {
                                                                Get.delete<
                                                                    TrackChartController>();
                                                              });
                                                            },
                                                            child: Container(
                                                              height:
                                                                  ScreenHelper()
                                                                      .setheight(
                                                                          80),
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          ScreenHelper()
                                                                              .setheight(6)),
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Color(
                                                                              0xff3B4E5F)
                                                                          .withOpacity(
                                                                              0.04),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(ScreenHelper().setRadius(30)),
                                                                        bottomLeft:
                                                                            Radius.circular(ScreenHelper().setRadius(30)),
                                                                        topRight:
                                                                            Radius.circular(ScreenHelper().setRadius(10)),
                                                                        bottomRight:
                                                                            Radius.circular(ScreenHelper().setRadius(10)),
                                                                      )),
                                                              child: Row(
                                                                children: [
                                                                  CircleAvatar(
                                                                    backgroundColor: Color(
                                                                            0xff3B4E5F)
                                                                        .withOpacity(
                                                                            0.04),
                                                                    radius: ScreenHelper()
                                                                        .setRadius(
                                                                            35),
                                                                    backgroundImage:
                                                                        CachedNetworkImageProvider(
                                                                      EndPoint.base +
                                                                          track
                                                                              .picture_url
                                                                              .toString(),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: ScreenHelper()
                                                                        .setWidth(
                                                                            8),
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        track
                                                                            .track_name
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              ScreenHelper().setFont(16),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${controller.formatNumber(track.listen_counter!)} Played',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              ScreenHelper().setFont(14),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Spacer(),
                                                                  Text(
                                                                    '${index + 1}',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xffFF0055),
                                                                      fontSize:
                                                                          ScreenHelper()
                                                                              .setFont(20),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: ScreenHelper()
                                                                        .setWidth(
                                                                            5),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        } else if (controller
                                                                .hasMoreTracks &&
                                                            !controller
                                                                .isLoadingMore
                                                                .value &&
                                                            controller.lastPage
                                                                    .value <
                                                                controller
                                                                    .currentTrackPage
                                                                    .value) {
                                                          return Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          );
                                                        } else {
                                                          return SizedBox
                                                              .shrink();
                                                        }
                                                      },
                                                    )
                                                  : const CircularProgressIndicator(),
                                              SizedBox(
                                                height: ScreenHelper()
                                                    .setheight(20),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          child: Column(
                                            children: [Text('data')],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                );
        },
      ),
    );
  }
}
