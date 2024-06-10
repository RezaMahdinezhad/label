import 'package:label/common/helper/screen_helper.dart';
import 'package:label/domain/repository/remote/endpoint.dart';
import 'package:label/presentation/artist_screen/artist_controller.dart';
import 'package:label/presentation/trackchart/track_chart_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TrackChartScreen extends StatelessWidget {
  final String trackId;
  final String trackName;
  // TrackChartScreen({super.key});
  TrackChartScreen(this.trackId, this.trackName);
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TrackChartController());

    controller.setTrackId(trackId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          '${trackName}',
          style: TextStyle(color: Color(0xff3B4E5F)),
        ),
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset('assets/TrackChart/arrow-back.svg')),
      ),
      body: GetBuilder<TrackChartController>(
        builder: (_) {
          return controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  ScreenHelper().setRadius(10),
                                ),
                              ),
                              child: CachedNetworkImage(
                                  errorWidget: (context, url, error) {
                                    return SvgPicture.asset(
                                        'assets/LogIn/dangify-artists.svg');
                                  },
                                  fit: BoxFit.cover,
                                  height: ScreenHelper().setRadius(150),
                                  width: ScreenHelper().setRadius(150),
                                  imageUrl:
                                      '${EndPoint.base + controller.singleTrackData.picture_url.toString()}'),
                            ),
                            SizedBox(
                              height: ScreenHelper().setheight(10),
                            ),
                            Text(
                              controller.singleTrackData.track_name.toString(),
                              style: TextStyle(
                                fontSize: ScreenHelper().setFont(18),
                              ),
                            ),
                            SizedBox(
                              height: ScreenHelper().setheight(10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${controller.formatNumber(controller.singleTrackData.listen_counter!)}',
                                      style: TextStyle(
                                          fontSize: ScreenHelper().setFont(20),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'Played',
                                      style: TextStyle(
                                          fontSize: ScreenHelper().setFont(18),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: ScreenHelper().setWidth(20),
                                ),
                                Container(
                                  height: ScreenHelper().setheight(20),
                                  width: ScreenHelper().setWidth(1),
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                ),
                                SizedBox(
                                  width: ScreenHelper().setWidth(20),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.singleTrackData.track_income !=
                                                  0.0 &&
                                              controller.singleTrackData
                                                      .track_income! <=
                                                  0.5
                                          ? '<1\$'
                                          : '${controller.singleTrackData.track_income!.toStringAsFixed(2)}\$',
                                      style: TextStyle(
                                          fontSize: ScreenHelper().setFont(20),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'Income',
                                      style: TextStyle(
                                          fontSize: ScreenHelper().setFont(18),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenHelper().setheight(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: ScreenHelper().setWidth(40),
                            ),
                            Column(children: [
                              Text(
                                '${controller.formatNumber(controller.singleTrackData.like_counter!)}',
                                style: TextStyle(
                                    fontSize: ScreenHelper().setFont(14),
                                    color: Color(0xff3B4E5F)),
                              ),
                              SizedBox(
                                height: ScreenHelper().setheight(5),
                              ),
                              Text(
                                'Like',
                                style: TextStyle(
                                    fontSize: ScreenHelper().setFont(14),
                                    color: Color(0xff3B4E5F).withOpacity(0.5)),
                              ),
                            ]),
                            Spacer(),
                            Column(children: [
                              Text(
                                '${controller.formatNumber(controller.singleTrackData.download_counter!)}',
                                style: TextStyle(
                                    fontSize: ScreenHelper().setFont(14),
                                    color: Color(0xff3B4E5F)),
                              ),
                              SizedBox(
                                height: ScreenHelper().setheight(5),
                              ),
                              Text(
                                'Download',
                                style: TextStyle(
                                    fontSize: ScreenHelper().setFont(14),
                                    color: Color(0xff3B4E5F).withOpacity(0.5)),
                              ),
                            ]),
                            Spacer(),
                            Column(
                              children: [
                                Text(
                                  '${controller.formatNumber(controller.singleTrackData.total_listener!)}',
                                  style: TextStyle(
                                      fontSize: ScreenHelper().setFont(14),
                                      color: Color(0xff3B4E5F)),
                                ),
                                SizedBox(
                                  height: ScreenHelper().setheight(5),
                                ),
                                Text(
                                  'Listeners',
                                  style: TextStyle(
                                      fontSize: ScreenHelper().setFont(14),
                                      color:
                                          Color(0xff3B4E5F).withOpacity(0.5)),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Text(
                                  controller.singleTrackData.CPM != 0.0 &&
                                          controller.singleTrackData.CPM! <= 0.5
                                      ? '<1\$'
                                      : '${controller.singleTrackData.CPM!.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: ScreenHelper().setFont(14),
                                      color: Color(0xff3B4E5F)),
                                ),
                                SizedBox(
                                  height: ScreenHelper().setheight(5),
                                ),
                                Text(
                                  'CPM',
                                  style: TextStyle(
                                      fontSize: ScreenHelper().setFont(14),
                                      color:
                                          Color(0xff3B4E5F).withOpacity(0.5)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: ScreenHelper().setWidth(40),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenHelper().setheight(50),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenHelper().setWidth(30),
                            ),
                            Text(
                              'Income',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenHelper().setFont(16),
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            SizedBox(
                              width: ScreenHelper().setWidth(250),
                              child: CupertinoSegmentedControl(
                                  selectedColor: Color(0xff6AAFD6),
                                  borderColor: Colors.black,
                                  children: controller.items,
                                  groupValue: controller.selectedDayIndex.value,
                                  onValueChanged: (value) {
                                    if (value == 0) {
                                      controller.days.value = '7';
                                      controller.selectedDayIndex.value = value;
                                      controller.isLoadingGraph.value = true;
                                      controller.getSingleTrackChartData(
                                          trackId, '7');
                                      controller.update();
                                    } else if (value == 1) {
                                      controller.isLoadingGraph.value = true;
                                      controller.days.value = '28';
                                      controller.selectedDayIndex.value = value;

                                      controller.getSingleTrackChartData(
                                          trackId, '28');
                                      controller.update();
                                    } else {
                                      controller.days.value = '90';
                                      controller.selectedDayIndex.value = value;
                                      controller.isLoadingGraph.value = true;

                                      controller.getSingleTrackChartData(
                                          trackId, '90');
                                      controller.update();
                                    }
                                  }),
                            ),
                          ],
                        ),
                        controller.isLoadingGraph == false
                            ? GetBuilder<ArtistDataController>(builder: (_) {
                                final List<FlSpot> spots = [];

                                int index = 0;
                                for (final entry
                                    in controller.incomeDate.entries) {
                                  final x =
                                      index.toDouble(); // Use index as x-value
                                  final y = entry.value.toDouble();
                                  spots.add(FlSpot(x, y));
                                  index++;
                                }
                                return SingleChildScrollView(
                                  padding: EdgeInsets.only(
                                    top: ScreenHelper().setheight(50),
                                    left: ScreenHelper().setWidth(15),
                                    right: ScreenHelper().setWidth(5),
                                    bottom: ScreenHelper().setheight(20),
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  reverse: true,
                                  child: SizedBox(
                                    width: ScreenHelper()
                                        .setWidth(controller.days == '7'
                                            ? 350
                                            : controller.days == '28'
                                                ? 1000
                                                : 2000),
                                    height: ScreenHelper().setheight(300),
                                    child: LineChart(
                                      LineChartData(
                                        gridData: FlGridData(show: true),
                                        titlesData: FlTitlesData(
                                          leftTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false),
                                          ),
                                          rightTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              reservedSize:
                                                  ScreenHelper().setRadius(50),
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) {
                                                if (value % 5 == 0) {
                                                  return Padding(
                                                    padding: EdgeInsets.all(
                                                        ScreenHelper()
                                                            .setRadius(12)),
                                                    child: Text(
                                                        '${value.toStringAsFixed(1)}'),
                                                  );
                                                }
                                                return const SizedBox();
                                              },
                                            ),
                                          ),
                                          topTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                  showTitles: false)),
                                          bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              reservedSize: 22,
                                              getTitlesWidget: (value, meta) {
                                                final index = value.toInt();
                                                if (index % 3 == 0 &&
                                                    index < spots.length) {
                                                  final date = DateTime.parse(
                                                      controller.incomeDate.keys
                                                          .elementAt(index));
                                                  return Text(
                                                    '${date.day}-${date.month}',
                                                    style: TextStyle(
                                                        fontSize: ScreenHelper()
                                                            .setRadius(12)),
                                                  );
                                                }
                                                return const SizedBox();
                                              },
                                            ),
                                          ),
                                        ),
                                        borderData: FlBorderData(
                                          show: true,
                                        ),
                                        lineBarsData: [
                                          LineChartBarData(
                                            spots: spots,
                                            isCurved: false,
                                            dotData: FlDotData(show: true),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                            : Padding(
                                padding: EdgeInsets.all(
                                    ScreenHelper().setRadius(100)),
                                child: CircularProgressIndicator()),
                        SizedBox(
                          height: ScreenHelper().setheight(15),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenHelper().setWidth(30),
                            ),
                            Text(
                              'Listener',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenHelper().setFont(16),
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                          ],
                        ),
                        controller.isLoadingGraph == false
                            ? GetBuilder<ArtistDataController>(builder: (_) {
                                final List<FlSpot> spots = [];

                                int index = 0;
                                for (final entry
                                    in controller.chartDate.entries) {
                                  final x =
                                      index.toDouble(); // Use index as x-value
                                  final y = entry.value.toDouble();
                                  spots.add(FlSpot(x, y));
                                  index++;
                                }
                                return SingleChildScrollView(
                                  padding: EdgeInsets.only(
                                    top: ScreenHelper().setheight(50),
                                    left: ScreenHelper().setWidth(15),
                                    right: ScreenHelper().setWidth(5),
                                    bottom: ScreenHelper().setheight(20),
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  reverse: true,
                                  child: SizedBox(
                                    width: ScreenHelper()
                                        .setWidth(controller.days == '7'
                                            ? 350
                                            : controller.days == '28'
                                                ? 1000
                                                : 2000),
                                    height: ScreenHelper().setheight(300),
                                    child: LineChart(
                                      LineChartData(
                                        gridData: FlGridData(show: true),
                                        titlesData: FlTitlesData(
                                          leftTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                  showTitles: false)),
                                          rightTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              reservedSize:
                                                  ScreenHelper().setRadius(50),
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) {
                                                if (value % 5 == 0) {
                                                  return Padding(
                                                    padding: EdgeInsets.all(
                                                        ScreenHelper()
                                                            .setRadius(12)),
                                                    child: Text(
                                                        '${value.toStringAsFixed(0)}'),
                                                  );
                                                }
                                                return const SizedBox();
                                              },
                                            ),
                                          ),
                                          topTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                  showTitles: false)),
                                          bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              reservedSize: 22,
                                              getTitlesWidget: (value, meta) {
                                                final index = value.toInt();
                                                if (index % 3 == 0 &&
                                                    index < spots.length) {
                                                  final date = DateTime.parse(
                                                      controller.chartDate.keys
                                                          .elementAt(index));
                                                  return Text(
                                                    '${date.day}-${date.month}',
                                                    style: TextStyle(
                                                        fontSize: ScreenHelper()
                                                            .setRadius(12)),
                                                  );
                                                }
                                                return const SizedBox();
                                              },
                                            ),
                                          ),
                                        ),
                                        borderData: FlBorderData(
                                          show: true,
                                        ),
                                        lineBarsData: [
                                          LineChartBarData(
                                            spots: spots,
                                            isCurved: false,
                                            dotData: FlDotData(show: true),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                            : Padding(
                                padding: EdgeInsets.all(
                                    ScreenHelper().setRadius(100)),
                                child: CircularProgressIndicator()),
                        SizedBox(
                          height: ScreenHelper().setheight(15),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenHelper().setWidth(30),
                            ),
                            Text(
                              'Most Location',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: ScreenHelper().setWidth(200),
                              child: CupertinoSegmentedControl(
                                  selectedColor: Color(0xff6AAFD6),
                                  borderColor: Colors.black,
                                  children: controller.locationItems,
                                  groupValue:
                                      controller.selectedLocationIndex.value,
                                  onValueChanged: (value) {
                                    if (value == 0) {
                                      controller.selectedLocationIndex.value =
                                          value;
                                      controller.update();
                                    } else if (value == 1) {
                                      controller.selectedLocationIndex.value =
                                          value;
                                      controller.update();
                                    } else {
                                      controller.selectedLocationIndex.value =
                                          value;
                                      controller.update();
                                    }
                                  }),
                            ),
                            Spacer(),
                            SizedBox(
                              width: ScreenHelper().setWidth(30),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenHelper().setheight(20),
                        ),
                        controller.selectedLocationIndex == 0
                            ? Column(
                                children: [
                                  controller.country1.country == 'Other' &&
                                          double.parse(controller
                                                  .country1.percent!) ==
                                              100.0
                                      ? SizedBox()
                                      : SizedBox(
                                          width: ScreenHelper().setWidth(330),
                                          height: ScreenHelper().setheight(330),
                                          child: PieChart(
                                            PieChartData(
                                              centerSpaceRadius: 0,
                                              sections: List.generate(
                                                controller.topCountries.length >
                                                        3
                                                    ? 3
                                                    : controller
                                                        .topCountries.length,
                                                (index) {
                                                  final topCountry = controller
                                                      .topCountries[index];
                                                  return PieChartSectionData(
                                                    color: controller
                                                        .getColorForChart(
                                                            index),
                                                    value: double.parse(
                                                        topCountry.percent!),
                                                    title: '',
                                                    radius: ScreenHelper()
                                                        .setRadius(150),
                                                  );
                                                },
                                              )..addAll([
                                                  if (controller
                                                          .topCountries.length >
                                                      3)
                                                    PieChartSectionData(
                                                      color: controller
                                                          .color4, // You can set a color for "Others"
                                                      value: controller
                                                          .calculateSumOfCountryPercentValues(
                                                              3,
                                                              5), // Calculate the sum of percent values
                                                      title: '',
                                                      radius: ScreenHelper()
                                                          .setRadius(150),
                                                    ),
                                                ]),
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    height: ScreenHelper().setheight(15),
                                  ),
                                  Column(
                                    children: [
                                      for (int i = 0;
                                          i < controller.topCountries.length &&
                                              i < 3;
                                          i++) ...[
                                        controller.country1.country ==
                                                    'Other' &&
                                                double.parse(controller
                                                        .country1.percent!) ==
                                                    100.0
                                            ? Text(
                                                'No data available for ${controller.days} days ago of this song.')
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: ScreenHelper()
                                                        .setWidth(48),
                                                  ),
                                                  Container(
                                                    width: ScreenHelper()
                                                        .setWidth(10),
                                                    height: ScreenHelper()
                                                        .setheight(10),
                                                    decoration: BoxDecoration(
                                                      color: controller
                                                          .getColorForChart(i),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  100)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: ScreenHelper()
                                                        .setWidth(5),
                                                  ),
                                                  Text(controller
                                                      .topCountries[i]
                                                      .country!),
                                                  Spacer(),
                                                  Text(
                                                    '${double.parse(controller.topCountries[i].percent!).round()} %',
                                                  ),
                                                  SizedBox(
                                                    width: ScreenHelper()
                                                        .setWidth(48),
                                                  ),
                                                ],
                                              ),
                                        SizedBox(
                                          height: ScreenHelper().setheight(10),
                                        ),
                                      ],
                                      if (controller.topCountries.length >
                                          3) ...[
                                        Row(
                                          children: [
                                            SizedBox(
                                              width:
                                                  ScreenHelper().setWidth(48),
                                            ),
                                            Container(
                                              width:
                                                  ScreenHelper().setWidth(10),
                                              height:
                                                  ScreenHelper().setheight(10),
                                              decoration: BoxDecoration(
                                                color: controller
                                                    .color4, // You can set a color for "Others"
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100)),
                                              ),
                                            ),
                                            SizedBox(
                                              width: ScreenHelper().setWidth(5),
                                            ),
                                            Text('Etc.'),
                                            Spacer(),
                                            Text(
                                              '${controller.calculateSumOfCountryPercentValues(3, 5).round()} %',
                                            ),
                                            SizedBox(
                                              width:
                                                  ScreenHelper().setWidth(48),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  controller.city1.city == 'Other' &&
                                          double.parse(
                                                  controller.city1.percent!) ==
                                              100.0
                                      ? SizedBox()
                                      : SizedBox(
                                          width: ScreenHelper().setWidth(330),
                                          height: ScreenHelper().setheight(330),
                                          child: PieChart(
                                            PieChartData(
                                              centerSpaceRadius: 0,
                                              sections: List.generate(
                                                controller.topCities.length > 3
                                                    ? 3
                                                    : controller
                                                        .topCities.length,
                                                (index) {
                                                  final topCity = controller
                                                      .topCities[index];
                                                  return PieChartSectionData(
                                                    color: controller
                                                        .getColorForChart(
                                                            index),
                                                    value: double.parse(
                                                        topCity.percent!),
                                                    title: '',
                                                    radius: ScreenHelper()
                                                        .setRadius(150),
                                                  );
                                                },
                                              )..addAll([
                                                  if (controller
                                                          .topCities.length >
                                                      3)
                                                    PieChartSectionData(
                                                      color: controller
                                                          .color4, // You can set a color for "Others"
                                                      value: controller
                                                          .calculateSumOfPercentValuesInCities(
                                                              3,
                                                              5), // Calculate the sum of percent values
                                                      title: '',
                                                      radius: ScreenHelper()
                                                          .setRadius(150),
                                                    ),
                                                ]),
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    height: ScreenHelper().setheight(15),
                                  ),
                                  Column(
                                    children: [
                                      for (int i = 0;
                                          i < controller.topCities.length &&
                                              i < 3;
                                          i++) ...[
                                        controller.city1.city == 'Other' &&
                                                double.parse(controller
                                                        .city1.percent!) ==
                                                    100.0
                                            ? Text(
                                                'No data available for ${controller.days} days ago of this song.')
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: ScreenHelper()
                                                        .setWidth(48),
                                                  ),
                                                  Container(
                                                    width: ScreenHelper()
                                                        .setWidth(10),
                                                    height: ScreenHelper()
                                                        .setheight(10),
                                                    decoration: BoxDecoration(
                                                      color: controller
                                                          .getColorForChart(i),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  100)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: ScreenHelper()
                                                        .setWidth(5),
                                                  ),
                                                  Text(controller
                                                      .topCities[i].city!),
                                                  Spacer(),
                                                  Text(
                                                    '${double.parse(controller.topCities[i].percent!).round()} %',
                                                  ),
                                                  SizedBox(
                                                    width: ScreenHelper()
                                                        .setWidth(48),
                                                  ),
                                                ],
                                              ),
                                        SizedBox(
                                          height: ScreenHelper().setheight(10),
                                        ),
                                      ],
                                      if (controller.topCities.length > 3) ...[
                                        Row(
                                          children: [
                                            SizedBox(
                                              width:
                                                  ScreenHelper().setWidth(48),
                                            ),
                                            Container(
                                              width:
                                                  ScreenHelper().setWidth(10),
                                              height:
                                                  ScreenHelper().setheight(10),
                                              decoration: BoxDecoration(
                                                color: controller
                                                    .color4, // You can set a color for "Others"
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100)),
                                              ),
                                            ),
                                            SizedBox(
                                              width: ScreenHelper().setWidth(5),
                                            ),
                                            Text('Etc.'),
                                            Spacer(),
                                            Text(
                                              '${controller.calculateSumOfPercentValuesInCities(3, 5).round()} %',
                                            ),
                                            SizedBox(
                                              width:
                                                  ScreenHelper().setWidth(48),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: ScreenHelper().setheight(50),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenHelper().setWidth(30),
                            ),
                            Text(
                              'Average Gender',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: ScreenHelper().setheight(20),
                        ),
                        Column(
                          children: [
                            (double.parse(controller.sex1.percent!) == 0.0 &&
                                    double.parse(controller.sex2.percent!) ==
                                        0.0 &&
                                    double.parse(controller.sex3.percent!) ==
                                        0.0)
                                ? SizedBox()
                                : SizedBox(
                                    width: ScreenHelper().setWidth(330),
                                    height: ScreenHelper().setheight(330),
                                    child: PieChart(
                                      PieChartData(
                                          centerSpaceRadius: 0,
                                          sections: List.generate(
                                              controller.topSexes.length,
                                              (index) {
                                            final topSexes =
                                                controller.topSexes[index];

                                            return PieChartSectionData(
                                              color: controller
                                                  .getColorForChart(index),
                                              value: double.parse(
                                                  topSexes.percent!),
                                              title: '',
                                              radius:
                                                  ScreenHelper().setRadius(150),
                                            );
                                          })),
                                    ),
                                  ),
                            SizedBox(
                              height: ScreenHelper().setheight(15),
                            ),
                            ((double.parse(controller.sex1.percent!) == 0.0 &&
                                    double.parse(controller.sex2.percent!) ==
                                        0.0 &&
                                    double.parse(controller.sex3.percent!) ==
                                        0.0))
                                ? Text(
                                    'No data available for ${controller.days} days ago of this song.')
                                : Column(
                                    children: [
                                      for (int i = 0;
                                          i < controller.topSexes.length;
                                          i++) ...[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width:
                                                  ScreenHelper().setWidth(48),
                                            ),
                                            Container(
                                              width:
                                                  ScreenHelper().setWidth(10),
                                              height:
                                                  ScreenHelper().setheight(10),
                                              decoration: BoxDecoration(
                                                color: controller
                                                    .getColorForChart(i),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100)),
                                              ),
                                            ),
                                            SizedBox(
                                              width: ScreenHelper().setWidth(5),
                                            ),
                                            Text(controller.topSexes[i].sex!),
                                            Spacer(),
                                            Text(
                                              '${double.parse(controller.topSexes[i].percent!).round()} %',
                                            ),
                                            SizedBox(
                                              width:
                                                  ScreenHelper().setWidth(48),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: ScreenHelper().setheight(10),
                                        ),
                                      ],
                                      if (controller.topSexes.length > 3) ...[
                                        Row(
                                          children: [
                                            SizedBox(
                                              width:
                                                  ScreenHelper().setWidth(48),
                                            ),
                                            Container(
                                              width:
                                                  ScreenHelper().setWidth(10),
                                              height:
                                                  ScreenHelper().setheight(10),
                                              decoration: BoxDecoration(
                                                color: Colors
                                                    .grey, // You can set a color for "Others"
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100)),
                                              ),
                                            ),
                                            SizedBox(
                                              width: ScreenHelper().setWidth(5),
                                            ),
                                            Text('Etc.'),
                                            Spacer(),
                                            Text(
                                              '${controller.calculateSumOfPercentValuesInCities(3, 5).round()} %',
                                            ),
                                            SizedBox(
                                              width:
                                                  ScreenHelper().setWidth(48),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ],
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenHelper().setheight(50),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
