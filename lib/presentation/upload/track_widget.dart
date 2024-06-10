import 'package:label/common/helper/screen_helper.dart';
import 'package:label/presentation/upload/album_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TrackWidget extends StatelessWidget {
  TrackWidget({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<UploadAlbumController>();
    return GetX<UploadAlbumController>(builder: (_) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: ScreenHelper().setheight(10)),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
                width: 1.0, color: Color(0xff5F6268).withOpacity(0.2)),
            borderRadius: BorderRadius.all(
              Radius.circular(
                ScreenHelper().setRadius(10),
              ),
            ),
            color: Color(0xff5F6268).withOpacity(0.02),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Track ${index + 1}'),
                  Spacer(),
                  index + 1 == controller.trackWidgets.length
                      ? GestureDetector(
                          onTap: () {
                            controller.trackWidgets.removeAt(index);
                            controller.update(); // Trigger a rebuild of the UI
                          },
                          child: Container(
                            width: ScreenHelper().setWidth(30),
                            height: ScreenHelper().setheight(30),
                            decoration: BoxDecoration(
                                color: Color(0xff5F6268).withOpacity(0.04),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    ScreenHelper().setRadius(100)))),
                            child: Icon(
                              Icons.delete_outline,
                              size: 26,
                            ),
                          ),
                        )
                      : SizedBox()
                ],
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
                      'Track Name* : ',
                      style: TextStyle(color: Colors.black),
                    ),
                    Expanded(
                      child: FocusScope(
                        child: TextFormField(
                          focusNode: FocusNode(canRequestFocus: false),
                          onChanged: (value) {
                            controller.uploadTrackModels[index].track_name =
                                value;
                          },
                          controller:
                              controller.trackNameControllers[index].value,
                          style: TextStyle(color: Color(0xff3B4E5F)),
                          decoration: InputDecoration(
                            hintText: 'Song name',
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
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: ScreenHelper().setheight(60)),
                      child: Text(
                        'Lyric : ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: FocusScope(
                        child: TextFormField(
                          focusNode: FocusNode(canRequestFocus: false),
                          maxLines: 4,
                          onChanged: (value) {
                            controller.uploadTrackModels[index].lyrics = value;
                          },
                          controller:
                              controller.trackLyricControllers[index].value,
                          style: TextStyle(color: Color(0xff3B4E5F)),
                          decoration: InputDecoration(
                            hintText: 'Song lyric',
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
                      'Lyrics by : ',
                      style: TextStyle(color: Colors.black),
                    ),
                    Expanded(
                      child: FocusScope(
                        child: TextFormField(
                          focusNode: FocusNode(canRequestFocus: false),
                          onChanged: (value) {
                            controller.uploadTrackModels[index].lyrics_by =
                                value;
                          },
                          controller:
                              controller.trackLyricsbyControllers[index].value,
                          style: TextStyle(color: Color(0xff3B4E5F)),
                          decoration: InputDecoration(
                            hintText: 'Poet name',
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
                      'Melody by : ',
                      style: TextStyle(color: Colors.black),
                    ),
                    Expanded(
                      child: FocusScope(
                        child: TextFormField(
                          focusNode: FocusNode(canRequestFocus: false),
                          onChanged: (value) {
                            controller.uploadTrackModels[index].melody = value;
                          },
                          controller:
                              controller.trackMelodyControllers[index].value,
                          style: TextStyle(color: Color(0xff3B4E5F)),
                          decoration: InputDecoration(
                            hintText: 'Melodist name',
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
                      'Composer : ',
                      style: TextStyle(color: Colors.black),
                    ),
                    Expanded(
                      child: FocusScope(
                        child: TextFormField(
                          focusNode: FocusNode(canRequestFocus: false),
                          onChanged: (value) {
                            controller.uploadTrackModels[index].composer =
                                value;
                          },
                          controller:
                              controller.trackComposerControllers[index].value,
                          style: TextStyle(color: Color(0xff3B4E5F)),
                          decoration: InputDecoration(
                            hintText: 'Composer name',
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
                      'Featured Artist : ',
                      style: TextStyle(color: Colors.black),
                    ),
                    Expanded(
                      child: FocusScope(
                        child: TextFormField(
                          focusNode: FocusNode(canRequestFocus: false),
                          controller: controller.featController[index].value,
                          style: TextStyle(color: Color(0xff3B4E5F)),
                          decoration: InputDecoration(
                            hintText: 'Featured artist name',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    controller.featedArtists[index].value <= 2
                        ? SizedBox(
                            child: IconButton(
                                onPressed: () {
                                  controller.featedArtists[index].value++;
                                },
                                icon: Icon(Icons.add)))
                        : SizedBox(),
                    SizedBox(
                      width: ScreenHelper().setWidth(5),
                    )
                  ],
                ),
              ),
              controller.featedArtists[index].value == 0
                  ? SizedBox()
                  : Column(
                      children: [
                        Column(
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
                                    'Featured Artist : ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Expanded(
                                    child: FocusScope(
                                      child: TextFormField(
                                        focusNode:
                                            FocusNode(canRequestFocus: false),
                                        controller: controller
                                            .featController1[index].value,
                                        style:
                                            TextStyle(color: Color(0xff3B4E5F)),
                                        decoration: InputDecoration(
                                          hintText: 'Featured artist name',
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
                        controller.featedArtists[index].value >= 2
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: ScreenHelper().setheight(5),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Color(0xff5F6268).withOpacity(0.04),
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
                                          'Featured Artist : ',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Expanded(
                                          child: FocusScope(
                                            child: TextFormField(
                                              focusNode: FocusNode(
                                                  canRequestFocus: false),
                                              controller: controller
                                                  .featController2[index].value,
                                              style: TextStyle(
                                                  color: Color(0xff3B4E5F)),
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Featured artist name',
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
                        controller.featedArtists[index].value == 3
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: ScreenHelper().setheight(5),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Color(0xff5F6268).withOpacity(0.04),
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
                                          'Featured Artist : ',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Expanded(
                                          child: FocusScope(
                                            child: TextFormField(
                                              focusNode: FocusNode(
                                                  canRequestFocus: false),
                                              controller: controller
                                                  .featController3[index].value,
                                              style: TextStyle(
                                                  color: Color(0xff3B4E5F)),
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Featured artist name',
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
                      ],
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
                    controller.pickTrackFile(index);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenHelper().setheight(15),
                        ),
                        SvgPicture.asset('assets/Upload/upload.svg'),
                        SizedBox(
                          height: ScreenHelper().setheight(15),
                        ),
                        controller.isTrackFile[index].value == false
                            ? Text(
                                'Upload Song File (.mp3, .wav)*',
                                style: TextStyle(color: Colors.black),
                              )
                            : Text(
                                '...${controller.trackFiles[index].path.substring(controller.trackFiles[index].path.length - 30)}',
                                style: TextStyle(color: Colors.black),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenHelper().setheight(30),
              ),
              Container(
                width: ScreenHelper.deWidth,
                height: ScreenHelper().setheight(46),
                child: ElevatedButton(
                  child: controller.isUploading[index].value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text('Save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff3B4E5F).withOpacity(0.75),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(ScreenHelper().setRadius(10)),
                    ),
                  ),
                  onPressed: () async {
                    controller.platforms.clear();
                    if (controller.isSpotify.value) {
                      controller.platforms.add('Spotify');
                    }
                    if (controller.isApple.value) {
                      controller.platforms.add('Apple Music');
                    }
                    if (controller.isYoutube.value) {
                      controller.platforms.add('YouTube Music');
                    }
                    if (controller.isAmazon.value) {
                      controller.platforms.add('Amazon Music');
                    }
                    if (controller.isValid(index)) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      'Do you want to upload ${controller.albumNameController.text}?',
                                      style: TextStyle(
                                          fontSize:
                                              ScreenHelper().setRadius(14),
                                          color: Color(0xffFF0055)),
                                    ),
                                    SizedBox(
                                      height: ScreenHelper().setheight(15),
                                    ),
                                    controller.platforms.length != 0
                                        ? Text(
                                            'You choose the -${controller.platforms.toString().substring(1, controller.platforms.toString().length - 1)}- platform${controller.platforms.length == 1 ? '' : '(s)'} to share your Album! By choosing this feature Dangify will be the copyright holder for your Album on -Spotify- and 30% of the income will be allocated to Dangify.',
                                            style: TextStyle(
                                                color: Color(0xff3B4E5F)),
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      height: ScreenHelper().setheight(15),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: ScreenHelper().setWidth(100),
                                          child: TextButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                Color(0xffFF0055)
                                                    .withOpacity(0.75),
                                              )),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                        ),
                                        Spacer(),
                                        Container(
                                          width: ScreenHelper().setWidth(100),
                                          child: TextButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                Color(0xff3B4E5F)
                                                    .withOpacity(0.75),
                                              )),
                                              onPressed: () {
                                                if (controller.isValid(index)) {
                                                  controller.isUploading[index]
                                                      .value = true;
                                                  controller.uploadtrack(index);
                                                  Navigator.of(context).pop();
                                                }
                                              },
                                              child: Text(
                                                'Upload',
                                                style: TextStyle(
                                                    color: Colors.white),
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
          ),
        ),
      );
    });
  }
}
