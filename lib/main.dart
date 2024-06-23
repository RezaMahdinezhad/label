import 'package:label/base_controller.dart';
import 'package:label/common/helper/screen_helper.dart';
import 'package:label/globe_controller.dart';
import 'package:label/presentation/initial_page/initial_page.dart';
import 'package:label/presentation/login/login.dart';
import 'package:label/presentation/mainscreen/main_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // final globeController = Get.put(GlobeController());
  // final controller = Get.put(BaseController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final globeController = Get.put(GlobeController());
  final controller = Get.put(BaseController());

  @override
  Widget build(BuildContext context) {
    ScreenHelper().initScreenUtil(context);
    ScreenHelper.dHeight = MediaQuery.of(context).size.height;
    ScreenHelper.deWidth = MediaQuery.of(context).size.width;
    globeController.loadType();
    return GetBuilder<BaseController>(builder: (_) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: controller.hasToken ? MainScreen() : InitialPage(),
      );
    });
  }
}
