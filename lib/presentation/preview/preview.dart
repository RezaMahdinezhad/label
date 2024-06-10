import 'package:label/common/helper/screen_helper.dart';
import 'package:label/domain/repository/remote/endpoint.dart';
import 'package:label/presentation/preview/preview_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PreviewPage extends StatefulWidget {
  PreviewPage({super.key});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  var controller = Get.put(PreviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:
            Color(int.parse('0xff${controller.profileController.color1}')),
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: ScreenHelper().setWidth(36),
            height: ScreenHelper().setheight(36),
            color: Colors.transparent,
            child: SvgPicture.asset(
              'assets/Preview/arrow-left.svg',
              width: ScreenHelper().setWidth(24),
              height: ScreenHelper().setheight(24),
              fit: BoxFit.none,
            ),
          ),
        ),
        title: Text(
          controller.profileController.userdataModel.name!,
          style: TextStyle(
              color: Colors.white, fontSize: ScreenHelper().setRadius(18)),
        ),
        actions: [
          Container(
            width: ScreenHelper().setWidth(36),
            height: ScreenHelper().setheight(36),
            color: Colors.transparent,
            child: SvgPicture.asset(
              'assets/Preview/more.svg',
              width: ScreenHelper().setWidth(24),
              height: ScreenHelper().setheight(24),
              fit: BoxFit.none,
            ),
          ),
        ],
      ),
      backgroundColor:
          Color(int.parse('0xff${controller.profileController.color1}')),
      body: GetBuilder<PreviewController>(
        builder: (_) {
          return controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : Container(
                  height: ScreenHelper.dHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(int.parse(
                          '0xff${controller.profileController.color1}')),
                      Color(
                        int.parse('0xff${controller.profileController.color2}'),
                      ),
                    ], begin: Alignment.topLeft, end: Alignment.centerRight),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(ScreenHelper().setRadius(20)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: ScreenHelper().setheight(20),
                          ),
                          Stack(
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
                                    height: ScreenHelper().setRadius(353),
                                    width: ScreenHelper().setRadius(353),
                                    imageUrl:
                                        '${EndPoint.base + controller.previewArtistModel.picture_url!}'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenHelper().setheight(20),
                                    left: ScreenHelper().setWidth(20)),
                                child: Container(
                                  width: ScreenHelper().setWidth(32),
                                  height: ScreenHelper().setheight(32),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        ScreenHelper().setRadius(10),
                                      ),
                                    ),
                                    color: Color(0xffFF0055),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '#${controller.artistDataController.artistData.rank}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: ScreenHelper().setheight(15),
                          ),
                          Row(
                            children: [
                              Text(
                                controller.previewArtistModel.name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: ScreenHelper().setRadius(24)),
                              ),
                              controller.previewArtistModel.is_user == 1
                                  ? SvgPicture.asset(
                                      'assets/Preview/verify.svg')
                                  : SizedBox()
                            ],
                          ),
                          SizedBox(
                            height: ScreenHelper().setheight(10),
                          ),
                          Row(
                            children: [
                              Text(
                                '${controller.formatNumber(controller.previewArtistModel.followers!)} Follower',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenHelper().setRadius(14)),
                              ),
                              SizedBox(
                                width: ScreenHelper().setWidth(10),
                              ),
                              SvgPicture.asset('assets/Preview/plays.svg'),
                              SizedBox(
                                width: ScreenHelper().setWidth(5),
                              ),
                              Text(
                                '${controller.formatNumber(controller.previewArtistModel.listen_counter!)} Plays',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenHelper().setRadius(14)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenHelper().setheight(10),
                          ),
                          SizedBox(
                            height: ScreenHelper().setheight(20),
                          ),
                          Row(
                            children: [
                              Container(
                                child: Center(
                                    child: Text(
                                  'Following',
                                  style: TextStyle(color: Color(0xffFF0055)),
                                )),
                                width: ScreenHelper().setWidth(227),
                                height: ScreenHelper().setheight(42),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffFF0055)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      ScreenHelper().setRadius(4),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ScreenHelper().setWidth(5),
                              ),
                              Container(
                                child: Center(
                                  child: SvgPicture.asset(
                                      'assets/Preview/shuffle.svg'),
                                ),
                                width: ScreenHelper().setWidth(47),
                                height: ScreenHelper().setheight(42),
                                decoration: BoxDecoration(
                                  color: Color(0xff0D0D0D),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      ScreenHelper().setRadius(4),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ScreenHelper().setWidth(5),
                              ),
                              Container(
                                child: Center(
                                  child: SvgPicture.asset(
                                      'assets/Preview/share.svg'),
                                ),
                                width: ScreenHelper().setWidth(47),
                                height: ScreenHelper().setheight(42),
                                decoration: BoxDecoration(
                                  color: Color(0xff0D0D0D),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      ScreenHelper().setRadius(4),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenHelper().setheight(20),
                          ),
                          SizedBox(
                            height: ScreenHelper().setheight(20),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    controller.isTrack = true;
                                  });
                                },
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    'Tracks',
                                    style: TextStyle(
                                        color: controller.isTrack == true
                                            ? Color(0xffFF0055)
                                            : Colors.white),
                                  )),
                                  width: ScreenHelper().setWidth(160),
                                  height: ScreenHelper().setheight(42),
                                  decoration: BoxDecoration(
                                    color: Color(0xff0D0D0D),
                                    border: Border.all(
                                        color: controller.isTrack == true
                                            ? Color(0xffFF0055)
                                            : Colors.transparent),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        ScreenHelper().setRadius(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    controller.isTrack = false;
                                  });
                                },
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'Albums',
                                      style: TextStyle(
                                          color: controller.isTrack == false
                                              ? Color(0xffFF0055)
                                              : Colors.white),
                                    ),
                                  ),
                                  width: ScreenHelper().setWidth(160),
                                  height: ScreenHelper().setheight(42),
                                  decoration: BoxDecoration(
                                    color: Color(0xff0D0D0D),
                                    border: Border.all(
                                        color: controller.isTrack == false
                                            ? Color(0xffFF0055)
                                            : Colors.transparent),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        ScreenHelper().setRadius(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenHelper().setheight(20),
                          ),
                          Row(
                            children: [
                              Container(
                                child: Center(
                                    child: Row(
                                  children: [
                                    SizedBox(
                                      width: ScreenHelper().setWidth(20),
                                    ),
                                    SvgPicture.asset(
                                      'assets/Preview/search.svg',
                                    ),
                                    SizedBox(
                                      width: ScreenHelper().setWidth(5),
                                    ),
                                    Text(
                                      'Find Your Favorite Track',
                                      style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ),
                                  ],
                                )),
                                width: ScreenHelper().setWidth(233),
                                height: ScreenHelper().setheight(54),
                                decoration: BoxDecoration(
                                  color: Color(0xff0D0D0D),
                                  border: Border.all(color: Color(0xff777777)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      ScreenHelper().setRadius(8),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Center(
                                    child: Row(
                                  children: [
                                    SizedBox(
                                      width: ScreenHelper().setWidth(15),
                                    ),
                                    Text(
                                      'Sort by',
                                      style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenHelper().setWidth(5),
                                    ),
                                    SvgPicture.asset(
                                      'assets/Preview/arrow-down.svg',
                                    ),
                                  ],
                                )),
                                width: ScreenHelper().setWidth(90),
                                height: ScreenHelper().setheight(54),
                                decoration: BoxDecoration(
                                  color: Color(0xff0D0D0D),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      ScreenHelper().setRadius(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          controller.isTrack == true
                              ? controller.previewTracks != []
                                  ? ListView.builder(
                                      padding: EdgeInsets.only(
                                          top: ScreenHelper().setheight(20)),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          controller.previewTracks.length > 5
                                              ? 5
                                              : controller.previewTracks.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final track =
                                            controller.previewTracks[index];
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical:
                                                  ScreenHelper().setheight(8)),
                                          child: Container(
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(
                                                          ScreenHelper()
                                                              .setRadius(4))),
                                                  child: CachedNetworkImage(
                                                      width: ScreenHelper()
                                                          .setWidth(70),
                                                      height: ScreenHelper()
                                                          .setheight(70),
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context,
                                                          url, error) {
                                                        return SvgPicture.asset(
                                                            'assets/LogIn/dangify-artists.svg');
                                                      },
                                                      imageUrl: EndPoint.base +
                                                          track.picture_url!),
                                                ),
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(10),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${track.name}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              ScreenHelper()
                                                                  .setFont(16)),
                                                    ),
                                                    Text(
                                                      '${track.artist_name}',
                                                      style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(0.6),
                                                          fontSize:
                                                              ScreenHelper()
                                                                  .setFont(14)),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : SizedBox()
                              : controller.previewAlbums != []
                                  ? ListView.builder(
                                      padding: EdgeInsets.only(
                                          top: ScreenHelper().setheight(20)),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          controller.previewAlbums.length > 5
                                              ? 5
                                              : controller.previewAlbums.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final album =
                                            controller.previewAlbums[index];
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical:
                                                  ScreenHelper().setheight(8)),
                                          child: Container(
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(
                                                          ScreenHelper()
                                                              .setRadius(4))),
                                                  child: CachedNetworkImage(
                                                      width: ScreenHelper()
                                                          .setWidth(70),
                                                      height: ScreenHelper()
                                                          .setheight(70),
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context,
                                                          url, error) {
                                                        return SvgPicture.asset(
                                                            'assets/LogIn/dangify-artists.svg');
                                                      },
                                                      imageUrl: EndPoint.base +
                                                          album.picture_url!),
                                                ),
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(10),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${album.name}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              ScreenHelper()
                                                                  .setFont(16)),
                                                    ),
                                                    Text(
                                                      '${album.artist_name}',
                                                      style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(0.6),
                                                          fontSize:
                                                              ScreenHelper()
                                                                  .setFont(14)),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : SizedBox(),
                          SizedBox(
                            height: ScreenHelper().setheight(20),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.white),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Bio',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenHelper().setheight(5),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: ScreenHelper().setheight(10),
                          ),
                          controller.previewArtistModel.description != null
                              ? Column(
                                  children: [
                                    Text(
                                      controller
                                          .previewArtistModel.description!,
                                      softWrap: true,
                                      maxLines: controller.descriptionMaxLines,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    controller.previewArtistModel.description!
                                                .characters.length >=
                                            1000
                                        ? SizedBox()
                                        : SizedBox(
                                            width: ScreenHelper.deWidth,
                                            child: TextButton(
                                              onPressed: () {
                                                if (controller
                                                        .descriptionMaxLines ==
                                                    2) {
                                                  setState(() {
                                                    controller
                                                            .descriptionMaxLines =
                                                        100;
                                                    controller.description =
                                                        'Show Less';
                                                  });
                                                } else {
                                                  setState(() {
                                                    controller
                                                        .descriptionMaxLines = 2;
                                                    controller.description =
                                                        'Show More';
                                                  });
                                                }
                                              },
                                              child: Text(
                                                controller.description,
                                                style: TextStyle(
                                                    color: Color(0xffFF0055)),
                                              ),
                                            ),
                                          ),
                                  ],
                                )
                              : SizedBox(),
                          SizedBox(
                            height: ScreenHelper().setheight(20),
                          ),
                          Row(
                            children: [
                              Text(
                                'Social Medias',
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: ScreenHelper().setheight(10),
                          ),
                          Container(
                            width: ScreenHelper.deWidth,
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(color: Colors.white, width: 1.0),
                              bottom:
                                  BorderSide(color: Colors.white, width: 1.0),
                            )),
                            child: Row(
                              children: [
                                controller.previewArtistModel.instagram_url !=
                                        null
                                    ? Column(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/Artist/instagram.svg',
                                            color: Colors.white,
                                            width: ScreenHelper().setWidth(50),
                                            height:
                                                ScreenHelper().setheight(50),
                                          ),
                                          // Image(
                                          //   image: AssetImage(
                                          //       'assets/Preview/instagram.png'),
                                          // ),

                                          // Text(
                                          //   'Instagram',
                                          //   style:
                                          //       TextStyle(color: Colors.white),
                                          // ),
                                        ],
                                      )
                                    : SizedBox.shrink(),
                                SizedBox(
                                  width: ScreenHelper().setWidth(5),
                                ),
                                controller.previewArtistModel.twitter_url !=
                                        null
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height:
                                                ScreenHelper().setheight(10),
                                          ),
                                          Image(
                                            image: AssetImage(
                                                'assets/Preview/twitter.png'),
                                          ),
                                          SizedBox(
                                            height: ScreenHelper().setheight(5),
                                          ),
                                          Text(
                                            'Twitter',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenHelper().setheight(10),
                                          ),
                                        ],
                                      )
                                    : SizedBox.shrink(),
                                SizedBox(
                                  width: ScreenHelper().setWidth(5),
                                ),
                                controller.previewArtistModel.youtube_url !=
                                        null
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height:
                                                ScreenHelper().setheight(10),
                                          ),
                                          SvgPicture.asset(
                                            'assets/Artist/youtube.svg',
                                            width: ScreenHelper().setWidth(50),
                                            height:
                                                ScreenHelper().setheight(50),
                                            color: Colors.white,
                                          ),
                                          // Image(
                                          //   image: AssetImage(
                                          //       'assets/Preview/youtube.png'),
                                          // ),
                                          // SizedBox(
                                          //   height: ScreenHelper().setheight(5),
                                          // ),
                                          // Text(
                                          //   'YouTube',
                                          //   style:
                                          //       TextStyle(color: Colors.white),
                                          // ),
                                          SizedBox(
                                            height:
                                                ScreenHelper().setheight(10),
                                          ),
                                        ],
                                      )
                                    : SizedBox.shrink(),
                                SizedBox(
                                  width: ScreenHelper().setWidth(5),
                                ),
                                controller.previewArtistModel.facebook_url !=
                                        null
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height:
                                                ScreenHelper().setheight(10),
                                          ),
                                          SvgPicture.asset(
                                            'assets/Artist/facebook.svg',
                                            width: ScreenHelper().setWidth(50),
                                            height:
                                                ScreenHelper().setheight(50),
                                            color: Colors.white,
                                          ),
                                          // Image(
                                          //   image: AssetImage(
                                          //       'assets/Preview/facebook.png'),
                                          // ),
                                          // SizedBox(
                                          //   height: ScreenHelper().setheight(5),
                                          // ),
                                          // Text(
                                          //   'Facebook',
                                          //   style:
                                          //       TextStyle(color: Colors.white),
                                          // ),
                                          SizedBox(
                                            height:
                                                ScreenHelper().setheight(10),
                                          ),
                                        ],
                                      )
                                    : SizedBox.shrink(),
                                controller.previewArtistModel.snapchat_url !=
                                        null
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height:
                                                ScreenHelper().setheight(10),
                                          ),
                                          Image(
                                            image: AssetImage(
                                                'assets/Preview/snapchat.png'),
                                          ),
                                          SizedBox(
                                            height: ScreenHelper().setheight(5),
                                          ),
                                          Text(
                                            'Snapchat',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenHelper().setheight(10),
                                          ),
                                        ],
                                      )
                                    : SizedBox.shrink(),
                                Spacer()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
