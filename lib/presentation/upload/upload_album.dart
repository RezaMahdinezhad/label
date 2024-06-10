import 'package:label/common/helper/screen_helper.dart';
import 'package:label/presentation/upload/album_controller.dart';
import 'package:label/presentation/upload/track_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadAlbum extends StatelessWidget {
  const UploadAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(UploadAlbumController());

    return GetX<UploadAlbumController>(builder: (_) {
      return !controller.isloading.value
          ? Column(
              children: [
                SizedBox(
                  height: ScreenHelper().setheight(20),
                ),
                Container(
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
                        'Album Name* : ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(
                        child: FocusScope(
                          child: TextFormField(
                            focusNode: FocusNode(canRequestFocus: false),
                            onChanged: (value) {
                              controller.uploadTrackModel.album_name = value;
                            },
                            controller: controller.albumNameController,
                            style: TextStyle(color: Color(0xff3B4E5F)),
                            decoration: InputDecoration(
                              hintText: 'Album name',
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
                  width: ScreenHelper.deWidth,
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
                      Text('Genre* : '),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          borderRadius: BorderRadius.all(
                            Radius.circular(ScreenHelper().setWidth(10)),
                          ),
                          value: controller.genreModel.isNotEmpty
                              ? controller.genreModel[0].id.toString()
                              : null,
                          items: [
                            ...controller.genreModel
                                .map((genre) => DropdownMenuItem(
                                      value: genre.id.toString(),
                                      child: Text(genre.name.toString()),
                                    ))
                                .toList(),
                            DropdownMenuItem(
                              value: 'other',
                              child: Text('Other'),
                            ),
                          ],
                          onChanged: (value) {
                            if (value == 'other') {
                              controller.uploadTrackModel.genre_id = null;
                              controller.isGenreOther.value = true;
                            } else if (value != 'other') {
                              controller.isGenreOther.value = false;
                            }
                            controller.uploadTrackModel.genre_id =
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
                            height: ScreenHelper().setheight(5),
                          ),
                          Container(
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
                                  'Genre* : ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Expanded(
                                  child: FocusScope(
                                    child: TextFormField(
                                      focusNode:
                                          FocusNode(canRequestFocus: false),
                                      onChanged: (value) {
                                        controller.uploadTrackModel.genre_name =
                                            value;
                                      },
                                      controller: controller.genereController,
                                      style:
                                          TextStyle(color: Color(0xff3B4E5F)),
                                      decoration: InputDecoration(
                                        hintText: 'Genre',
                                        border: InputBorder.none,
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
                  height: ScreenHelper().setheight(46),
                  decoration: BoxDecoration(
                    color: Color(0xff5F6268).withOpacity(0.04),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        ScreenHelper().setRadius(10),
                      ),
                    ),
                  ),
                  child: Row(children: [
                    SizedBox(
                      width: ScreenHelper().setWidth(5),
                    ),
                    Text('Language* : '),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        borderRadius: BorderRadius.all(
                          Radius.circular(ScreenHelper().setWidth(10)),
                        ),
                        value: controller.languageModel.isNotEmpty
                            ? controller.languageModel[0].id.toString()
                            : null,
                        items: [
                          ...controller.languageModel
                              .map((language) => DropdownMenuItem(
                                    value: language.id.toString(),
                                    child: Text(language.language.toString()),
                                  ))
                              .toList(),
                          DropdownMenuItem(
                            value: 'other',
                            child: Text('Other'),
                          ),
                        ],
                        onChanged: (value) {
                          controller.uploadTrackModel.language = value;
                          if (value == 'other') {
                            controller.uploadTrackModel.language = '';
                            controller.islanguageOther.value = true;
                          } else if (value != 'other') {
                            controller.islanguageOther.value = false;
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
                            height: ScreenHelper().setheight(5),
                          ),
                          Container(
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
                                  'Language* : ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Expanded(
                                  child: FocusScope(
                                    child: TextFormField(
                                      focusNode:
                                          FocusNode(canRequestFocus: false),
                                      onChanged: (value) {
                                        controller.uploadTrackModel.language =
                                            value;
                                      },
                                      controller: controller.languageController,
                                      style:
                                          TextStyle(color: Color(0xff3B4E5F)),
                                      decoration: InputDecoration(
                                        hintText: 'Language',
                                        border: InputBorder.none,
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
                        'Tag : ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(
                        child: FocusScope(
                          child: TextFormField(
                            focusNode: FocusNode(canRequestFocus: false),
                            onChanged: (value) {
                              controller.uploadTrackModel.track_tag = value;
                            },
                            controller: controller.tagController,
                            style: TextStyle(color: Color(0xff3B4E5F)),
                            decoration: InputDecoration(
                              hintText: 'Song tag',
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
                        'Produced by : ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(
                        child: FocusScope(
                          child: TextFormField(
                            focusNode: FocusNode(canRequestFocus: false),
                            onChanged: (value) {
                              controller.uploadTrackModel.produced_by = value;
                            },
                            controller: controller.producedController,
                            style: TextStyle(color: Color(0xff3B4E5F)),
                            decoration: InputDecoration(
                              hintText: 'Production name',
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
                  width: ScreenHelper.deWidth,
                  height: ScreenHelper().setheight(100),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.0, color: Color(0xff5F6268).withOpacity(0.2)),
                    color: Color(0xff5F6268).withOpacity(0.04),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        ScreenHelper().setRadius(10),
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      controller.getImage(context, ImageSource.gallery, true);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          SizedBox(
                            height: ScreenHelper().setheight(15),
                          ),
                          SvgPicture.asset('assets/Upload/uploadimage.svg'),
                          SizedBox(
                            height: ScreenHelper().setheight(15),
                          ),
                          controller.isImageFile.value == false
                              ? Text(
                                  'Upload album Cover*',
                                  style: TextStyle(color: Colors.black),
                                )
                              : Text(
                                  '...${controller.croppedImage!.path.substring(controller.croppedImage!.path.length - 20)}',
                                  style: TextStyle(color: Colors.black),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenHelper().setheight(5),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isShareOtherPlatform.value) {
                      controller.isShareOtherPlatform.value = false;
                    } else {
                      controller.isShareOtherPlatform.value = true;
                    }
                  },
                  child: Container(
                    width: ScreenHelper.deWidth,
                    height: ScreenHelper().setheight(60),
                    child: Center(
                      child: SizedBox(
                        height: ScreenHelper().setheight(150),
                        width: ScreenHelper().setWidth(350),
                        child: Row(
                          children: [
                            SizedBox(
                              width: ScreenHelper().setWidth(5),
                            ),
                            Text(
                              'Share on other Platforms',
                              style: TextStyle(
                                  // color: Color(0xff3B4E5F),
                                  fontSize: ScreenHelper().setRadius(16)),
                            ),
                            Spacer(),
                            !controller.isShareOtherPlatform.value
                                ? Icon(Icons.arrow_downward)
                                : Icon(Icons.arrow_upward),
                            SizedBox(
                              width: ScreenHelper().setWidth(10),
                            ),
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenHelper().setRadius(10))),
                        color: Color(0xff5F6268).withOpacity(0.04)),
                  ),
                ),
                controller.isShareOtherPlatform.value
                    ? Column(
                        children: [
                          SizedBox(
                            height: ScreenHelper().setheight(5),
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
                                    title: Text('Publish to Spotify'),
                                    value: controller.isSpotify.value,
                                    onChanged: (value) {
                                      // setState(() {
                                      controller.isSpotify.value = value!;
                                      // });
                                    }),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    ScreenHelper().setRadius(10))),
                                color: Color(0xff5F6268).withOpacity(0.04)),
                          ),
                          SizedBox(
                            height: ScreenHelper().setheight(5),
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
                                    title: Text('Publish to Apple Music'),
                                    value: controller.isApple.value,
                                    onChanged: (value) {
                                      // setState(() {
                                      controller.isApple.value = value!;
                                      // });
                                    }),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    ScreenHelper().setRadius(10))),
                                color: Color(0xff5F6268).withOpacity(0.04)),
                          ),
                          SizedBox(
                            height: ScreenHelper().setheight(5),
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
                                    title: Text('Publish to Youtube Music'),
                                    value: controller.isYoutube.value,
                                    onChanged: (value) {
                                      // setState(() {
                                      controller.isYoutube.value = value!;
                                      // });
                                    }),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    ScreenHelper().setRadius(10))),
                                color: Color(0xff5F6268).withOpacity(0.04)),
                          ),
                          SizedBox(
                            height: ScreenHelper().setheight(5),
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
                                    title: Text('Publish to Amazon Music'),
                                    value: controller.isAmazon.value,
                                    onChanged: (value) {
                                      // setState(() {
                                      controller.isAmazon.value = value!;
                                      // });
                                    }),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    ScreenHelper().setRadius(10))),
                                color: Color(0xff5F6268).withOpacity(0.04)),
                          ),
                          SizedBox(
                            height: ScreenHelper().setheight(5),
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
                                    title: Text(
                                        'Publish to Instagram Music library',
                                        style: TextStyle(
                                            fontSize:
                                                ScreenHelper().setRadius(14))),
                                    value: controller.isInstagram.value,
                                    onChanged: (value) {
                                      // setState(() {
                                      controller.isInstagram.value = value!;
                                      // });
                                    }),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    ScreenHelper().setRadius(10))),
                                color: Color(0xff5F6268).withOpacity(0.04)),
                          ),
                          SizedBox(
                            height: ScreenHelper().setheight(5),
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
                                    title: Text(
                                      'Publish to Facebook Music library',
                                      style: TextStyle(
                                          fontSize:
                                              ScreenHelper().setRadius(14)),
                                    ),
                                    value: controller.isFacebook.value,
                                    onChanged: (value) {
                                      // setState(() {
                                      controller.isFacebook.value = value!;
                                      // });
                                    }),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    ScreenHelper().setRadius(10))),
                                color: Color(0xff5F6268).withOpacity(0.04)),
                          ),
                        ],
                      )
                    : SizedBox(),
                SizedBox(
                  height: ScreenHelper().setheight(10),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.trackWidgets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return controller.trackWidgets[index];
                  },
                ),
                GestureDetector(
                  onTap: () {
                    controller.trackWidgets.add(
                        TrackWidget(index: controller.trackWidgets.length));
                    controller.update();
                  },
                  child: Container(
                    width: ScreenHelper.deWidth,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Color(0xff3B4E5F),
                        ),
                        SizedBox(
                          width: ScreenHelper().setWidth(5),
                        ),
                        Text(
                          'Add Song',
                          style: TextStyle(
                            color: Color(0xff3B4E5F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenHelper().setheight(40),
                ),
                Container(
                  width: ScreenHelper().setWidth(320),
                  height: ScreenHelper().setheight(46),
                  child: ElevatedButton(
                    child: Text('New Album'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFF0055).withOpacity(0.75),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenHelper().setRadius(10)),
                      ),
                    ),
                    onPressed: () async {
                      controller.rebuildAlbumPage();
                    },
                  ),
                ),
              ],
            )
          : Center(
              child: Padding(
              padding: EdgeInsets.all(ScreenHelper().setRadius(30)),
              child: CircularProgressIndicator(),
            ));
    });
  }
}
