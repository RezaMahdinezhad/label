import 'package:label/domain/models/receive/track_review_model.dart';
import 'package:label/domain/models/succes.dart';
import 'package:label/globe_controller.dart';
import 'package:label/remote/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../domain/models/failure.dart';

class ReviewController extends GetxController {
  var isLoading = false.obs;
  late GlobeController globeController;
  late RepositoryImpl _repo;

  List<TrackReviewModel> reviewTrack = [];

  @override
  void onInit() {
    super.onInit();
    _repo = Get.put(RepositoryImpl());
    globeController = Get.find<GlobeController>();
    getTracks();
  }

  getTracks() async {
    isLoading.value = true;

    try {
      Either<Failure, Success> result =
          await _repo.getReviewTracks(globeController.accessToken.toString());
      result.fold(
        (failure) {
          print('Failed to fetch artist review data: ${failure.message}');
        },
        (success) {
          final tracksData = success.data['review'];
          if (reviewTrack.isNotEmpty) {
            reviewTrack.clear();
          }
          for (var item in tracksData) {
            reviewTrack.add(TrackReviewModel.fromMap(item));
          }
          isLoading.value = false;

          update();
        },
      );
    } catch (error) {
      print('Error occurred while fetch artist review data: $error');
    }
  }
}
