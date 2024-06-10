import 'package:label/common/statics/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScreenHelper {
  factory ScreenHelper() {
    return _singleton;
  }

  ScreenHelper._internal();

  static final ScreenHelper _singleton = ScreenHelper._internal();

  late Locale _currentlocale;

  // void initialize(BuildContext context) {
  //   ScreenUtil.init(
  //     context,
  //     designSize: const Size(360, 690),
  //     orientation: Orientation.portrait,
  //     minTextAdapt: true,
  //   );

  // }
  void initScreenUtil(BuildContext context) {
    double defaultWidth = 375;
    double defaultHeight = 812;
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    if (deviceType == DeviceScreenType.desktop) {
      defaultWidth = 1200;
      defaultHeight = 2290;
    } else if (deviceType == DeviceScreenType.desktop) {
      defaultWidth = 700;
      defaultHeight = 1100;
    } else if (deviceType == DeviceScreenType.desktop) {
      defaultWidth = 428;
      defaultHeight = 926;
    } else if (deviceType == DeviceScreenType.watch) {
      defaultWidth = 450;
      defaultHeight = 450;
    }
    ScreenUtil.init(
      context,
      designSize: Size(
          defaultWidth, defaultHeight), // Size(360, 690), //Size(700, 1100),
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }

  static double statusBar = 0;
  static double dHeight = 0;
  static double deWidth = 0;

  void setLocale(Locale locale) {
    _currentlocale = locale;
  }

  double setWidth(double value) {
    return value.w;
  }

  void setStatusBar(double value) {
    statusBar = value;
  }

  double setheight(double value) {
    return value.w; //.h;
  }

  double getScaleHeight() {
    var scaleHeight = ScreenUtil().scaleHeight;

    return scaleHeight;
  }

  ScaleHeight getScaleHeightType() {
    var scaleHeight = ScreenUtil().scaleHeight;

    if (scaleHeight < 1) {
      return ScaleHeight.veryLow;
    } else if (scaleHeight >= 1 && scaleHeight < 1.10) {
      return ScaleHeight.low;
    } else if (scaleHeight >= 1.10 && scaleHeight < 1.30) {
      return ScaleHeight.medium;
    } else if (scaleHeight >= 1.30) {
      return ScaleHeight.high;
    }

    return ScaleHeight.medium;
  }

  double setRadius(double value) {
    return value.w; //.r;
  }

  double setFont(double value) {
    return value; //.sp;
  }

  TextDirection getDirection() {
    switch (_currentlocale.languageCode.toLowerCase()) {
      case 'fa':
        return TextDirection.rtl;
      case 'en':
        return TextDirection.ltr;

      default:
        return TextDirection.ltr;
    }
  }

  TextDirection getLTRDirection() {
    return TextDirection.ltr;
  }

  TextAlign getTextAlign() {
    switch (_currentlocale.languageCode.toLowerCase()) {
      case 'fa':
        return TextAlign.right;
      case 'ku':
        return TextAlign.right;
      case 'en':
        return TextAlign.left;
      default:
        return TextAlign.left;
    }
  }

  TextDirection getReverseDirection() {
    switch (_currentlocale.languageCode.toLowerCase()) {
      case 'en':
        return TextDirection.rtl;
      case 'fa':
        return TextDirection.ltr;
      case 'ku':
        return TextDirection.ltr;
      default:
        return TextDirection.rtl;
    }
  }
}
