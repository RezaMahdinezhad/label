// import 'dart:convert';

// import 'package:labels/data/repository/remote/endpoint.dart';
// import 'package:labels/data/repository/remote/http_service.dart';
// import 'package:dio/dio.dart';

// class HttpServiceImpl implements HttpService {
//   late Dio _dio;

//   @override
//   void init() {
//     _dio = Dio(
//       BaseOptions(
//           baseUrl: EndPoint.base,
//           contentType: Headers.jsonContentType,
//           headers: {
//             'Accept': 'application/json',
//           }),
//     );

//   }

//   @override
//   Future<Response> getRequest(
//     String url,
//   ) async {
//     if () {
//       _dio.options.headers.addAll({
//         "Authorization":
//             "Bearer " + getx.Get.find<GlobeController>().accessToken!,

//         // "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImMyZjc2M2MwLWM3NjMtNDRhMS04ZjcxLTA4ZDljMzkxNmIxNCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZ3JvdXBzaWQiOiI5YWMyMjI3ZC01NThkLTRmMmMtM2MzOC0wOGQ5Y2UyNzk4ODEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJXb3JrZXIiLCJleHAiOjE2NDM4MzM3MDksImlzcyI6Imh0dHBzOi8vd3d3LnNlcnZpcS5uZXQiLCJhdWQiOiJodHRwczovL3d3dy5zZXJ2aXEubmV0In0.l9MPZbEtzjf1U0vJ5L1haWAYmmpTnLc1YwW6RrOwV7M"
//       });
//     }
//     Response response = await _dio.get(url);
//     return response;
//   }

//   @override
//   Future<Response> postRequest(String url,
//       {dynamic data, bool hasCancel = false, CancelToken? cancelToken}) async {
//     if (getx.Get.find<GlobeController>().accessToken != null) {
//       _dio.options.headers.addAll({
//         "Authorization":
//             "Bearer " + getx.Get.find<GlobeController>().accessToken!,
//         // "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImMyZjc2M2MwLWM3NjMtNDRhMS04ZjcxLTA4ZDljMzkxNmIxNCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZ3JvdXBzaWQiOiI5YWMyMjI3ZC01NThkLTRmMmMtM2MzOC0wOGQ5Y2UyNzk4ODEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJXb3JrZXIiLCJleHAiOjE2NDM4MzM3MDksImlzcyI6Imh0dHBzOi8vd3d3LnNlcnZpcS5uZXQiLCJhdWQiOiJodHRwczovL3d3dy5zZXJ2aXEubmV0In0.l9MPZbEtzjf1U0vJ5L1haWAYmmpTnLc1YwW6RrOwV7M"
//       });
//     }
//     Response response = await _dio.post(url,
//         cancelToken: hasCancel ? cancelToken : null,
//         data: data != null
//             ? data is FormData
//                 ? data
//                 : json.encode(data)
//             : null, onSendProgress: (int sent, int total) {
//       log("sent : $sent from total : $total");
//     });
//     return response;
//   }
// }
