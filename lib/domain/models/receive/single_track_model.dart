// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SingleTrackModel extends Equatable {
  String? track_name;
  String? album_name;
  String? picture_url;
  int? listen_counter;
  int? like_counter;
  int? download_counter;
  int? total_listener;
  dynamic track_income;
  dynamic CPM;
  SingleTrackModel({
    this.track_name,
    this.album_name,
    this.picture_url,
    this.listen_counter,
    this.like_counter,
    this.download_counter,
    this.total_listener,
    required this.track_income,
    required this.CPM,
  });

  SingleTrackModel copyWith({
    String? track_name,
    String? album_name,
    String? picture_url,
    int? listen_counter,
    int? like_counter,
    int? download_counter,
    int? total_listener,
    dynamic track_income,
    dynamic CPM,
  }) {
    return SingleTrackModel(
      track_name: track_name ?? this.track_name,
      album_name: album_name ?? this.album_name,
      picture_url: picture_url ?? this.picture_url,
      listen_counter: listen_counter ?? this.listen_counter,
      like_counter: like_counter ?? this.like_counter,
      download_counter: download_counter ?? this.download_counter,
      total_listener: total_listener ?? this.total_listener,
      track_income: track_income ?? this.track_income,
      CPM: CPM ?? this.CPM,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'track_name': track_name,
      'album_name': album_name,
      'picture_url': picture_url,
      'listen_counter': listen_counter,
      'like_counter': like_counter,
      'download_counter': download_counter,
      'total_listener': total_listener,
      'track_income': track_income,
      'CPM': CPM,
    };
  }

  factory SingleTrackModel.fromMap(Map<String, dynamic> map) {
    return SingleTrackModel(
      track_name:
          map['track_name'] != null ? map['track_name'] as String : null,
      album_name:
          map['album_name'] != null ? map['album_name'] as String : null,
      picture_url:
          map['picture_url'] != null ? map['picture_url'] as String : null,
      listen_counter:
          map['listen_counter'] != null ? map['listen_counter'] as int : null,
      like_counter:
          map['like_counter'] != null ? map['like_counter'] as int : null,
      download_counter: map['download_counter'] != null
          ? map['download_counter'] as int
          : null,
      total_listener:
          map['total_listener'] != null ? map['total_listener'] as int : null,
      track_income: map['track_income'] as dynamic,
      CPM: map['CPM'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory SingleTrackModel.fromJson(String source) =>
      SingleTrackModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      track_name,
      album_name,
      picture_url,
      listen_counter,
      like_counter,
      download_counter,
      total_listener,
      track_income,
      CPM,
    ];
  }
}
