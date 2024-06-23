import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:label/base_controller.dart';
import 'package:label/domain/models/receive/login_model.dart';
import 'package:label/presentation/artist_screen/artist_controller.dart';
import 'package:label/presentation/edit_profile/edit_profile_controller.dart';
import 'package:label/presentation/login/login_controller.dart';
import 'package:label/presentation/preview/preview_controller.dart';
import 'package:label/presentation/profile/profile_controller.dart';
import 'package:label/presentation/request/request_controller.dart';
import 'package:label/presentation/statics/statics_controller.dart';
import 'package:label/presentation/trackchart/track_chart_controller.dart';
import 'package:label/presentation/upload/album_controller.dart';
import 'package:label/presentation/upload/review/review_controller.dart';
import 'package:label/presentation/upload/upload_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GlobeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  String? accessToken;

  double _uploadProgressValue = 0;

  double get uploadProgressValue => _uploadProgressValue;

  LoginModel loginModel = LoginModel();

  final box = GetStorage();

  bool hasToken = false;

  //type 1 = artist type 2 = label
  RxInt loginType = 0.obs;
  saveType(int value) {
    loginType.value = value;
    box.write('loginType', value);
  }

  loadType() {
    loginType.value = box.read('loginType') ?? 0;
  }

  setUploadProgressValue(value) {
    _uploadProgressValue = value;
    update();
  }

  checkHasToken() {
    // final box = GetStorage();
    hasToken = box.read('has_token') ?? false;
    return hasToken;
  }

  saveTokenAndUser(LoginModel loginModel) {
    // final box = GetStorage();
    box.write('accessToken', accessToken);
    box.write('token', loginModel.token);
    box.write('user_name', loginModel.username);
    box.write('name', loginModel.name);
    box.write('email', loginModel.email);
    box.write('has_token', true);
  }

  LoginModel loadTokenAndUser() {
    // final box = GetStorage();
    accessToken = box.read('accessToken');
    loginModel.token = box.read('token');
    loginModel.username = box.read('user_name');
    loginModel.name = box.read('name');
    loginModel.email = box.read('email');
    hasToken = box.read('has_token');

    return loginModel;
  }

  removeTokenAndUser() {
    // final box = GetStorage();
    box.remove('token');
    box.remove('accessToken');
    box.remove('user_name');
    box.remove('name');
    box.remove('email');
    box.write('has_token', false);
  }

  logOut() {
    accessToken = '';
    loginModel.name = '';
    loginModel.username = '';
    loginModel.email = '';
    loginModel.token = '';
    hasToken = false;
    box.write('accessToken', '');
    box.write('token', '');
    box.write('user_name', '');
    box.write('name', '');
    box.write('email', '');
    box.write('has_token', false);

    removeTokenAndUser();
    // Get.find<BaseController>().update();
    Get.delete<ArtistLoginController>();
    // Get.delete<GlobeController>();
    Get.delete<BaseController>();
    Get.delete<ArtistDataController>();
    Get.delete<EditProfileController>();
    Get.delete<PreviewController>();
    Get.delete<ProfileController>();
    Get.delete<RequestController>();
    Get.delete<StaticsController>();
    Get.delete<TrackChartController>();
    Get.delete<ReviewController>();
    Get.delete<UploadAlbumController>();
    Get.delete<UploadController>();
  }
}
