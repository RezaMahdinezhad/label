import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:label/common/helper/static_helper.dart';
import 'package:label/services/remote/i_request_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RequestHandler implements IRequestHandler {
  int timeoutSeconds = 150;

  final String _baseUrl = StaticHelper().getGatewayUrl();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  RequestHandler() {
    initializeAuthenticadedDio();
  }

  Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(InterceptorsWrapper(
          // onRequest: (RequestOptions options,
          //         RequestInterceptorHandler requestInterceptorHandler) =>
          //     requestInterceptor(options, requestInterceptorHandler),
          onResponse: (Response response,
                  ResponseInterceptorHandler responseInterceptorHandler) =>
              responseInterceptor(response, responseInterceptorHandler),
          onError: (DioException dioExeption,
                  ErrorInterceptorHandler errorInterceptorHandler) =>
              errorInterceptor(dio, dioExeption, errorInterceptorHandler)));
  }

  FutureOr<dynamic> requestInterceptor(RequestOptions options,
      RequestInterceptorHandler requestInterceptorHandler) async {
    //  final token = await _secureStorage.read(key: 'token');
    //  if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
    // return onRequest(options, requestInterceptorHandler);
    return requestInterceptorHandler.next(options);
  }

  void responseInterceptor(Response response,
      ResponseInterceptorHandler responseInterceptorHandler) {
    return responseInterceptorHandler.next(response);
  }

  void errorInterceptor(Dio dio, DioException dioError,
      ErrorInterceptorHandler errorInterceptorHandler) async {
    if (dioError.response != null &&
        dioError.response!.statusCode != null &&
        dioError.response!.statusCode == 401) {
      try {} catch (e) {
        errorInterceptorHandler.reject(dioError);
      }
    } else {
      errorInterceptorHandler.reject(dioError);
    }
  }

  Dio addAuthInterceptor(Dio dio) {
    return dio..interceptors.add(HeaderInterceptor(FlutterSecureStorage()));
  }

  Dio initializeAuthenticadedDio() {
    var dio = addInterceptors(Dio());
    // _oAuth = OAuth(
    //     tokenUrl: _authorizationEndpoint,
    //     clientId: _identifier,
    //     dio: dio,
    //     clientSecret: _secret,
    //     storage: OAuthSecureStorage());

    dio = addAuthInterceptor(dio);
    return dio;
  }

  void handleDioErrors(dynamic error) {
    if (error is DioException) {
      if (error.response == null) {
        throw Exception("check_connection_message");
      }
      if (error.response!.statusCode! >= 500) {
        throw Exception("unhandled_server_error_message");
      }
      if (error.response!.statusCode! == 401) {
        throw Exception("unAuthorized");
      }
      throw Exception(error);
    }
  }

  @override
  Future<dynamic> httpGet({
    required String url,
    bool needAth = false,
    bool forceDontAuth = false,
    Map<String, String> optionalHeaders = const {},
  }) async {
    try {
      var appHeader = await _initailzeHeaderAppInfo();
      final headers = {"app-Info": appHeader, ...optionalHeaders};

      // set url
      final combinedUrl = url.startsWith("http") ? url : _baseUrl + url;

      late Response res;
      if (forceDontAuth != true) {
        var dio = initializeAuthenticadedDio();
        dio.options.headers.addAll(headers);
        res = await dio.get(combinedUrl);
      } else {
        var dio = Dio();
        dio.options.headers.addAll(headers);
        res = await dio.get(combinedUrl);
      }

      return res.data;
    } catch (error) {
      handleDioErrors(error);
      rethrow;
    }
  }

  @override
  Future<dynamic> httpPost({
    required String url,
    required Object? fields,
    bool forceDontAuth = false,
    Map<String, String> optionalHeaders = const {},
    bool needAth = false,
  }) async {
    // var appHeader = await _initailzeHeaderAppInfo();
    final headers = {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      // "app-Info": appHeader,
      ...optionalHeaders
    };

    // set url
    final combinedUrl = url.startsWith("http") ? url : _baseUrl + url;

    try {
      // receive responce
      late Response res;
      if (forceDontAuth != true) {
        var dio = initializeAuthenticadedDio();
        dio.options.headers.addAll(headers);
        final response = await dio
            .post(combinedUrl, data: json.encode(fields))
            .timeout(Duration(seconds: timeoutSeconds));
        if (response.headers["Content-Type"].toString() ==
            "application/octet-stream") {
          return {"result": String.fromCharCodes(response.data)};
        }
        res = response;
      } else {
        var dio = Dio();
        addInterceptors(dio);
        dio.options.headers.addAll(headers);

        res = await dio
            .post(combinedUrl, data: json.encode(fields))
            .timeout(Duration(seconds: timeoutSeconds));
      }
      return res.data;
    } catch (error) {
      handleDioErrors(error);
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> httpPut({
    required String url,
    required Object? fields,
    bool forceDontAuth = false,
    Map<String, String> optionalHeaders = const {},
    bool needAth = false,
  }) async {
    var appHeader = await _initailzeHeaderAppInfo();
    final headers = {
      'Content-Type': 'application/json',
      "app-Info": appHeader,
      ...optionalHeaders
    };

    // set url
    final combinedUrl = url.startsWith("http") ? url : _baseUrl + url;

    try {
      // receive responce
      late Response res;
      if (forceDontAuth != true) {
        var dio = initializeAuthenticadedDio();
        dio.options.headers.addAll(headers);
        final response = await dio
            .put(combinedUrl, data: json.encode(fields))
            .timeout(Duration(seconds: timeoutSeconds));
        if (response.headers["Content-Type"].toString() ==
            "application/octet-stream") {
          return {"result": String.fromCharCodes(response.data)};
        }
        res = response;
      } else {
        var dio = Dio();
        dio.options.headers.addAll(headers);
        res = await dio
            .put(combinedUrl, data: json.encode(fields))
            .timeout(Duration(seconds: timeoutSeconds));
      }

      return res.data;
    } catch (error) {
      handleDioErrors(error);
      rethrow;
    }
  }

  Future<String> _initailzeHeaderAppInfo() async {
    // var appVersion = await StaticHelper().getAppVersion();
    String osName = "";
    if (Platform.isAndroid) {
      osName = "android";
    } else if (Platform.isIOS) {
      osName = "ios";
    }
    //"app-Version" : "$appVersion"
    var appInfo = '{"os" : "$osName",}';
    return appInfo;
  }

  @override
  Future logout() async {
    await _secureStorage.delete(key: 'token');
  }
}

class HeaderInterceptor extends Interceptor {
  final FlutterSecureStorage _secureStorage;

  HeaderInterceptor(this._secureStorage);

  @override
  FutureOr<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _secureStorage.read(key: 'token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return super.onRequest(options, handler);
  }
}

class AuthService {
  static const String _accessTokenKey = 'access_token';

  static Future<void> saveAccessToken(String token) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: _accessTokenKey, value: token);
  }

  static Future<String?> getAccessToken() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: _accessTokenKey);
    return token;
  }
}
