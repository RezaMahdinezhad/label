import 'package:label/globe_controller.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  late GlobeController globeController;
  bool hasToken = false;

  @override
  void onInit() async {
    super.onInit();
    globeController = Get.find<GlobeController>();
    await checkLogIn();
    // hasToken = globeController.checkHasToken();
  }

  checkLogIn() async {
    await globeController.loadTokenAndUser();
    hasToken = globeController.checkHasToken();
  }

  // checkHasToken() {
  //   final box = GetStorage();
  //   bool hasToken = box.read('has_token') ?? false;
  //   return hasToken;
  // }
}
