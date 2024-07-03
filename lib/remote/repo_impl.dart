import 'dart:io';

import 'package:label/domain/models/send/edit_profile_model_send.dart';
import 'package:label/domain/models/send/login_model_send.dart';
import 'package:label/domain/models/send/request_model_send.dart';
import 'package:label/domain/models/send/upload_track_model_send.dart';
import 'package:label/domain/models/succes.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/models/failure.dart';

abstract class IRepository {
  Future<void> fetchArtistData(String authToken);

  Future<Either<Failure, Success>> login(LoginModelSend data);

  Future<Either<Failure, Success>> fetchArtistTrackData(
      String authToken, int page);

  Future<Either<Failure, Success>> fetchArtistSingleTrackData(
      String authToken, String trackId);

  Future<Either<Failure, Success>> fetchArtistSingleTrackChartData(
      String authToken, String trackId, String days);
  Future<Either<Failure, Success>> fetchArtistProfileData(String authToken);
  Future<Either<Failure, Success>> loadArtist(String id);
  Future<Either<Failure, Success>> deleteCoverImage();
  Future<Either<Failure, Success>> deleteProfileImage();

  Future<Either<Failure, Success>> uploadCoverPhoto(File file);
  Future<Either<Failure, Success>> uploadProfilePhoto(File file);
  Future<Either<Failure, Success>> fetchArtistStaticData(
      String authToken, String days);

  Future<Either<Failure, Success>> editArtistData(String authToken,
      EditProfileModelSend newData, EditProfileModelSend data);
  Future<Either<Failure, Success>> getGenres(String authToken);
  Future<Either<Failure, Success>> getLanguage(String authToken);
  Future<Either<Failure, Success>> uploadTrack(
      String authToken, UploadTrackModel data, File image, File track);

  Future<Either<Failure, Success>> getReviewTracks(String authToken);
  Future<Either<Failure, Success>> requestToJoin(RequestModel data);
  Future<Either<Failure, Success>> getMessage();
  Future<Either<Failure, Success>> labelLogin(LoginModelSend data);
  Future<Either<Failure, Success>> fetchLabelData();
  Future<Either<Failure, Success>> fetchLabelAllArtists();
  Future<Either<Failure, Success>> fetchLabelTrackData(
      {int? order, String? name, int? page, String? artistId});
  Future<Either<Failure, Success>> fetchLabelSingleTrackData(
      String authToken, String trackId);
  Future<Either<Failure, Success>> fetchLabelSingleTrackChartData(
      String authToken, String trackId, String days);
}
