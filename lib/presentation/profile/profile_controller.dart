import 'dart:developer';
import 'dart:io';

import 'package:label/domain/models/failure.dart';
import 'package:label/domain/models/receive/profile_model.dart';
import 'package:label/domain/models/receive/user_data_model.dart';
import 'package:label/domain/models/succes.dart';
import 'package:label/globe_controller.dart';
import 'package:label/remote/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  late GlobeController globeController;
  late RepositoryImpl _repo;

  late ProfileModel profileModel;
  late UserdataModel userdataModel;

  String name = '';
  String email = '';
  String bio = '';
  String instagram = '';
  String youtube = '';
  String facebook = '';

  String color1 = '';
  String color2 = '';

  var isLoading = true;

  int descriptionMaxLines = 6;

  String description = 'Show More';

  final picker = ImagePicker();

  File? _imageCover;
  File? _imageProfile;

  get imageCover => _imageCover;
  get imageProfile => _imageProfile;

  setImageCover(File? image) {
    _imageCover = image;
    update();
  }

  setImageProfile(File? image) {
    _imageProfile = image;
    update();
  }

  void getImage(BuildContext context, ImageSource source, bool isCover) async {
    final pickedFile =
        await picker.pickImage(source: source, maxHeight: 1000, maxWidth: 1000);

    File? croppedImage;
    if (pickedFile != null) {
      croppedImage = await cropImage(pickedFile.path);
    }

    if (croppedImage != null) {
      isCover
          ? setImageCover(File(croppedImage.path))
          : setImageProfile(File(croppedImage.path));
      uploadImage(File(croppedImage.path), isCover);
    } else {
      log('aks nashodddd');
    }
  }

  Future<File> cropImage(String imagePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imagePath,
        cropStyle: CropStyle.rectangle,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: '',
              toolbarColor: Color(0xff212121),
              toolbarWidgetColor: Colors.white,
              activeControlsWidgetColor: Color(0xffFF0055),
              lockAspectRatio: false),
          IOSUiSettings(
            title: '',
          )
        ]);

    return File(croppedFile!.path);
  }

  uploadImage(File file, bool isCover) async {
    // final mimeTypeData = lookupMimeType(path)?.split('/');

    // var uri = isCover
    //     ? Uri.parse(EndPoint.base + EndPoint.upCover)
    //     : Uri.parse(EndPoint.base + EndPoint.upPhoto);
    // String field = isCover ? 'cover_url' : 'picture_url';
    Either<Failure, Success> res;

    if (isCover) {
      res = await _repo.uploadCoverPhoto(file);
    } else {
      res = await _repo.uploadProfilePhoto(file);
    }

    res.fold((l) async {
      Fluttertoast.showToast(msg: l.message);
    }, (r) {
      Fluttertoast.showToast(msg: r.data);
    });
  }

  Future<bool> deleteCoverImage() async {
    Either<Failure, Success> res = await _repo.deleteCoverImage();

    return res.fold((l) async {
      Fluttertoast.showToast(msg: l.message);
      return Future.value(false);
    }, (r) {
      userdataModel.cover_url = null;
      return Future.value(true);
    });
  }

  String formatNumber(int number) {
    if (number >= 1000 && number < 1000000) {
      double result = number / 1000.0;
      return '${result.toStringAsFixed(1)}K';
    } else if (number >= 1000000) {
      double result = number / 1000000;
      return '${result.toStringAsFixed(1)}M';
    } else {
      return number.toString();
    }
  }

  @override
  void onInit() {
    super.onInit();
    _repo = Get.put(RepositoryImpl());

    globeController = Get.find<GlobeController>();
    getProfileData();
  }

  Future<void> getProfileData() async {
    try {
      Either<Failure, Success> result = await _repo.fetchArtistProfileData(
        globeController.accessToken.toString(),
      );
      result.fold(
        (failure) {
          print('Failed to fetch artist profileee data: ${failure.message}');
        },
        (success) {
          profileModel = ProfileModel.fromMap(success.data['data']);
          userdataModel = UserdataModel.fromMap(success.data['user_data']);
          name = userdataModel.name ?? '';
          email = userdataModel.email ?? '';

          bio = profileModel.description ?? '';
          instagram = profileModel.instagram_url ?? '';
          youtube = profileModel.youtube_url ?? '';
          facebook = profileModel.facebook_url ?? '';

          color1 = profileModel.color1 ?? '';
          color2 = profileModel.color2 ?? '';
          isLoading = false;
          update();
        },
      );
    } catch (error) {
      print('Error occurred while fetching artist profile data: $error');
    }
  }
}
