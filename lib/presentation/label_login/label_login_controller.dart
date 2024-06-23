import 'package:label/domain/models/failure.dart';
import 'package:label/domain/models/receive/login_model.dart';
import 'package:label/domain/models/send/login_model_send.dart';
import 'package:label/domain/models/succes.dart';
import 'package:label/globe_controller.dart';
import 'package:label/presentation/mainscreen/main_screen.dart';
import 'package:label/remote/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LabelLoginController extends GetxController {
  late RepositoryImpl _repo;
  var isLoading = false.obs;
  var isValid = true.obs;
  var authToken = '';
  late GlobeController globeController;
  var logInAttempts = 0.obs;
  CountdownTimerController? timerController;
  var test = 0.obs;
  var endTime = 0.obs;

  final storage = GetStorage();

  @override
  void onInit() async {
    _repo = Get.put(RepositoryImpl());
    globeController = Get.find<GlobeController>();
    logInAttempts.value = storage.read('loginAttempts') ?? 0;

    if (logInAttempts.value == 3 ||
        logInAttempts.value == 6 ||
        logInAttempts.value == 9) {
      isValid.value = false;
    }

    timerController = CountdownTimerController(
      endTime: storage.read('endTime') ?? DateTime.now().millisecondsSinceEpoch,
      onEnd: () {
        isValid.value = true;
      },
    );

    super.onInit();
  }

  void updateLoginAttempts(int newValue) {
    logInAttempts.value = newValue;
    storage.write('loginAttempts', newValue);
  }

  void updateTimer(var value) {
    storage.write('endTime', value);
  }

  toggleTimer() {
    if (logInAttempts.value == 3) {
      timerController!.endTime = DateTime.now().millisecondsSinceEpoch + 60000;
      storage.write('endTime', DateTime.now().millisecondsSinceEpoch + 60000);

      isValid.value = false;
    }
    if (logInAttempts.value == 6) {
      timerController!.endTime = DateTime.now().millisecondsSinceEpoch + 300000;
      storage.write('endTime', DateTime.now().millisecondsSinceEpoch + 300000);

      print(storage.read('endTime'));

      isValid.value = false;
    }
    if (logInAttempts.value == 9) {
      timerController!.endTime =
          DateTime.now().millisecondsSinceEpoch + 18000000;
      storage.write(
          'endTime', DateTime.now().millisecondsSinceEpoch + 18000000);

      isValid.value = false;
    }
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // final ArtistDataController artistDataController =
  //     Get.put(ArtistDataController());
  LoginModelSend loginModelSend = LoginModelSend();

  login(context) async {
    if ((loginModelSend.username == null && loginModelSend.password == null) ||
        loginModelSend.password == null) {
      Fluttertoast.showToast(msg: 'Username and Password are required.');
    } else {
      isLoading.value = true;
      Either<Failure, Success> res = await _repo.labelLogin(loginModelSend);

      res.fold(
        (l) async {
          isLoading.value = false;
          logInAttempts.value++;
          updateLoginAttempts(logInAttempts.value);
          // logInAttempts.value++;
          toggleTimer();

          update();
        },
        (r) async {
          LoginModel loginModel = r.data;
          globeController.saveType(2);
          print('Received token: ${loginModel.token}');
          globeController.accessToken = loginModel.token;
          globeController.saveTokenAndUser(LoginModel(token: loginModel.token));
          isLoading.value = false;
          logInAttempts.value = 0;
          update();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MainScreen(),
            ),
          );
        },
      );
    }
  }
}
