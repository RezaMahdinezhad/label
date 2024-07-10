import 'dart:developer';
import 'dart:io';

import 'package:label/domain/models/failure.dart';
import 'package:label/domain/models/receive/genre_model.dart';
import 'package:label/domain/models/receive/language_model.dart';
import 'package:label/domain/models/send/upload_track_model_send.dart';
import 'package:label/domain/models/succes.dart';
import 'package:label/globe_controller.dart';
import 'package:label/presentation/upload/review/review_controller.dart';
import 'package:label/remote/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UploadController extends GetxController {
  late GlobeController globeController;
  late RepositoryImpl _repo;
  late ReviewController reviewController;

  var isloading = true.obs;
  var isUploadPage = true.obs;
  var isSingle = true.obs;
  var isGenreOther = false.obs;
  var islanguageOther = false.obs;

  var isImageFile = false.obs;
  var isTrackFile = false.obs;

  var isUploading = false.obs;

  var featedArtists = 0.obs;
  var albulmTracks = 1.obs;

  var isShareOtherPlatform = false.obs;

  List<String> platforms = <String>[].obs;
  List<String> feats = <String>[].obs;

  UploadTrackModel uploadTrackModel = UploadTrackModel();

  List<GenreModel> genreModel = [];
  List<LanguageModel> languageModel = [];

  var isSpotify = false.obs;
  var isApple = false.obs;
  var isYoutube = false.obs;
  var isAmazon = false.obs;
  var isInstagram = false.obs;
  var isFacebook = false.obs;

  final TextEditingController artistNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final TextEditingController melodyController = TextEditingController();
  final TextEditingController lyricController = TextEditingController();
  final TextEditingController lyricByController = TextEditingController();
  final TextEditingController producedController = TextEditingController();
  final TextEditingController composerController = TextEditingController();
  final TextEditingController genereController = TextEditingController();
  final TextEditingController languageController = TextEditingController();

  final TextEditingController featController = TextEditingController();
  final TextEditingController featController1 = TextEditingController();
  final TextEditingController featController2 = TextEditingController();
  final TextEditingController featController3 = TextEditingController();

  final picker = ImagePicker();

  File? croppedImage;
  File? trackFile;

  PlatformFile? file;

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

  @override
  void onInit() {
    super.onInit();

    _repo = Get.put(RepositoryImpl());
    globeController = Get.find<GlobeController>();
    reviewController = Get.put(ReviewController());
    getLanguage();
    getGenre();
  }

  bool isValid() {
    if (globeController.loginType.value != 1) {
      if (artistNameController.text == '') {
        Fluttertoast.showToast(msg: 'Artist name field is required.');
        return false;
      }
    }
    if (nameController.text == '') {
      Fluttertoast.showToast(msg: 'Track name field is required.');
      return false;
    }
    if (isGenreOther.value && genereController.text == '') {
      Fluttertoast.showToast(msg: 'Track genre field is required.');
      return false;
    }
    if (islanguageOther.value && languageController.text == '') {
      Fluttertoast.showToast(msg: 'Track language field is required.');
      return false;
    }
    if (!isImageFile.value) {
      Fluttertoast.showToast(msg: 'Track cover file is required.');
      return false;
    }
    if (!isTrackFile.value) {
      Fluttertoast.showToast(msg: 'Track file is required.');
      return false;
    }
    return true;
  }

  void getImage(BuildContext context, ImageSource source, bool isCover) async {
    isImageFile.value = false;

    final pickedFile =
        await picker.pickImage(source: source, maxHeight: 1000, maxWidth: 1000);

    if (pickedFile != null) {
      croppedImage = await cropImage(pickedFile.path);
      isImageFile.value = true;
    }

    if (croppedImage != null) {
      isCover
          ? setImageCover(File(croppedImage!.path))
          : setImageProfile(File(croppedImage!.path));
      isImageFile.value = true;
      // uploadImage(File(croppedImage.path), isCover);
    } else {
      log('aks track nashodddd');
    }
  }

  Future<File> cropImage(String imagePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        sourcePath: imagePath,
        cropStyle: CropStyle.rectangle,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: '',
              toolbarColor: Color(0xff212121),
              toolbarWidgetColor: Colors.white,
              activeControlsWidgetColor: Color(0xffFF0055),
              lockAspectRatio: true),
          IOSUiSettings(
            title: '',
            aspectRatioPickerButtonHidden: true,
            aspectRatioLockEnabled: true,
          )
        ]);

    return File(croppedFile!.path);
  }

  pickTrackFile() async {
    isTrackFile.value = false;

    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = result.files.first;
      trackFile = File(file!.path!);
      isTrackFile.value = true;
    } else {}
  }

  getLanguage() async {
    Either<Failure, Success> res =
        await _repo.getLanguage(globeController.accessToken.toString());

    res.fold((l) async {
      update();
    }, (r) async {
      final language = r.data['language'];
      languageModel.clear();
      for (var item in language) {
        languageModel.add(LanguageModel.fromMap(item));
      }
      uploadTrackModel.language = languageModel[0].id.toString();
      update();
    });
  }

  getGenre() async {
    Either<Failure, Success> res =
        await _repo.getGenres(globeController.accessToken.toString());

    res.fold((l) async {
      update();
    }, (r) async {
      final genres = r.data['genres'];
      genreModel.clear();
      for (var item in genres) {
        genreModel.add(GenreModel.fromMap(item));
      }
      uploadTrackModel.genre_id = genreModel[0].id;
      isloading.value = false;
      update();
    });
  }

  uploadtrack() async {
    isSingle.value ? uploadTrackModel.is_album = 0 : 1;

    isSpotify.value ? uploadTrackModel.spotify = 1 : 0;
    isApple.value ? uploadTrackModel.apple_music = 1 : 0;
    isYoutube.value ? uploadTrackModel.youtube_music = 1 : 0;
    isAmazon.value ? uploadTrackModel.amazon_music = 1 : 0;
    isInstagram.value ? uploadTrackModel.instagram = 1 : 0;
    isFacebook.value ? uploadTrackModel.facebook = 1 : 0;
    feats.clear();

    if (featController.text.isNotEmpty) {
      feats.add(featController.text);
    }

    if (featController1.text.isNotEmpty) {
      feats.add(featController1.text);
    }

    if (featController2.text.isNotEmpty) {
      feats.add(featController2.text);
    }

    if (featController3.text.isNotEmpty) {
      feats.add(featController3.text);
    }

    uploadTrackModel.sec_artists_name =
        feats.toString().substring(1, feats.toString().length - 1);
    Either<Failure, Success> res = await _repo.uploadTrack(
        globeController.accessToken.toString(),
        uploadTrackModel,
        croppedImage!,
        trackFile!);

    res.fold((l) async {
      isUploading.value = false;
      Fluttertoast.showToast(msg: 'Failed to Upload files, Please try again.');

      update();
    }, (r) async {
      Fluttertoast.showToast(
          msg: 'Track ${uploadTrackModel.track_name} Uploaded Successfully.');
      rebuildTrackPage();
      update();
    });
  }

  uploadLabeltrack() async {
    isSingle.value ? uploadTrackModel.is_album = 0 : 1;

    isSpotify.value ? uploadTrackModel.spotify = 1 : 0;
    isApple.value ? uploadTrackModel.apple_music = 1 : 0;
    isYoutube.value ? uploadTrackModel.youtube_music = 1 : 0;
    isAmazon.value ? uploadTrackModel.amazon_music = 1 : 0;
    isInstagram.value ? uploadTrackModel.instagram = 1 : 0;
    isFacebook.value ? uploadTrackModel.facebook = 1 : 0;
    feats.clear();

    if (featController.text.isNotEmpty) {
      feats.add(featController.text);
    }

    if (featController1.text.isNotEmpty) {
      feats.add(featController1.text);
    }

    if (featController2.text.isNotEmpty) {
      feats.add(featController2.text);
    }

    if (featController3.text.isNotEmpty) {
      feats.add(featController3.text);
    }

    uploadTrackModel.sec_artists_name =
        feats.toString().substring(1, feats.toString().length - 1);
    Either<Failure, Success> res = await _repo.uploadLabelTrack(
        artistNameController.text, uploadTrackModel, croppedImage!, trackFile!);

    res.fold((l) async {
      isUploading.value = false;
      Fluttertoast.showToast(msg: 'Failed to Upload files, Please try again.');

      update();
    }, (r) async {
      Fluttertoast.showToast(
          msg: 'Track ${uploadTrackModel.track_name} Uploaded Successfully.');
      rebuildTrackPage();
      update();
    });
  }

  rebuildTrackPage() async {
    await Future.delayed(Duration(seconds: 1), () {
      feats = [];
      nameController.text = '';
      tagController.text = '';
      melodyController.text = '';
      lyricController.text = '';
      lyricByController.text = '';
      composerController.text = '';
      producedController.text = '';
      genereController.text = '';
      languageController.text = '';
      featController.text = '';
      featController1.text = '';
      featController2.text = '';
      featController3.text = '';

      isGenreOther.value = false;
      islanguageOther.value = false;
      featedArtists.value = 0;
      isImageFile.value = false;
      isTrackFile.value = false;
      isUploading.value = false;
      isSpotify.value = false;
      isApple.value = false;
      isYoutube.value = false;
      isAmazon.value = false;
      isInstagram.value = false;
      isFacebook.value = false;
    });
  }
}
