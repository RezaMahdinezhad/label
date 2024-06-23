import 'dart:io';

import 'package:label/domain/models/failure.dart';
import 'package:label/domain/models/receive/login_model.dart';
import 'package:label/domain/models/receive/single_track_model.dart';
import 'package:label/domain/models/receive/track_model.dart';
import 'package:label/domain/models/send/edit_profile_model_send.dart';
import 'package:label/domain/models/send/login_model_send.dart';
import 'package:label/domain/models/send/request_model_send.dart';
import 'package:label/domain/models/send/upload_track_model_send.dart';
import 'package:label/domain/repository/remote/endpoint.dart';
import 'package:label/domain/repository/remote/http_service.dart';
import 'package:label/remote/repo_impl.dart';
import 'package:label/services/remote/http_service_impl.dart';
import 'package:label/services/remote/request_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import '../../../domain/models/succes.dart';

class RepositoryImpl implements IRepository {
  RequestHandler? requestHandler;
  late HttpService _httpService;
  RepositoryImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
    requestHandler = Get.put(RequestHandler());
  }

  String handleError(e) {
    if (e is DioError) {
      if (e.response != null &&
          e.response?.data != null &&
          e.response?.data != "") {
        if (e.response?.data["message"] is List) {
          return e.response?.data["message"][0];
        }
        if (e.response?.data["errors"] != null) {
          // log(e.response?.data["errors"]);
          // print(e.response?.data["errors"]);
          if (e.response?.data["errors"] != null ||
              e.response?.data["errors"] != "") {
            var error = e.response?.data["errors"];
            if (error["username"] is List) {
              return error["username"][0];
            }
            if (error["email"] is List) {
              return error["email"][0];
            }
          }

          return e.response?.data["errors"][0];
        }
        if (e.response?.data["code"] != null) {
          return e.message!;
        }
        return e.response?.data["message"];
      }
      return e.message ?? "Please check your connection!";
    }
    return "Your Username or Password is incorrect!";
  }

  @override
  Future<Either<Failure, Success>> login(LoginModelSend data) async {
    final Map<String, dynamic> changes = {};
    if (data.username != null) {
      changes['username'] = data.username;
      changes['password'] = data.password;
    } else {
      changes['email'] = data.email;
      changes['password'] = data.password;
    }
    try {
      final formData = dio.FormData.fromMap({
        // 'username': data.username,
        // // 'email': data.email,
        // 'password': data.password,
        ...changes
      });
      dio.Response res = await _httpService
          .postRequest(EndPoint.base + EndPoint.loginArtist, data: formData);
      return Right(
        Success(
            data: LoginModel.fromMap(res.data),
            message: Fluttertoast.showToast(msg: 'Welcome!').toString()),
      );
    } catch (e) {
      return Left(
        Failure(
            message: Fluttertoast.showToast(
                    msg: 'Your username or password is not correct.')
                .toString()),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> labelLogin(LoginModelSend data) async {
    final Map<String, dynamic> changes = {};
    if (data.username != null) {
      changes['username'] = data.username;
      changes['password'] = data.password;
    } else {
      changes['email'] = data.email;
      changes['password'] = data.password;
    }
    try {
      final formData = dio.FormData.fromMap({
        // 'username': data.username,
        // // 'email': data.email,
        // 'password': data.password,
        ...changes
      });
      dio.Response res = await _httpService
          .postRequest(EndPoint.base + EndPoint.loginArtist, data: formData);
      return Right(
        Success(
            data: LoginModel.fromMap(res.data),
            message: Fluttertoast.showToast(msg: 'Welcome!').toString()),
      );
    } catch (e) {
      return Left(
        Failure(
            message: Fluttertoast.showToast(
                    msg: 'Your username or password is not correct.')
                .toString()),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> fetchArtistData(String authToken) async {
    try {
      dio.Response res =
          await _httpService.postRequest(EndPoint.base + EndPoint.artistData);
      final responseData = res.data;
      // final artistData = ArtistdataModel.fromMap(responseData['data']);
      return Right(
        Success(
          data: responseData,
          // message: Fluttertoast.showToast(msg: 'Welcome Artist!').toString()
        ),
      );
    } catch (e) {
      return Left(
        Failure(
          message: '',
        ),
      );
    }
  }

  Future<Either<Failure, Success>> fetchArtistTrackData(
      String authToken, int page) async {
    try {
      dio.Response res = await _httpService.postRequest(
          EndPoint.base + EndPoint.artistTracksData,
          data: {'page': page});

      final responseData = res.data;
      final tracksData = responseData['data'] as List<dynamic>;

      // Check if there are more tracks to load
      // bool hasMoreTracks = tracksData.length < tracksPerPage;

      // Convert and return tracks as a result
      final tracks =
          tracksData.map((track) => TrackModel.fromMap(track)).toList();
      return Right(
          Success(data: tracks, message: 'Tracks loaded successfully'));
    } catch (e) {
      return Left(Failure(message: 'Failed to fetch artist tracks'));
    }
  }

  Future<Either<Failure, Success>> fetchArtistSingleTrackData(
      String authToken, String trackId) async {
    try {
      final formData =
          dio.FormData.fromMap({'token': authToken, 'track_id': trackId});
      dio.Response res = await _httpService.postRequest(
          EndPoint.base + EndPoint.artistSingleTrackData,
          data: formData);

      final responseData = res.data;
      final trackData = responseData['tarck'];
      final firsttrackData = SingleTrackModel.fromMap(trackData);
      return Right(
          Success(data: firsttrackData, message: 'Tracks loaded successfully'));
    } catch (e) {
      return Left(Failure(message: 'Failed to fetch artist tracks'));
    }
  }

  Future<Either<Failure, Success>> fetchArtistSingleTrackChartData(
      String authToken, String trackId, String days) async {
    try {
      final formData = dio.FormData.fromMap(
          {'token': authToken, 'track_id': trackId, 'days': days});
      dio.Response res = await _httpService.postRequest(
          EndPoint.base + EndPoint.artistSingleTrackGraphData,
          data: formData);

      final responseData = res.data;
      return Right(
          Success(data: responseData, message: 'Tracks loaded successfully'));
    } catch (e) {
      return Left(Failure(message: 'Failed to fetch artist tracks'));
    }
  }

  Future<Either<Failure, Success>> fetchArtistProfileData(
      String authToken) async {
    final formData = dio.FormData.fromMap(
      {'token': authToken},
    );
    try {
      dio.Response res = await _httpService.postRequest(
          EndPoint.base + EndPoint.artistProfileData,
          data: formData);

      final responseData = res.data;
      // final profileData = responseData['data'];
      return Right(
          Success(data: responseData, message: 'profile loaded successfully'));
    } catch (e) {
      return Left(Failure(message: 'Failed to fetch artist tracks'));
    }
  }

  Future<Either<Failure, Success>> loadArtist(String id) async {
    final formData = dio.FormData.fromMap(
      {'id': id},
    );
    try {
      dio.Response res = await _httpService
          .postRequest(EndPoint.base + EndPoint.getArtistById, data: formData);
      final responseData = res.data;
      return Right(
        Success(data: responseData),
      );
    } catch (e) {
      return Left(
        Failure(message: 'Cant load data'),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> deleteCoverImage() async {
    try {
      dio.Response res = await _httpService.postRequest(
        EndPoint.base + EndPoint.deletCover,
      );
      return Right(Success(data: res.data));
    } catch (e) {
      return Left(
        Failure(message: 'deleteCoverImage fail'),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> deleteProfileImage() async {
    try {
      dio.Response res = await _httpService.postRequest(
        EndPoint.base + EndPoint.deletProfile,
      );
      return Right(Success(data: res.data));
    } catch (e) {
      return Left(
        Failure(message: 'deleteProfileImage fail'),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> uploadProfilePhoto(File file) async {
    final mimeTypeData = lookupMimeType(file.path)?.split('/');
    try {
      dio.Response res =
          await _httpService.postRequest(EndPoint.base + EndPoint.upPhoto,
              data: dio.FormData.fromMap({
                "picture_url": await dio.MultipartFile.fromFile(file.path,
                    contentType: MediaType(mimeTypeData![0], mimeTypeData[1])),
              }));
      return Right(Success(data: res.data));
    } catch (e) {
      return Left(
        Failure(message: 'uploadProfilePhoto succes full'),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> getMessage() async {
    try {
      dio.Response res = await _httpService.postRequest(EndPoint.getMessage);
      return Right(Success(data: res.data));
    } catch (e) {
      return Left(
        Failure(message: ''),
      );
    }
  }

  Future<Either<Failure, Success>> fetchArtistStaticData(
      String authToken, String days) async {
    final formData = dio.FormData.fromMap(
      {'token': authToken, 'days': days},
    );
    try {
      dio.Response res = await _httpService
          .postRequest(EndPoint.artistStaticData, data: formData);

      final responseData = res.data;
      return Right(
          Success(data: responseData, message: 'static loaded successfully'));
    } catch (e) {
      return Left(Failure(message: 'Failed to fetch artist static'));
    }
  }

  Future<Either<Failure, Success>> editArtistData(String authToken,
      EditProfileModelSend newData, EditProfileModelSend data) async {
    final Map<String, dynamic> changes = {};

    if (newData.username != data.username) {
      changes['username'] = newData.username;
    }

    if (newData.email != data.email) {
      changes['email'] = newData.email;
    }

    if (newData.bio != data.bio) {
      changes['bio'] = newData.bio;
    }

    if (newData.instagram_url != data.instagram_url) {
      changes['instagram_url'] = newData.instagram_url;
    }

    if (newData.youtube_url != data.youtube_url) {
      changes['youtube_url'] = newData.youtube_url;
    }

    if (newData.facebook_url != data.facebook_url) {
      changes['facebook_url'] = newData.facebook_url;
    }

    if (newData.color1 != data.color1) {
      changes['color1'] = newData.color1;
    }

    if (newData.color2 != data.color2) {
      changes['color2'] = newData.color2;
    }
    final formData = dio.FormData.fromMap(
      {
        'token': authToken,
        ...changes,
      },
    );
    try {
      dio.Response res = await _httpService
          .postRequest(EndPoint.artistEditProfile, data: formData);

      final responseData = res.data;
      return Right(Success(
          data: responseData, message: 'artistEditProfile successfully'));
    } catch (e) {
      return Left(Failure(message: handleError(e)));
    }
  }

  Future<Either<Failure, Success>> getGenres(String authToken) async {
    final formData = dio.FormData.fromMap(
      {
        'token': authToken,
      },
    );

    try {
      dio.Response res = await _httpService
          .postRequest(EndPoint.base + EndPoint.genre, data: formData);

      final responseData = res.data;
      return Right(
          Success(data: responseData, message: 'getGenres successfully'));
    } catch (e) {
      return Left(Failure(message: handleError(e)));
    }
  }

  Future<Either<Failure, Success>> getLanguage(String authToken) async {
    final formData = dio.FormData.fromMap(
      {
        'token': authToken,
      },
    );

    try {
      dio.Response res = await _httpService
          .postRequest(EndPoint.base + EndPoint.language, data: formData);

      final responseData = res.data;

      return Right(
          Success(data: responseData, message: 'getLanguage successfully'));
    } catch (e) {
      return Left(Failure(message: handleError(e)));
    }
  }

  @override
  Future<Either<Failure, Success>> uploadCoverPhoto(File file) async {
    final mimeTypeData = lookupMimeType(file.path)?.split('/');
    try {
      dio.Response res =
          await _httpService.postRequest(EndPoint.base + EndPoint.upCover,
              data: dio.FormData.fromMap({
                "cover_url": await dio.MultipartFile.fromFile(file.path,
                    contentType: MediaType(mimeTypeData![0], mimeTypeData[1])),
              }));
      return Right(Success(data: res.data));
    } catch (e) {
      return Left(
        Failure(message: 'uploadCoverPhoto succes full'),
      );
    }
  }

  Future<Either<Failure, Success>> uploadTrack(
      String authToken, UploadTrackModel data, File image, File track) async {
    final mimeTypeImageData = lookupMimeType(image.path)?.split('/');
    final mimeTypeTrackData = lookupMimeType(track.path.toString())?.split('/');

    final formData = dio.FormData.fromMap(
      {
        'token': authToken,
        ...data.toMap(),
        'cover': await dio.MultipartFile.fromFile(image.path,
            contentType:
                MediaType(mimeTypeImageData![0], mimeTypeImageData[1])),
        'track': await dio.MultipartFile.fromFile(track.path.toString(),
            contentType:
                MediaType(mimeTypeTrackData![0], mimeTypeTrackData[1])),
      },
    );

    try {
      dio.Response res = await _httpService
          .postRequest(EndPoint.base + EndPoint.uploadTrack, data: formData);

      final responseData = res.data;
      return Right(
          Success(data: responseData, message: 'upload  track successfully'));
    } catch (e) {
      return Left(Failure(message: handleError(e)));
    }
  }

  Future<Either<Failure, Success>> getReviewTracks(String authToken) async {
    final formData = dio.FormData.fromMap(
      {
        'token': authToken,
      },
    );

    try {
      dio.Response res = await _httpService
          .postRequest(EndPoint.base + EndPoint.reviewTrack, data: formData);

      final responseData = res.data;
      return Right(
          Success(data: responseData, message: 'review  track successfully'));
    } catch (e) {
      return Left(Failure(message: handleError(e)));
    }
  }

  @override
  Future<Either<Failure, Success>> requestToJoin(RequestModel data) async {
    final formData = dio.FormData.fromMap(
      {
        'name': data.name,
        'email': data.email,
        'phonenumber': data.phonenumber,
        'social': data.social,
      },
    );
    try {
      dio.Response res = await _httpService
          .postRequest(EndPoint.base + EndPoint.requestToJoin, data: formData);
      return Right(Success(data: res.data));
    } catch (e) {
      return Left(
        Failure(message: 'request to join fail fail'),
      );
    }
  }
}
