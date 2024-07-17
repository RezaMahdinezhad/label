import 'dart:developer';
import 'dart:io';

import 'package:label/domain/models/failure.dart';
import 'package:label/domain/models/receive/genre_model.dart';
import 'package:label/domain/models/receive/language_model.dart';
import 'package:label/domain/models/send/upload_track_model_send.dart';
import 'package:label/domain/models/succes.dart';
import 'package:label/globe_controller.dart';
import 'package:label/remote/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UploadAlbumController extends GetxController {
  late GlobeController globeController;
  late RepositoryImpl _repo;

  List<Widget> trackWidgets = <Widget>[].obs;

  var isloading = true.obs;
  var isUploadPage = true.obs;
  var isSingle = true.obs;
  var isGenreOther = false.obs;
  var islanguageOther = false.obs;

  var isImageFile = false.obs;

  // var isUploading = false.obs;

  // var featedArtists = 0.obs;
  // var albulmTracks = 1.obs;

  var isShareOtherPlatform = false.obs;

  // UploadTrackModel uploadTrackModel = UploadTrackModel();

  List<GenreModel> genreModel = [];
  List<LanguageModel> languageModel = [];

  var isSpotify = false.obs;
  var isApple = false.obs;
  var isYoutube = false.obs;
  var isAmazon = false.obs;
  var isInstagram = false.obs;
  var isFacebook = false.obs;

  var trackLength = 30.obs;
  List<String> platforms = <String>[].obs;
  List<String> feats = <String>[].obs;

  final TextEditingController albumNameController = TextEditingController();
  final TextEditingController artistNameController = TextEditingController();
  final TextEditingController genereController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final TextEditingController producedController = TextEditingController();

  List<Rx<TextEditingController>> trackNameControllers =
      <Rx<TextEditingController>>[].obs;
  List<Rx<TextEditingController>> trackLyricControllers =
      <Rx<TextEditingController>>[].obs;
  List<Rx<TextEditingController>> trackLyricsbyControllers =
      <Rx<TextEditingController>>[].obs;
  List<Rx<TextEditingController>> trackMelodyControllers =
      <Rx<TextEditingController>>[].obs;
  List<Rx<TextEditingController>> trackComposerControllers =
      <Rx<TextEditingController>>[].obs;
  List<Rx<TextEditingController>> trackFeatedArtistsControllers =
      <Rx<TextEditingController>>[].obs;

  List<Rx<TextEditingController>> featController =
      <Rx<TextEditingController>>[].obs;
  List<Rx<TextEditingController>> featController1 =
      <Rx<TextEditingController>>[].obs;
  List<Rx<TextEditingController>> featController2 =
      <Rx<TextEditingController>>[].obs;
  List<Rx<TextEditingController>> featController3 =
      <Rx<TextEditingController>>[].obs;

  List<File> trackFiles = <File>[].obs;
  List<RxBool> isTrackFile = <RxBool>[].obs;
  List<RxBool> isUploading = <RxBool>[].obs;

  rebuildAlbumPage() async {
    for (var item in trackNameControllers) {
      item.value.text = '';
    }
    for (var item in trackLyricControllers) {
      item.value.text = '';
    }
    for (var item in trackLyricsbyControllers) {
      item.value.text = '';
    }
    for (var item in trackMelodyControllers) {
      item.value.text = '';
    }
    for (var item in trackComposerControllers) {
      item.value.text = '';
    }
    for (var item in featController) {
      item.value.text = '';
    }
    for (var item in featController1) {
      item.value.text = '';
    }
    for (var item in featController2) {
      item.value.text = '';
    }
    for (var item in featController3) {
      item.value.text = '';
    }
    for (var item in trackFeatedArtistsControllers) {
      item.value.text = '';
    }
    for (var item in isTrackFile) {
      item.value = false;
    }
    for (var item in featedArtists) {
      item.value = 0;
    }
    isImageFile.value = false;
    isShareOtherPlatform.value = false;
    genereController.text = '';
    languageController.text = '';

    trackWidgets.clear();
    feats.clear();
    albumNameController.text = '';
    tagController.text = '';
    producedController.text = '';

    isSpotify.value = false;
    isApple.value = false;
    isYoutube.value = false;
    isAmazon.value = false;
    isInstagram.value = false;
    isFacebook.value = false;
  }

  UploadTrackModel uploadTrackModel = UploadTrackModel();

  List<UploadTrackModel> uploadTrackModels = [];

  List<RxInt> featedArtists = <RxInt>[].obs;

  buildTrackWidgetControllers() {
    uploadTrackModels = List.generate(
      trackLength.value,
      (index) {
        return UploadTrackModel();
      },
    );

    isTrackFile = List.generate(
      trackLength.value,
      (index) {
        return false.obs;
      },
    );
    isUploading = List.generate(
      trackLength.value,
      (index) {
        return false.obs;
      },
    );
    featedArtists = List.generate(
      trackLength.value,
      (index) {
        return 0.obs;
      },
    );
    featController = List.generate(
      trackLength.value,
      (index) {
        return TextEditingController().obs;
      },
    );
    featController1 = List.generate(
      trackLength.value,
      (index) {
        return TextEditingController().obs;
      },
    );
    featController2 = List.generate(
      trackLength.value,
      (index) {
        return TextEditingController().obs;
      },
    );
    featController3 = List.generate(
      trackLength.value,
      (index) {
        return TextEditingController().obs;
      },
    );
    trackNameControllers = List.generate(
      trackLength.value,
      (index) {
        return TextEditingController().obs;
      },
    );
    trackLyricControllers = List.generate(
      trackLength.value,
      (index) {
        return TextEditingController().obs;
      },
    );
    trackLyricsbyControllers = List.generate(
      trackLength.value,
      (index) {
        return TextEditingController().obs;
      },
    );
    trackMelodyControllers = List.generate(
      trackLength.value,
      (index) {
        return TextEditingController().obs;
      },
    );
    trackComposerControllers = List.generate(
      trackLength.value,
      (index) {
        return TextEditingController().obs;
      },
    );
    trackFeatedArtistsControllers = List.generate(
      trackLength.value,
      (index) {
        return TextEditingController().obs;
      },
    );
    trackFiles = List.generate(
      trackLength.value,
      (index) {
        return File('');
      },
    );
  }

  final picker = ImagePicker();

  File? croppedImage;
  // List<File> trackFile = [];

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
    buildTrackWidgetControllers();

    getLanguage();
    getGenre();
  }

  bool isValid(int index) {
    if (globeController.loginType.value == 2) {
      if (artistNameController.text == '') {
        Fluttertoast.showToast(msg: 'Artist name field is required.');
        return false;
      }
    }
    if (albumNameController.text == '') {
      Fluttertoast.showToast(msg: 'Album name field is required.');
      return false;
    }
    if (trackNameControllers[index].value.text == '') {
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
      Fluttertoast.showToast(msg: 'Cover file is required.');
      return false;
    }
    if (!isTrackFile[index].value) {
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

  pickTrackFile(int index) async {
    isTrackFile[index].value = false;

    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = result.files.first;
      trackFiles[index] = File(file!.path!);
      isTrackFile[index].value = true;
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

  uploadtrack(int index) async {
    uploadTrackModels[index].is_album = 1;
    uploadTrackModels[index].album_name = uploadTrackModel.album_name;

    uploadTrackModels[index].genre_id = uploadTrackModel.genre_id;
    uploadTrackModels[index].genre_name = uploadTrackModel.genre_name;
    uploadTrackModels[index].language = uploadTrackModel.language;
    uploadTrackModels[index].track_tag = uploadTrackModel.track_tag;
    uploadTrackModels[index].produced_by = uploadTrackModel.produced_by;
    uploadTrackModels[index].cover = uploadTrackModel.cover;

    isSpotify.value ? uploadTrackModels[index].spotify = 1 : 0;
    isApple.value ? uploadTrackModels[index].apple_music = 1 : 0;
    isYoutube.value ? uploadTrackModels[index].youtube_music = 1 : 0;
    isAmazon.value ? uploadTrackModels[index].amazon_music = 1 : 0;
    isInstagram.value ? uploadTrackModels[index].instagram = 1 : 0;
    isFacebook.value ? uploadTrackModels[index].facebook = 1 : 0;

    feats.clear();

    if (featController[index].value.text.isNotEmpty) {
      feats.add(featController[index].value.text);
    }

    if (featController1[index].value.text.isNotEmpty) {
      feats.add(featController1[index].value.text);
    }

    if (featController2[index].value.text.isNotEmpty) {
      feats.add(featController2[index].value.text);
    }

    if (featController3[index].value.text.isNotEmpty) {
      feats.add(featController3[index].value.text);
    }

    uploadTrackModels[index].sec_artists_name =
        feats.toString().substring(1, feats.toString().length - 1);
    isUploading[index].value = true;
    if (globeController.loginType.value == 1) {
      Either<Failure, Success> res = await _repo.uploadTrack(
          globeController.accessToken.toString(),
          uploadTrackModels[index],
          croppedImage!,
          trackFiles[index]);

      res.fold((l) async {
        isUploading[index].value = false;
        Fluttertoast.showToast(
            msg: 'Failed to Upload files, Please try again.');

        update();
      }, (r) async {
        isUploading[index].value = false;

        Fluttertoast.showToast(
            msg:
                'Track ${uploadTrackModels[index].track_name} for Album ${uploadTrackModels[index].album_name}  Uploaded Successfully.');
        // rebuildTrackPage();
        update();
      });
    } else {
      Either<Failure, Success> res = await _repo.uploadLabelTrack(
          artistNameController.text,
          uploadTrackModels[index],
          croppedImage!,
          trackFiles[index]);

      res.fold((l) async {
        isUploading[index].value = false;
        Fluttertoast.showToast(
            msg: 'Failed to Upload files, Please try again.');

        update();
      }, (r) async {
        isUploading[index].value = false;

        Fluttertoast.showToast(
            msg:
                'Track ${uploadTrackModels[index].track_name} for Album ${uploadTrackModels[index].album_name}  Uploaded Successfully.');
        // rebuildTrackPage();
        update();
      });
    }
  }
}
