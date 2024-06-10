import 'package:label/domain/models/receive/preview_album_model.dart';
import 'package:label/domain/models/receive/preview_artist_model.dart';
import 'package:label/domain/models/receive/preview_track_model.dart';
import 'package:label/domain/models/succes.dart';
import 'package:label/presentation/artist_screen/artist_controller.dart';
import 'package:label/presentation/profile/profile_controller.dart';
import 'package:label/remote/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../domain/models/failure.dart';

class PreviewController extends GetxController {
  late ProfileController profileController;
  late String artistId;
  bool isLoading = true;
  late RepositoryImpl _repo;
  PreviewArtistModel previewArtistModel = PreviewArtistModel();
  List<ReviewTrackModel> previewTracks = [];
  List<PreviewAlbumModel> previewAlbums = [];
  late ArtistDataController artistDataController;
  bool isTrack = true;

  int descriptionMaxLines = 2;

  String description = 'Show More';

  @override
  void onInit() {
    profileController = Get.find<ProfileController>();
    artistDataController = Get.find<ArtistDataController>();
    artistId = artistDataController.artistData.id.toString();
    _repo = Get.put(RepositoryImpl());
    loadArtist();
    super.onInit();
  }

  String formatNumber(int number) {
    if (number >= 1000 && number < 1000000) {
      double result = number / 1000.0;
      return '${result.toStringAsFixed(1)}K';
    } else if (number >= 1000000) {
      double result = number / 1000000;
      return '${result.toStringAsFixed(1)}M';
    } else {
      return number.toString();
    }
  }

  Future loadArtist() async {
    Either<Failure, Success> res = await _repo.loadArtist(artistId);

    res.fold((l) async {
      // Fluttertoast.showToast(msg: l.message);
      update();
    }, (r) {
      previewArtistModel = PreviewArtistModel.fromMap(r.data['artist']);

      final previewTrack = r.data['tracks'];
      previewTracks.clear();
      for (var item in previewTrack) {
        previewTracks.add(ReviewTrackModel.fromMap(item));
      }

      final previewAlbum = r.data['albums'];
      previewAlbums.clear();
      for (var item in previewAlbum) {
        previewAlbums.add(PreviewAlbumModel.fromMap(item));
      }
      isLoading = false;

      update();
    });
  }
}
