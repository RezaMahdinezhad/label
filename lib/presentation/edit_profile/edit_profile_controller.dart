import 'package:label/domain/models/failure.dart';
import 'package:label/domain/models/send/edit_profile_model_send.dart';
import 'package:label/domain/models/send/edit_user_model_send.dart';
import 'package:label/domain/models/succes.dart';
import 'package:label/domain/repository/remote/endpoint.dart';
import 'package:label/globe_controller.dart';
import 'package:label/presentation/profile/profile_controller.dart';
import 'package:label/remote/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';

class EditProfileController extends GetxController {
  late GlobeController globeController;
  late RepositoryImpl _repo;
  late ProfileController profileController;
  var isSwitched = false.obs;
  PaletteGenerator? paletteGenerator;
  var color1 = Colors.black.obs;
  var color2 = Colors.black.obs;

  var isEditingProfile = false.obs;

  String userName = '';
  String email = '';
  String? bio;
  String? instagram;
  String? youtube;
  String? facebook;
  String usercolor1 = '';
  String usercolor2 = '';

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController youtubeController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController usercolor1Controller = TextEditingController();
  final TextEditingController usercolor2Controller = TextEditingController();

  EditProfileModelSend editProfileModelSend = EditProfileModelSend();
  EditProfileModelSend editProfileModelSendExisting = EditProfileModelSend();
  EditUserModelSend editUserModelSend = EditUserModelSend();

  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }

  bool isHexColor1Valid() {
    if (usercolor1Controller.text == '') {
      usercolor1Controller.text = '212121';
      return true;
    } else if (usercolor1Controller.text != '' &&
        !usercolor1Controller.text.isHexadecimal) {
      Fluttertoast.showToast(msg: 'Invalid hex color code.');
      return false;
    }
    return true;
  }

  bool isHexColor2Valid() {
    if (usercolor2Controller.text == '') {
      usercolor2Controller.text = '212121';
      return true;
    } else if (usercolor2Controller.text != '' &&
        !usercolor2Controller.text.isHexadecimal) {
      Fluttertoast.showToast(msg: 'Invalid hex color code.');
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    super.onInit();
    _repo = Get.put(RepositoryImpl());
    profileController = Get.find<ProfileController>();

    userNameController.text =
        profileController.userdataModel.username.toString();
    emailController.text = profileController.userdataModel.email.toString();
    bio = profileController.profileModel.description.toString();
    instagram = profileController.profileModel.instagram_url.toString();
    youtube = profileController.profileModel.youtube_url.toString();
    facebook = profileController.profileModel.facebook_url.toString();
    usercolor1Controller.text =
        profileController.profileModel.color1.toString();
    usercolor2Controller.text =
        profileController.profileModel.color2.toString();

    bioController.text = bio == 'null' ? '' : bio!;
    instagramController.text = instagram == 'null' ? '' : instagram!;
    youtubeController.text = youtube == 'null' ? '' : youtube!;
    facebookController.text = facebook == 'null' ? '' : facebook!;

    globeController = Get.find<GlobeController>();
    // editProfile(context);
    updatePaletteGenerator(
        EndPoint.base + profileController.userdataModel.picture_url.toString());
  }

  bool isValid() {
    if (!emailController.text.contains('@') ||
        !emailController.text.contains('.') ||
        emailController.text.contains(
            "(?:[a-z0-9!#%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#%&'*+/=?^_`{|}~-]+)*|'(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*')@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])")) {
      Fluttertoast.showToast(msg: 'Try to insert valid email address');
      return false;
    } else if (instagramController.text != '' &&
        !instagramController.text.contains('https://www.instagram.com/')) {
      Fluttertoast.showToast(
          msg: 'Your Instagram url must contains https://www.instagram.com/');
      return false;
    } else if (youtubeController.text != '' &&
        !youtubeController.text.contains('https://www.youtube.com/channel/')) {
      Fluttertoast.showToast(
          msg:
              'Your Youtube url must contains https://www.youtube.com/channel/');
      return false;
    } else if (facebookController.text != '' &&
        !facebookController.text.contains('https://www.facebook.com/')) {
      Fluttertoast.showToast(
          msg: 'Your Facebook url must contains https://www.facebook.com/');
      return false;
    } else if (isSwitched.value && !isHexColor1Valid()) {
      return false;
    } else if (isSwitched.value && !isHexColor2Valid()) {
      return false;
    }
    return true;
  }

  editProfile(context) async {
    isEditingProfile.value = true;
    Either<Failure, Success> res = await _repo.editArtistData(
        globeController.accessToken.toString(),
        editProfileModelSend,
        editProfileModelSendExisting);

    res.fold((l) async {
      isEditingProfile.value = false;
      Fluttertoast.showToast(msg: l.message);

      update();
    }, (r) async {
      profileController.getProfileData();
      isEditingProfile.value = false;
      Fluttertoast.showToast(msg: 'Profile edited successfully.');

      Navigator.of(context).pop();
      update();
    });
  }

  Future<void> updatePaletteGenerator(String? artUri) async {
    if (artUri != null) {
      paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(artUri),
        maximumColorCount: 500,
      );
      color1.value = paletteGenerator!.lightVibrantColor!.color;
      color2.value = paletteGenerator!.darkVibrantColor!.color;
    } else {
      paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(''),
        maximumColorCount: 4000,
      );
    }
  }
}
