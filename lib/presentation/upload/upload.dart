import 'package:label/common/helper/screen_helper.dart';
import 'package:label/presentation/upload/review/review.dart';
import 'package:label/presentation/upload/upload_album.dart';
import 'package:label/presentation/upload/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatelessWidget {
  UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(
          () {
            return controller.isUploadPage.value
                ? Text(
                    'Upload',
                    style: TextStyle(color: Color(0xff3B4E5F)),
                  )
                : Text(
                    'Review',
                    style: TextStyle(color: Color(0xff3B4E5F)),
                  );
          },
        ),
        actions: [
          Obx(() {
            return controller.isUploadPage.value == false
                ? IconButton(
                    onPressed: () {
                      controller.reviewController.getTracks();
                    },
                    icon: Icon(
                      Icons.refresh,
                      color: Color(0xff3B4E5F),
                    ))
                : SizedBox();
          }),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: GetX<UploadController>(
        // init: controller,
        builder: (_) {
          return controller.isloading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.only(
                      right: ScreenHelper().setWidth(20),
                      left: ScreenHelper().setWidth(20),
                      top: ScreenHelper().setheight(20),
                      bottom: ScreenHelper().setheight(100)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: ScreenHelper().setWidth(60),
                          ),
                          GestureDetector(
                            onTap: () {
                              // setState(() {
                              controller.isUploadPage.value = true;
                              // });
                            },
                            child: Container(
                              width: ScreenHelper().setWidth(90),
                              height: ScreenHelper().setheight(30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          ScreenHelper().setRadius(5))),
                                  color: controller.isUploadPage.value
                                      ? Color(0xffFF0055)
                                      : Colors.white),
                              child: Center(
                                child: Text(
                                  'Upload',
                                  style: TextStyle(
                                      color: controller.isUploadPage.value
                                          ? Colors.white
                                          : Color(0xff3B4E5F)),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              // setState(() {
                              controller.isUploadPage.value = false;
                              // });
                            },
                            child: Container(
                              width: ScreenHelper().setWidth(90),
                              height: ScreenHelper().setheight(30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          ScreenHelper().setRadius(5))),
                                  color: controller.isUploadPage.value == false
                                      ? Color(0xffFF0055)
                                      : Colors.white),
                              child: Center(
                                child: Text(
                                  'Review',
                                  style: TextStyle(
                                      color:
                                          controller.isUploadPage.value == false
                                              ? Colors.white
                                              : Color(0xff3B4E5F)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ScreenHelper().setWidth(60),
                          ),
                        ],
                      ),
                      controller.isUploadPage.value
                          ? Column(
                              children: [
                                SizedBox(
                                  height: ScreenHelper().setheight(30),
                                ),
                                Container(
                                  width: ScreenHelper.deWidth,
                                  height: ScreenHelper().setheight(60),
                                  child: Center(
                                    child: SizedBox(
                                      height: ScreenHelper().setheight(150),
                                      width: ScreenHelper().setWidth(350),
                                      child: CheckboxListTile(
                                          activeColor: Color(0xffFF5500),
                                          title: Text('Single track'),
                                          value: controller.isSingle.value,
                                          onChanged: (value) {
                                            // setState(() {
                                            controller.isSingle.value = value!;
                                            // });
                                          }),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              ScreenHelper().setRadius(10))),
                                      color:
                                          Color(0xff5F6268).withOpacity(0.04)),
                                ),
                                controller.isSingle.value
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height:
                                                ScreenHelper().setheight(20),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xff5F6268)
                                                  .withOpacity(0.04),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  ScreenHelper().setRadius(10),
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  'Track Name* : ',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                Expanded(
                                                  child: FocusScope(
                                                    child: TextFormField(
                                                      focusNode: FocusNode(
                                                          canRequestFocus:
                                                              false),
                                                      onChanged: (value) {
                                                        controller
                                                            .uploadTrackModel
                                                            .track_name = value;
                                                      },
                                                      controller: controller
                                                          .nameController,
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xff3B4E5F)),
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'Song name',
                                                        border:
                                                            InputBorder.none,
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
                                            width: ScreenHelper.deWidth,
                                            height:
                                                ScreenHelper().setheight(46),
                                            decoration: BoxDecoration(
                                              color: Color(0xff5F6268)
                                                  .withOpacity(0.04),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  ScreenHelper().setRadius(10),
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text('Genre* : '),
                                                Expanded(
                                                  child:
                                                      DropdownButtonFormField<
                                                          String>(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(
                                                          ScreenHelper()
                                                              .setWidth(10)),
                                                    ),
                                                    value: controller.genreModel
                                                            .isNotEmpty
                                                        ? controller
                                                            .genreModel[0].id
                                                            .toString()
                                                        : null,
                                                    items: [
                                                      ...controller.genreModel
                                                          .map((genre) =>
                                                              DropdownMenuItem(
                                                                value: genre.id
                                                                    .toString(),
                                                                child: Text(genre
                                                                    .name
                                                                    .toString()),
                                                              ))
                                                          .toList(),
                                                      DropdownMenuItem(
                                                        value: 'other',
                                                        child: Text('Other'),
                                                      ),
                                                    ],
                                                    onChanged: (value) {
                                                      if (value == 'other') {
                                                        controller
                                                            .uploadTrackModel
                                                            .genre_id = null;
                                                        controller.isGenreOther
                                                            .value = true;
                                                      } else if (value !=
                                                          'other') {
                                                        controller.isGenreOther
                                                            .value = false;
                                                      }

                                                      controller
                                                              .uploadTrackModel
                                                              .genre_id =
                                                          int.parse(value!);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          controller.isGenreOther.value
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setheight(5),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Color(0xff5F6268)
                                                            .withOpacity(0.04),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(
                                                            ScreenHelper()
                                                                .setRadius(10),
                                                          ),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width:
                                                                ScreenHelper()
                                                                    .setWidth(
                                                                        5),
                                                          ),
                                                          Text(
                                                            'Genre* : ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Expanded(
                                                            child: FocusScope(
                                                              child:
                                                                  TextFormField(
                                                                focusNode: FocusNode(
                                                                    canRequestFocus:
                                                                        false),
                                                                onChanged:
                                                                    (value) {
                                                                  controller
                                                                      .uploadTrackModel
                                                                      .genre_name = value;
                                                                },
                                                                controller:
                                                                    controller
                                                                        .genereController,
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff3B4E5F)),
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      'Genre',
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: ScreenHelper().setheight(5),
                                          ),
                                          Container(
                                            width: ScreenHelper.deWidth,
                                            height:
                                                ScreenHelper().setheight(46),
                                            decoration: BoxDecoration(
                                              color: Color(0xff5F6268)
                                                  .withOpacity(0.04),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  ScreenHelper().setRadius(10),
                                                ),
                                              ),
                                            ),
                                            child: Row(children: [
                                              SizedBox(
                                                width:
                                                    ScreenHelper().setWidth(5),
                                              ),
                                              Text('Language* : '),
                                              Expanded(
                                                child: DropdownButtonFormField<
                                                    String>(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        ScreenHelper()
                                                            .setWidth(10)),
                                                  ),
                                                  value: controller
                                                          .languageModel
                                                          .isNotEmpty
                                                      ? controller
                                                          .languageModel[0].id
                                                          .toString()
                                                      : null,
                                                  items: [
                                                    ...controller.languageModel
                                                        .map((language) =>
                                                            DropdownMenuItem(
                                                              value: language.id
                                                                  .toString(),
                                                              child: Text(language
                                                                  .language
                                                                  .toString()),
                                                            ))
                                                        .toList(),
                                                    DropdownMenuItem(
                                                      value: 'other',
                                                      child: Text('Other'),
                                                    ),
                                                  ],
                                                  onChanged: (value) {
                                                    controller.uploadTrackModel
                                                        .language = value;
                                                    if (value == 'other') {
                                                      controller
                                                          .uploadTrackModel
                                                          .language = '';
                                                      controller.islanguageOther
                                                          .value = true;
                                                    } else if (value !=
                                                        'other') {
                                                      controller.islanguageOther
                                                          .value = false;
                                                    }
                                                  },
                                                ),
                                              )
                                            ]),
                                          ),
                                          controller.islanguageOther.value
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setheight(5),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Color(0xff5F6268)
                                                            .withOpacity(0.04),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(
                                                            ScreenHelper()
                                                                .setRadius(10),
                                                          ),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width:
                                                                ScreenHelper()
                                                                    .setWidth(
                                                                        5),
                                                          ),
                                                          Text(
                                                            'Language* : ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Expanded(
                                                            child: FocusScope(
                                                              child:
                                                                  TextFormField(
                                                                focusNode: FocusNode(
                                                                    canRequestFocus:
                                                                        false),
                                                                onChanged:
                                                                    (value) {
                                                                  controller
                                                                      .uploadTrackModel
                                                                      .language = value;
                                                                },
                                                                controller:
                                                                    controller
                                                                        .languageController,
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff3B4E5F)),
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      'Language',
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: ScreenHelper().setheight(5),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xff5F6268)
                                                  .withOpacity(0.04),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  ScreenHelper().setRadius(10),
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  'Tag : ',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                Expanded(
                                                  child: FocusScope(
                                                    child: TextFormField(
                                                      focusNode: FocusNode(
                                                          canRequestFocus:
                                                              false),
                                                      onChanged: (value) {
                                                        controller
                                                            .uploadTrackModel
                                                            .track_tag = value;
                                                      },
                                                      controller: controller
                                                          .tagController,
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xff3B4E5F)),
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'Song tag',
                                                        border:
                                                            InputBorder.none,
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
                                              color: Color(0xff5F6268)
                                                  .withOpacity(0.04),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  ScreenHelper().setRadius(10),
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: ScreenHelper()
                                                          .setheight(60)),
                                                  child: Text(
                                                    'Lyric : ',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FocusScope(
                                                    child: TextFormField(
                                                      focusNode: FocusNode(
                                                          canRequestFocus:
                                                              false),
                                                      maxLines: 4,
                                                      onChanged: (value) {
                                                        controller
                                                            .uploadTrackModel
                                                            .lyrics = value;
                                                      },
                                                      controller: controller
                                                          .lyricController,
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xff3B4E5F)),
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'Song lyric',
                                                        border:
                                                            InputBorder.none,
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
                                              color: Color(0xff5F6268)
                                                  .withOpacity(0.04),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  ScreenHelper().setRadius(10),
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  'Lyrics by : ',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                Expanded(
                                                  child: FocusScope(
                                                    child: TextFormField(
                                                      focusNode: FocusNode(
                                                          canRequestFocus:
                                                              false),
                                                      onChanged: (value) {
                                                        controller
                                                            .uploadTrackModel
                                                            .lyrics_by = value;
                                                      },
                                                      controller: controller
                                                          .lyricByController,
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xff3B4E5F)),
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'Poet name',
                                                        border:
                                                            InputBorder.none,
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
                                              color: Color(0xff5F6268)
                                                  .withOpacity(0.04),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  ScreenHelper().setRadius(10),
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  'Melody by : ',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                Expanded(
                                                  child: FocusScope(
                                                    child: TextFormField(
                                                      focusNode: FocusNode(
                                                          canRequestFocus:
                                                              false),
                                                      onChanged: (value) {
                                                        controller
                                                            .uploadTrackModel
                                                            .melody = value;
                                                      },
                                                      controller: controller
                                                          .melodyController,
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xff3B4E5F)),
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Melodist name',
                                                        border:
                                                            InputBorder.none,
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
                                              color: Color(0xff5F6268)
                                                  .withOpacity(0.04),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  ScreenHelper().setRadius(10),
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  'Composer : ',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                Expanded(
                                                  child: FocusScope(
                                                    child: TextFormField(
                                                      focusNode: FocusNode(
                                                          canRequestFocus:
                                                              false),
                                                      onChanged: (value) {
                                                        controller
                                                            .uploadTrackModel
                                                            .composer = value;
                                                      },
                                                      controller: controller
                                                          .composerController,
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xff3B4E5F)),
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Composer name',
                                                        border:
                                                            InputBorder.none,
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
                                              color: Color(0xff5F6268)
                                                  .withOpacity(0.04),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  ScreenHelper().setRadius(10),
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  'Produced by : ',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                Expanded(
                                                  child: FocusScope(
                                                    child: TextFormField(
                                                      focusNode: FocusNode(
                                                          canRequestFocus:
                                                              false),
                                                      onChanged: (value) {
                                                        controller
                                                            .uploadTrackModel
                                                            .produced_by = value;
                                                      },
                                                      controller: controller
                                                          .producedController,
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xff3B4E5F)),
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Production name',
                                                        border:
                                                            InputBorder.none,
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
                                              color: Color(0xff5F6268)
                                                  .withOpacity(0.04),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  ScreenHelper().setRadius(10),
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                ),
                                                Text(
                                                  'Featured Artist : ',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                Expanded(
                                                  child: FocusScope(
                                                    child: TextFormField(
                                                      focusNode: FocusNode(
                                                          canRequestFocus:
                                                              false),
                                                      controller: controller
                                                          .featController,
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xff3B4E5F)),
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Featured artist name',
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                controller.featedArtists
                                                            .value <=
                                                        2
                                                    ? SizedBox(
                                                        child: IconButton(
                                                            onPressed: () {
                                                              controller
                                                                  .featedArtists
                                                                  .value++;
                                                            },
                                                            icon: Icon(
                                                                Icons.add)))
                                                    : SizedBox(),
                                                SizedBox(
                                                  width: ScreenHelper()
                                                      .setWidth(5),
                                                )
                                              ],
                                            ),
                                          ),
                                          controller.featedArtists.value == 0
                                              ? SizedBox()
                                              : Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: ScreenHelper()
                                                              .setheight(5),
                                                        ),
                                                        Container(
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
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                width:
                                                                    ScreenHelper()
                                                                        .setWidth(
                                                                            5),
                                                              ),
                                                              Text(
                                                                'Featured Artist : ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    FocusScope(
                                                                  child:
                                                                      TextFormField(
                                                                    focusNode: FocusNode(
                                                                        canRequestFocus:
                                                                            false),
                                                                    controller:
                                                                        controller
                                                                            .featController1,
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff3B4E5F)),
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          'Featured artist name',
                                                                      border: InputBorder
                                                                          .none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    controller.featedArtists
                                                                .value >=
                                                            2
                                                        ? Column(
                                                            children: [
                                                              SizedBox(
                                                                height:
                                                                    ScreenHelper()
                                                                        .setheight(
                                                                            5),
                                                              ),
                                                              Container(
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
                                                                          .setRadius(
                                                                              10),
                                                                    ),
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: ScreenHelper()
                                                                          .setWidth(
                                                                              5),
                                                                    ),
                                                                    Text(
                                                                      'Featured Artist : ',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          FocusScope(
                                                                        child:
                                                                            TextFormField(
                                                                          focusNode:
                                                                              FocusNode(canRequestFocus: false),
                                                                          controller:
                                                                              controller.featController2,
                                                                          style:
                                                                              TextStyle(color: Color(0xff3B4E5F)),
                                                                          decoration:
                                                                              InputDecoration(
                                                                            hintText:
                                                                                'Featured artist name',
                                                                            border:
                                                                                InputBorder.none,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : SizedBox(),
                                                    controller.featedArtists
                                                                .value ==
                                                            3
                                                        ? Column(
                                                            children: [
                                                              SizedBox(
                                                                height:
                                                                    ScreenHelper()
                                                                        .setheight(
                                                                            5),
                                                              ),
                                                              Container(
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
                                                                          .setRadius(
                                                                              10),
                                                                    ),
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: ScreenHelper()
                                                                          .setWidth(
                                                                              5),
                                                                    ),
                                                                    Text(
                                                                      'Featured Artist : ',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          FocusScope(
                                                                        child:
                                                                            TextFormField(
                                                                          focusNode:
                                                                              FocusNode(canRequestFocus: false),
                                                                          controller:
                                                                              controller.featController3,
                                                                          style:
                                                                              TextStyle(color: Color(0xff3B4E5F)),
                                                                          decoration:
                                                                              InputDecoration(
                                                                            hintText:
                                                                                'Featured artist name',
                                                                            border:
                                                                                InputBorder.none,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : SizedBox(),
                                                  ],
                                                ),
                                          SizedBox(
                                            height: ScreenHelper().setheight(5),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (controller
                                                  .isShareOtherPlatform.value) {
                                                controller.isShareOtherPlatform
                                                    .value = false;
                                              } else {
                                                controller.isShareOtherPlatform
                                                    .value = true;
                                              }
                                            },
                                            child: Container(
                                              width: ScreenHelper.deWidth,
                                              height:
                                                  ScreenHelper().setheight(60),
                                              child: Center(
                                                child: SizedBox(
                                                  height: ScreenHelper()
                                                      .setheight(150),
                                                  width: ScreenHelper()
                                                      .setWidth(350),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: ScreenHelper()
                                                            .setWidth(5),
                                                      ),
                                                      Text(
                                                        'Share on other Platforms',
                                                        style: TextStyle(
                                                            // color: Color(
                                                            //     0xff3B4E5F),
                                                            fontSize:
                                                                ScreenHelper()
                                                                    .setRadius(
                                                                        16)),
                                                      ),
                                                      Spacer(),
                                                      !controller
                                                              .isShareOtherPlatform
                                                              .value
                                                          ? Icon(Icons
                                                              .arrow_downward)
                                                          : Icon(Icons
                                                              .arrow_upward),
                                                      SizedBox(
                                                        width: ScreenHelper()
                                                            .setWidth(10),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(
                                                          ScreenHelper()
                                                              .setRadius(10))),
                                                  color: Color(0xff5F6268)
                                                      .withOpacity(0.04)),
                                            ),
                                          ),
                                          controller.isShareOtherPlatform.value
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setheight(5),
                                                    ),
                                                    Container(
                                                      width:
                                                          ScreenHelper.deWidth,
                                                      height: ScreenHelper()
                                                          .setheight(60),
                                                      child: Center(
                                                        child: SizedBox(
                                                          height: ScreenHelper()
                                                              .setheight(150),
                                                          width: ScreenHelper()
                                                              .setWidth(350),
                                                          child:
                                                              CheckboxListTile(
                                                                  activeColor:
                                                                      Color(
                                                                          0xffFF5500),
                                                                  title: Text(
                                                                      'Publish to Spotify'),
                                                                  value: controller
                                                                      .isSpotify
                                                                      .value,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(() {
                                                                    controller
                                                                        .isSpotify
                                                                        .value = value!;
                                                                    // });
                                                                  }),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .all(Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          10))),
                                                          color:
                                                              Color(0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04)),
                                                    ),
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setheight(5),
                                                    ),
                                                    Container(
                                                      width:
                                                          ScreenHelper.deWidth,
                                                      height: ScreenHelper()
                                                          .setheight(60),
                                                      child: Center(
                                                        child: SizedBox(
                                                          height: ScreenHelper()
                                                              .setheight(150),
                                                          width: ScreenHelper()
                                                              .setWidth(350),
                                                          child:
                                                              CheckboxListTile(
                                                                  activeColor:
                                                                      Color(
                                                                          0xffFF5500),
                                                                  title: Text(
                                                                      'Publish to Apple Music'),
                                                                  value: controller
                                                                      .isApple
                                                                      .value,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(() {
                                                                    controller
                                                                        .isApple
                                                                        .value = value!;
                                                                    // });
                                                                  }),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .all(Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          10))),
                                                          color:
                                                              Color(0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04)),
                                                    ),
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setheight(5),
                                                    ),
                                                    Container(
                                                      width:
                                                          ScreenHelper.deWidth,
                                                      height: ScreenHelper()
                                                          .setheight(60),
                                                      child: Center(
                                                        child: SizedBox(
                                                          height: ScreenHelper()
                                                              .setheight(150),
                                                          width: ScreenHelper()
                                                              .setWidth(350),
                                                          child:
                                                              CheckboxListTile(
                                                                  activeColor:
                                                                      Color(
                                                                          0xffFF5500),
                                                                  title: Text(
                                                                      'Publish to Youtube Music'),
                                                                  value: controller
                                                                      .isYoutube
                                                                      .value,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(() {
                                                                    controller
                                                                        .isYoutube
                                                                        .value = value!;
                                                                    // });
                                                                  }),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .all(Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          10))),
                                                          color:
                                                              Color(0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04)),
                                                    ),
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setheight(5),
                                                    ),
                                                    Container(
                                                      width:
                                                          ScreenHelper.deWidth,
                                                      height: ScreenHelper()
                                                          .setheight(60),
                                                      child: Center(
                                                        child: SizedBox(
                                                          height: ScreenHelper()
                                                              .setheight(150),
                                                          width: ScreenHelper()
                                                              .setWidth(350),
                                                          child:
                                                              CheckboxListTile(
                                                                  activeColor:
                                                                      Color(
                                                                          0xffFF5500),
                                                                  title: Text(
                                                                      'Publish to Amazon Music'),
                                                                  value: controller
                                                                      .isAmazon
                                                                      .value,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(() {
                                                                    controller
                                                                        .isAmazon
                                                                        .value = value!;
                                                                    // });
                                                                  }),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .all(Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          10))),
                                                          color:
                                                              Color(0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04)),
                                                    ),
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setheight(5),
                                                    ),
                                                    Container(
                                                      width:
                                                          ScreenHelper.deWidth,
                                                      height: ScreenHelper()
                                                          .setheight(60),
                                                      child: Center(
                                                        child: SizedBox(
                                                          height: ScreenHelper()
                                                              .setheight(150),
                                                          width: ScreenHelper()
                                                              .setWidth(350),
                                                          child:
                                                              CheckboxListTile(
                                                                  activeColor:
                                                                      Color(
                                                                          0xffFF5500),
                                                                  title: Text(
                                                                      'Publish to Instagram Music library',
                                                                      style: TextStyle(
                                                                          fontSize: ScreenHelper().setRadius(
                                                                              14))),
                                                                  value: controller
                                                                      .isInstagram
                                                                      .value,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(() {
                                                                    controller
                                                                        .isInstagram
                                                                        .value = value!;
                                                                    // });
                                                                  }),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .all(Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          10))),
                                                          color:
                                                              Color(0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04)),
                                                    ),
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setheight(5),
                                                    ),
                                                    Container(
                                                      width:
                                                          ScreenHelper.deWidth,
                                                      height: ScreenHelper()
                                                          .setheight(60),
                                                      child: Center(
                                                        child: SizedBox(
                                                          height: ScreenHelper()
                                                              .setheight(150),
                                                          width: ScreenHelper()
                                                              .setWidth(350),
                                                          child:
                                                              CheckboxListTile(
                                                                  activeColor:
                                                                      Color(
                                                                          0xffFF5500),
                                                                  title: Text(
                                                                    'Publish to Facebook Music library',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            ScreenHelper().setRadius(14)),
                                                                  ),
                                                                  value: controller
                                                                      .isFacebook
                                                                      .value,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(() {
                                                                    controller
                                                                        .isFacebook
                                                                        .value = value!;
                                                                    // });
                                                                  }),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .all(Radius.circular(
                                                                  ScreenHelper()
                                                                      .setRadius(
                                                                          10))),
                                                          color:
                                                              Color(0xff5F6268)
                                                                  .withOpacity(
                                                                      0.04)),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: ScreenHelper().setheight(5),
                                          ),
                                          Container(
                                            width: ScreenHelper.deWidth,
                                            height:
                                                ScreenHelper().setheight(100),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Color(0xff5F6268)
                                                      .withOpacity(0.2)),
                                              color: Color(0xff5F6268)
                                                  .withOpacity(0.04),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  ScreenHelper().setRadius(10),
                                                ),
                                              ),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.getImage(context,
                                                    ImageSource.gallery, true);
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setheight(15),
                                                    ),
                                                    SvgPicture.asset(
                                                        'assets/Upload/uploadimage.svg'),
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setheight(15),
                                                    ),
                                                    controller.isImageFile
                                                                .value ==
                                                            false
                                                        ? Text(
                                                            'Upload Song Cover*',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        : Text(
                                                            '...${controller.croppedImage!.path.substring(controller.croppedImage!.path.length - 20)}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenHelper().setheight(5),
                                          ),
                                          Container(
                                            width: ScreenHelper.deWidth,
                                            height:
                                                ScreenHelper().setheight(100),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Color(0xff5F6268)
                                                      .withOpacity(0.2)),
                                              color: Color(0xff5F6268)
                                                  .withOpacity(0.04),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  ScreenHelper().setRadius(10),
                                                ),
                                              ),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.pickTrackFile();
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setheight(15),
                                                    ),
                                                    SvgPicture.asset(
                                                        'assets/Upload/upload.svg'),
                                                    SizedBox(
                                                      height: ScreenHelper()
                                                          .setheight(15),
                                                    ),
                                                    controller.isTrackFile
                                                                .value ==
                                                            false
                                                        ? Text(
                                                            'Upload Song File (.mp3, .wav)*',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        : Text(
                                                            '...${controller.trackFile!.path.substring(controller.trackFile!.path.length - 30)}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                ScreenHelper().setheight(30),
                                          ),
                                          Container(
                                            width: ScreenHelper.deWidth,
                                            height:
                                                ScreenHelper().setheight(46),
                                            child: ElevatedButton(
                                              child:
                                                  controller.isUploading.value
                                                      ? Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        )
                                                      : Text('Save'),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xff3B4E5F)
                                                        .withOpacity(0.75),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          ScreenHelper()
                                                              .setRadius(10)),
                                                ),
                                              ),
                                              onPressed: () async {
                                                controller.platforms.clear();
                                                if (controller
                                                    .isSpotify.value) {
                                                  controller.platforms
                                                      .add('Spotify');
                                                }
                                                if (controller.isApple.value) {
                                                  controller.platforms
                                                      .add('Apple Music');
                                                }
                                                if (controller
                                                    .isYoutube.value) {
                                                  controller.platforms
                                                      .add('YouTube Music');
                                                }
                                                if (controller.isAmazon.value) {
                                                  controller.platforms
                                                      .add('Amazon Music');
                                                }
                                                if (controller.isValid()) {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          content:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  'Do you want to upload ${controller.nameController.text}?',
                                                                  style: TextStyle(
                                                                      fontSize: ScreenHelper()
                                                                          .setRadius(
                                                                              14),
                                                                      color: Color(
                                                                          0xffFF0055)),
                                                                ),
                                                                SizedBox(
                                                                  height: ScreenHelper()
                                                                      .setheight(
                                                                          15),
                                                                ),
                                                                controller.platforms
                                                                            .length !=
                                                                        0
                                                                    ? Text(
                                                                        'You choose the -${controller.platforms.toString().substring(1, controller.platforms.toString().length - 1)}- platform${controller.platforms.length == 1 ? '' : '(s)'} to share your Track! By choosing this feature Dangify will be the copyright holder for your Track on -Spotify- and 30% of the income will be allocated to Dangify.',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0xff3B4E5F)),
                                                                      )
                                                                    : SizedBox(),
                                                                SizedBox(
                                                                  height: ScreenHelper()
                                                                      .setheight(
                                                                          15),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      width: ScreenHelper()
                                                                          .setWidth(
                                                                              100),
                                                                      child: TextButton(
                                                                          style: ButtonStyle(
                                                                              backgroundColor: MaterialStateProperty.all(
                                                                            Color(0xffFF0055).withOpacity(0.75),
                                                                          )),
                                                                          onPressed: () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                          child: Text(
                                                                            'Cancel',
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          )),
                                                                    ),
                                                                    Spacer(),
                                                                    Container(
                                                                      width: ScreenHelper()
                                                                          .setWidth(
                                                                              100),
                                                                      child: TextButton(
                                                                          style: ButtonStyle(
                                                                              backgroundColor: MaterialStateProperty.all(
                                                                            Color(0xff3B4E5F).withOpacity(0.75),
                                                                          )),
                                                                          onPressed: () {
                                                                            if (controller.isValid()) {
                                                                              controller.isUploading.value = true;
                                                                              controller.uploadtrack();
                                                                              Navigator.of(context).pop();
                                                                            }
                                                                          },
                                                                          child: Text(
                                                                            'Upload',
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          )),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    : UploadAlbum()
                              ],
                            )
                          : Review(),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
