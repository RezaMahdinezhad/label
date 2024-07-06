import 'package:label/domain/models/failure.dart';
import 'package:label/domain/models/receive/city_model.dart';
import 'package:label/domain/models/receive/date_model.dart';
import 'package:label/domain/models/receive/sexes_model.dart';
import 'package:label/domain/models/receive/statics_model.dart';
import 'package:label/domain/models/receive/top_countries_model.dart';
import 'package:label/domain/models/succes.dart';
import 'package:label/globe_controller.dart';
import 'package:label/presentation/artist_screen/artist_controller.dart';
import 'package:label/remote/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabelSingleArtistController extends GetxController {
  final artistDataController = Get.find<ArtistDataController>();
  late GlobeController globeController;
  late RepositoryImpl _repo;
  // late SingleTrackModel singleTrackData;

  late ArtistStaticsModel artistStaticsModel;

  late DateModel dateModel;

  late TopCountriesModel country1;
  late CityModel city1;
  late SexesModel sex1;
  late SexesModel sex2;
  late SexesModel sex3;

  List<TopCountriesModel> topCountries = [];
  List<CityModel> topCities = [];
  List<SexesModel> topSexes = [];

  late Map<String, int> chartDate;
  late Map<String, dynamic> incomeDate;
  var isLoading = true.obs;
  var isLoadingGraph = true.obs;

  var trackId = ''.obs;
  var trackDataLoaded = false.obs;
  var days = '7'.obs;

  Color color1 = Color(0xff6AAFD6);
  Color color2 = Color(0xffFDB7C8);
  Color color3 = Color(0xffFDC280);
  Color color4 = Color(0xffB9B8FD);
  Color color5 = Colors.blueAccent;
  Color color6 = Colors.grey;

  var selectedDayIndex = 0.obs;
  var selectedLocationIndex = 0.obs;
  RxString artistId = ''.obs;

  @override
  void onInit() {
    _repo = Get.put(RepositoryImpl());
    globeController = Get.find<GlobeController>();

    super.onInit();
  }

  setArtistId(String id) {
    artistId.value = id;
    getSingleArtistdata(id: artistId.value, days: days.value);
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

  double calculateSumOfCountryPercentValues(int startIndex, int endIndex) {
    double sum = 0.0;

    if (endIndex < topCountries.length) {
      for (int i = startIndex; i <= endIndex; i++) {
        final topCountry = topCountries[i];
        sum += double.parse(topCountry.percent!);
      }
    }

    return sum;
  }

  double calculateSumOfPercentValuesInCities(int startIndex, int endIndex) {
    double sum = 0.0;

    // Ensure that the endIndex is within the bounds of your list
    if (endIndex < topCities.length) {
      for (int i = startIndex; i <= endIndex; i++) {
        final topCity = topCities[i];
        sum += double.parse(topCity.percent!);
      }
    }

    return sum;
  }

  Color getColorForChart(int index) {
    if (index == 0) {
      return color1;
    } else if (index == 1) {
      return color2;
    } else if (index == 2) {
      return color3;
    } else if (index == 3) {
      return color4;
    } else if (index == 4) {
      return color5;
    }
    return color6;
  }

  final Map<int, Widget> items = {
    0: Text(
      '7 Days',
      style: TextStyle(color: Colors.black),
    ),
    1: Text(
      '28 Days',
      style: TextStyle(color: Colors.black),
    ),
    2: Text(
      '90 Days',
      style: TextStyle(color: Colors.black),
    ),
  };

  final Map<int, Widget> locationItems = {
    0: Text(
      'Countries',
      style: TextStyle(color: Colors.black),
    ),
    1: Text(
      'Cities',
      style: TextStyle(color: Colors.black),
    ),
  };

  getSingleArtistdata({required String id, required String days}) async {
    try {
      Either<Failure, Success> result =
          await _repo.fetchLabelSingleArtistChartData(id, days);
      result.fold(
        (failure) {
          print('Failed to fetch artist data: ${failure.message}');
        },
        (success) {
          artistStaticsModel =
              ArtistStaticsModel.fromMap(success.data['artist']);
          chartDate = Map<String, int>.from(success.data['listenersGraph']);
          incomeDate = Map<String, dynamic>.from(success.data['incomeGraph']);
          print('-----////$incomeDate');

          final topCountriesData = success.data['topCountries'];
          topCountries.clear();
          for (var item in topCountriesData) {
            topCountries.add(TopCountriesModel.fromMap(item));
          }

          final topCitiesData = success.data['topCities'];
          topCities.clear();
          for (var item in topCitiesData) {
            topCities.add(CityModel.fromMap(item));
          }

          final topSexesData = success.data['Sexes'];
          topSexes.clear();
          for (var item in topSexesData) {
            topSexes.add(SexesModel.fromMap(item));
          }

          country1 = TopCountriesModel.fromMap(success.data['topCountries'][0]);
          city1 = CityModel.fromMap(success.data['topCities'][0]);
          sex1 = SexesModel.fromMap(success.data['Sexes'][0]);
          sex2 = SexesModel.fromMap(success.data['Sexes'][1]);
          sex3 = SexesModel.fromMap(success.data['Sexes'][2]);
          isLoadingGraph.value = false;
          isLoading.value = false;
          update();
        },
      );
    } catch (error) {
      print('Error occurred while fetching artist statics data: $error');
    }
  }
}
