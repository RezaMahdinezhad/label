import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:label/domain/models/failure.dart';
import 'package:label/domain/models/receive/artist_data_model.dart';
import 'package:label/domain/models/receive/label_artists.dart';
import 'package:label/domain/models/receive/label_single_artist_model.dart';
import 'package:label/domain/models/receive/message_madel.dart';
import 'package:label/domain/models/receive/track_model.dart';
import 'package:label/domain/models/succes.dart';
import 'package:label/domain/repository/remote/endpoint.dart';
import 'package:label/globe_controller.dart';
import 'package:label/remote/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ArtistDataController extends GetxController
    with GetSingleTickerProviderStateMixin {
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
  final TextEditingController searchInTracks = TextEditingController();
  final TextEditingController searchInArtists = TextEditingController();
  TabController? tabController;

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
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
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
        loadMoreTracksorArtists();
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

  Future<void> loadMoreTracksorArtists() async {
    if (hasMoreTracks) {
      if (globeController.loginType.value == 1) {
        isLoadingMore.value = true;
        currentTrackPage.value++;
        await getTracks();
        isLoadingMore.value = false;
      } else {
        if (tabController!.index == 0) {
          isLoadingMore.value = true;
          currentTrackPage.value++;
          await getLabelTracks(
              order: orderTracks.value,
              name: searchInTracks.text,
              artistId: artistId.value,
              page: currentTrackPage.value);
          isLoadingMore.value = false;
        } else {
          isLoadingSingleArtists.value = true;
          currentArtistPage.value++;
          await getLabelSingleArtists(
              order: orderArtists.value,
              name: searchInArtists.text,
              page: currentArtistPage.value);
        }
      }
    }
  }

  RxInt orderTracks = 0.obs;
  RxInt orderArtists = 0.obs;
  RxString artistId = ''.obs;

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
    await getLabelTracks(order: 2, name: '', page: 1, artistId: '');
    await getLabelSingleArtists(order: 2, name: '', page: 1);
    await getLabelAllArtists();
  }

  RxInt currentArtistPage = 1.obs;
  RxInt lastArtistPage = 1.obs;

  List<LabelSingleArtist> labelSingleArtists = [];
  RxBool isLoadingSingleArtists = true.obs;
  RxBool hasmoreArtists = true.obs;
  getLabelSingleArtists({
    required int order,
    required String name,
    required int page,
  }) async {
    update();
    try {
      Either<Failure, Success> result = await _repo.fetchLabelSingleArtist(
        order: order,
        name: name,
        page: page,
      );
      result.fold((l) async {
        isLoadingSingleArtists.value = true;

        print('Failed to fetch artist tracks: nashoooodd');
      }, (r) async {
        if (page == 1) {
          labelSingleArtists.clear();
        }
        currentArtistPage.value = r.data['current_page'] ?? 1;
        lastArtistPage.value = r.data['last_page'] ?? 1;
        if (currentArtistPage.value > lastArtistPage.value) {
          hasmoreArtists.value = true;
        } else {
          hasmoreArtists.value = false;
        }
        update();
        for (var item in r.data['data']) {
          labelSingleArtists.add(LabelSingleArtist(
            artist_id: item['artist_id'] ?? 0,
            artist_name: item['artist_name'].toString(),
            s_picture_url: item['s_picture_url'].toString(),
          ));
        }
        log('kkkkk ${labelSingleArtists.length}');

        isLoadingSingleArtists.value = false;

        update();
      });
    } catch (error) {
      isLoadingSingleArtists.value = false;

      print('Error occurred while fetching artist tracks: $error');
    }
  }

  RxBool isLoadingTracks = true.obs;

  getLabelTracks(
      {required int order,
      required String name,
      required int page,
      required String artistId}) async {
    update();
    try {
      Either<Failure, Success> result = await _repo.fetchLabelTrackData(
          order: order, name: name, page: page, artistId: artistId);
      result.fold((l) async {
        isLoadingTracks.value = true;

        print('Failed to fetch artist tracks: nashoooodd');
      }, (r) async {
        final List<TrackModel> tracks = r.data as List<TrackModel>;
        if (page == 1) {
          artistTracks.clear();
        }
        artistTracks.addAll(tracks);
        update();
        if (tracks.isEmpty) {
          hasMoreTracks = false;
        }
        isLoadingTracks.value = false;

        update();
      });
    } catch (error) {
      isLoadingTracks.value = true;

      print('Error occurred while fetching artist tracks: $error');
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

  RxBool isAllArtistsLoaded = false.obs;
  List<LabelAllArtists> allArtists = [];

  getLabelAllArtists() async {
    try {
      Either<Failure, Success> result = await _repo.fetchLabelAllArtists();
      result.fold((l) async {
        print('Failed to fetch artist tracks: nashoooodd');
      }, (r) async {
        allArtists.clear();
        for (var item in r.data['data']) {
          allArtists.add(LabelAllArtists(
            name: item['name'].toString(),
            artist_id: item['artist_id'] ?? 0,
            picture_url: item['picture_url'].toString(),
          ));
        }
        log('eeeeeeee ${allArtists.length}');
        await buildLabelDropDownAllArtists();
        isAllArtistsLoaded.value = true;
        update();
      });
    } catch (error) {
      isAllArtistsLoaded.value = false;
      print('Error occurred while fetching artist tracks: $error');
    }
  }

  List<DropdownMenuItem<String>> allArtistItems = [];
  buildLabelDropDownAllArtists() {
    allArtistItems.clear();
    for (var item in allArtists) {
      allArtistItems.add(DropdownMenuItem(
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/Artist/artist1.PNG'),
              foregroundImage: CachedNetworkImageProvider(
                  EndPoint.base + item.picture_url.toString()),
            ),
            SizedBox(
              width: 8,
            ),
            Text(item.name.toString())
          ],
        ),
        value: item.artist_id.toString(),
      ));
    }
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
}
