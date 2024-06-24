import 'package:label/domain/models/failure.dart';
import 'package:label/domain/models/receive/artist_data_model.dart';
import 'package:label/domain/models/receive/message_madel.dart';
import 'package:label/domain/models/receive/track_model.dart';
import 'package:label/domain/models/succes.dart';
import 'package:label/globe_controller.dart';
import 'package:label/remote/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ArtistDataController extends GetxController {
  late RepositoryImpl _repo;
  var artistDataList = <ArtistdataModel>[];
  // final loginController = Get.put(LoginController());
  late GlobeController globeController;
  ArtistdataModel artistData = ArtistdataModel();
  var currentTrackPage = 1.obs;
  bool hasMoreTracks = true;
  List<TrackModel> artistTracks = [];
  var isLoadingMore = false.obs;
  var lastPage = 0.obs;

  var isLoading = true.obs;
  final ScrollController scrollController = ScrollController();

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

  final storage = GetStorage();

  @override
  void onInit() {
    _repo = Get.put(RepositoryImpl());
    globeController = Get.find<GlobeController>();
    if (globeController.loginType.value == 1) {
      fetchArtistData();
    } else {
      fetchLabelData();
    }

    super.onInit();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          lastPage.value > currentTrackPage.value) {
        print('shoooddddd');
        loadMoreTracks();
      }
      print('nashoodddd');
    });
    ever(messageNumber, (callback) {
      storage.write('messageNumber', messageNumber.value);
    });
    messageNumber.value = storage.read('messageNumber') ?? 0;
  }

  RxInt messageNumber = 0.obs;

  RxBool shouldShowMassage = false.obs;
  MessageModel messageModel = MessageModel();

  getMessage(BuildContext context) async {
    try {
      Either<Failure, Success> result = await _repo.getMessage();
      result.fold((l) async {
        print('-------Failed to fetch artist tracks: nashoooodd');
      }, (r) async {
        messageModel.messageText = r.data['messageText'];
        messageModel.messageNumber = r.data['messageNumber'];
        if (messageModel.messageNumber != 0 &&
            messageModel.messageNumber != messageNumber.value) {
          shouldShowMassage.value = true;
          messageNumber.value = messageModel.messageNumber;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Message'),
                content: Text(messageModel.messageText),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      });
    } catch (error) {
      print('-------Error occurred while fetching artist tracks: $error');
    }
  }

  Future<void> loadMoreTracks() async {
    if (hasMoreTracks) {
      isLoadingMore.value = true;
      currentTrackPage.value++;
      await getTracks();
      isLoadingMore.value = false;
    }
  }

  Future<void> fetchArtistDataOnrefresh() async {
    await getData();
    isLoading.value = false;
  }

  Future<void> fetchArtistData() async {
    await getData();
    await getTracks();
    isLoading.value = false;
  }

  Future<void> fetchLabelData() async {
    await getLabelData();
  }

  getTracks() async {
    try {
      Either<Failure, Success> result = await _repo.fetchArtistTrackData(
          globeController.accessToken.toString(), currentTrackPage.value);
      result.fold((l) async {
        print('Failed to fetch artist tracks: nashoooodd');
      }, (r) async {
        final List<TrackModel> tracks = r.data as List<TrackModel>;
        artistTracks.addAll(tracks);
        update();
        if (tracks.isEmpty) {
          hasMoreTracks = false;
        }
      });
    } catch (error) {
      print('Error occurred while fetching artist tracks: $error');
    }
  }

  getData() async {
    try {
      Either<Failure, Success> result =
          await _repo.fetchArtistData(globeController.accessToken.toString());
      result.fold(
        (failure) {
          print('Failed to fetch artist data: ${failure.message}');
        },
        (success) {
          artistData = ArtistdataModel.fromMap(success.data['data']);
          lastPage.value = success.data['last_page'] ?? 1;
          update();
        },
      );
    } catch (error) {
      print('Error occurred while fetching artist data: $error');
    }
  }

  getLabelData() async {
    try {
      Either<Failure, Success> result = await _repo.fetchLabelData();
      result.fold(
        (failure) {
          print('Failed to fetch Label data: ${failure.message}');
        },
        (success) {
          // artistData = ArtistdataModel.fromMap(success.data['data']);
          artistData.name = success.data['data']['name'];
          artistData.picture_url = success.data['data']['picture_url'];
          artistData.total_income = success.data['data']['total_income'];
          artistData.bank = success.data['data']['bank'];
          artistData.total_play =
              int.parse(success.data['data']['total_play'].toString());
          artistData.likes = int.parse(success.data['data']['likes']);
          artistData.totla_listener = success.data['data']['total_listener'];
          artistData.monthly_listener =
              success.data['data']['monthly_listener'];
          artistData.live_listen = success.data['data']['live_listen'];
          isLoading.value = false;

          update();
        },
      );
    } catch (error) {
      print('Error occurred while fetching artist data: $error');
    }
  }
}
