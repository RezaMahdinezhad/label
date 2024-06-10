import 'dart:io';

import 'package:label/common/statics/enums.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';

class StaticHelper {
  factory StaticHelper() {
    return _singleton;
  }

  StaticHelper._internal() {
    _serverMode = ServerMode.main;
    assert(() {
      _serverMode = ServerMode.main;
      return true;
    }());
  }

  static final StaticHelper _singleton = StaticHelper._internal();

  // bool _checkTimeZone = false;
  // late bool _isLocal;
  // late bool _isRelease;
  bool _vpnActive = false;
  ServerMode _serverMode = ServerMode.main;

  bool isLocal() {
    return _serverMode == ServerMode.local;
  }

  bool isRelease() {
    return _serverMode == ServerMode.main;
  }

  String getUsernameTest() {
    if (_serverMode == ServerMode.test) {
      return "test";
    }
    return "test";
  }

  String getPasswordTest() {
    if (_serverMode == ServerMode.test) {
      return "test";
    }
    return "test";
  }

  Future isVpnActive() async {
    if (!kIsWeb) {
      List<NetworkInterface> interfaces = await NetworkInterface.list(
          includeLoopback: false, type: InternetAddressType.any);
      interfaces.isNotEmpty
          ? _vpnActive = interfaces.any((interface) =>
              interface.name.contains("tun") ||
              interface.name.contains("ppp") ||
              interface.name.contains("l2tp") ||
              interface.name.contains("sstp") ||
              interface.name.contains("ikev2") ||
              interface.name.contains("pptp"))
          : _vpnActive = false;
    }
  }

  bool getVpnStatus() {
    return _vpnActive;
  }

  // Future<String> getAppVersion() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   return packageInfo.version;
  // }

  String getGatewayUrl() {
    switch (_serverMode) {
      case ServerMode.main:
        return "https://dangify.net/";
      case ServerMode.test:
        return "https://dangify.net/";
      case ServerMode.local:
        return "https://dangify.net/";
      default:
        return "https://dangify.net/";
    }
  }

  // static String base = "https://dangify.net/";
  // static String base1 = "https://dangify.net/";
  // static String base2 = "https://dangifyapp.com/";
  // static String base3 = "https://dang-media.com/";
  // static String base4 = "https://dangify.com/";
}
