import 'dart:convert';
import 'dart:developer';

import 'package:label/domain/repository/remote/endpoint.dart';
import 'package:label/domain/repository/remote/http_service.dart';
import 'package:label/globe_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

class HttpServiceImpl implements HttpService {
  late Dio _dio;

  @override
  void init() {
    _dio = Dio(
      BaseOptions(
          baseUrl: EndPoint.base,
          contentType: Headers.jsonContentType,
          headers: {
            'Accept': 'application/json',
          }),
    );

    initializeInterceptors();
  }

  Future<Response> getRequest(
    String url,
  ) async {
    if (getx.Get.find<GlobeController>().accessToken != null) {
      _dio.options.headers.addAll({
        "Authorization":
            "Bearer " + getx.Get.find<GlobeController>().accessToken!,

        // "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImMyZjc2M2MwLWM3NjMtNDRhMS04ZjcxLTA4ZDljMzkxNmIxNCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZ3JvdXBzaWQiOiI5YWMyMjI3ZC01NThkLTRmMmMtM2MzOC0wOGQ5Y2UyNzk4ODEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJXb3JrZXIiLCJleHAiOjE2NDM4MzM3MDksImlzcyI6Imh0dHBzOi8vd3d3LnNlcnZpcS5uZXQiLCJhdWQiOiJodHRwczovL3d3dy5zZXJ2aXEubmV0In0.l9MPZbEtzjf1U0vJ5L1haWAYmmpTnLc1YwW6RrOwV7M"
      });
    }
    Response response = await _dio.get(url);
    return response;
  }

  @override
  Future<Response> postRequest(String url,
      {dynamic data, bool hasCancel = false, CancelToken? cancelToken}) async {
    if (getx.Get.find<GlobeController>().accessToken != null) {
      _dio.options.headers.addAll({
        "Authorization":
            "Bearer " + getx.Get.find<GlobeController>().accessToken!,
        // "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImMyZjc2M2MwLWM3NjMtNDRhMS04ZjcxLTA4ZDljMzkxNmIxNCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZ3JvdXBzaWQiOiI5YWMyMjI3ZC01NThkLTRmMmMtM2MzOC0wOGQ5Y2UyNzk4ODEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJXb3JrZXIiLCJleHAiOjE2NDM4MzM3MDksImlzcyI6Imh0dHBzOi8vd3d3LnNlcnZpcS5uZXQiLCJhdWQiOiJodHRwczovL3d3dy5zZXJ2aXEubmV0In0.l9MPZbEtzjf1U0vJ5L1haWAYmmpTnLc1YwW6RrOwV7M"
      });
    }
    Response response = await _dio.post(url,
        cancelToken: hasCancel ? cancelToken : null,
        data: data != null
            ? data is FormData
                ? data
                : json.encode(data)
            : null, onSendProgress: (int sent, int total) {
      log("sent : $sent from total : $total");

      getx.Get.find<GlobeController>().setUploadProgressValue(sent / total);
    });
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // log("onRequest :" +
          //     options.method +
          //     " , " +
          //     options.data.toString() +
          //     " , " +
          //     options.path +
          //     " , " +
          //     options.headers.toString());
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // log("onResponse :" +
          //     response.statusCode.toString() +
          //     " , " +
          //     response.statusMessage.toString() +
          //     " , " +
          //     response.data.toString());
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          if (e.response != null &&
              e.response!.statusCode != null &&
              e.response!.statusCode == 500 &&
              (e.requestOptions.path == EndPoint.getHomePage ||
                  e.requestOptions.path == EndPoint.getPlaylistMobile ||
                  e.requestOptions.path == EndPoint.getBrowsePage ||
                  e.requestOptions.path == EndPoint.getFollowers ||
                  e.requestOptions.path ==
                      EndPoint.base + EndPoint.getFollowers ||
                  e.requestOptions.path ==
                      EndPoint.base + EndPoint.getHomePage ||
                  e.requestOptions.path ==
                      EndPoint.base + EndPoint.getPlaylistMobile ||
                  e.requestOptions.path ==
                      EndPoint.base + EndPoint.getBrowsePage)) {
            return handler.reject(DioException(
              requestOptions: e.requestOptions,
              error: e.error,
              response: e.response,
              type: e.type,
              stackTrace: e.stackTrace,
              message: "Try 5 minutes later",
            ));
            // return handler.next(DioException(
            //   requestOptions: e.requestOptions,
            //   error: e.error,
            //   response: e.response,
            //   type: e.type,
            //   stackTrace: e.stackTrace,
            //   message: "Try 5 minute later",
            // ));
          }
          if (e.response != null &&
              e.response!.statusCode != null &&
              e.response!.statusCode == 401) {
            return handler.reject(DioException(
              requestOptions: e.requestOptions,
              error: e.error,
              response: e.response,
              type: e.type,
              stackTrace: e.stackTrace,
              message: "UnAuthenticated",
            ));
          }
          return handler.next(e);
          // log("interceptors onError : " + e.toString());
          // if (e.response != null) {
          //   // log("error with response : " + e.response.toString());
          //   return handler.next(e);
          // } else {
          //   // log("error without response : " + e.message!);
          //   return handler.next(e);
          // }
        },
      ),
    );
  }
}
