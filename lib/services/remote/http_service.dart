import 'package:dio/dio.dart';

abstract class HttpService {
  void init();
  Future<Response> getRequest(
    String url,
  );
  Future<Response> postRequest(String url,
      {dynamic data, bool hasCancel, CancelToken? cancelToken});
}
