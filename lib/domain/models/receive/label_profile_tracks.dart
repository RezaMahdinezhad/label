// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LabelProfileTracksModel extends Equatable {
  int? trackId;
  String? date;
  String? track_name;
  String? picture_url;
  String? artist_name;
  String? country;
  String? city;
  dynamic value;
  LabelProfileTracksModel({
    this.trackId,
    this.date,
    this.track_name,
    this.picture_url,
    this.artist_name,
    this.country,
    this.city,
    this.value,
  });

  LabelProfileTracksModel copyWith({
    int? trackId,
    String? date,
    String? track_name,
    String? picture_url,
    String? artist_name,
    String? country,
    String? city,
    dynamic value,
  }) {
    return LabelProfileTracksModel(
      trackId: trackId ?? this.trackId,
      date: date ?? this.date,
      track_name: track_name ?? this.track_name,
      picture_url: picture_url ?? this.picture_url,
      artist_name: artist_name ?? this.artist_name,
      country: country ?? this.country,
      city: city ?? this.city,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'trackId': trackId,
      'date': date,
      'track_name': track_name,
      'picture_url': picture_url,
      'artist_name': artist_name,
      'country': country,
      'city': city,
      'value': value,
    };
  }

  factory LabelProfileTracksModel.fromMap(Map<String, dynamic> map) {
    return LabelProfileTracksModel(
      trackId: map['trackId'] != null ? map['trackId'] as int : null,
      date: map['date'] != null ? map['date'] as String : null,
      track_name:
          map['track_name'] != null ? map['track_name'] as String : null,
      picture_url:
          map['picture_url'] != null ? map['picture_url'] as String : null,
      artist_name:
          map['artist_name'] != null ? map['artist_name'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      value: map['value'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory LabelProfileTracksModel.fromJson(String source) =>
      LabelProfileTracksModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      trackId,
      date,
      track_name,
      picture_url,
      artist_name,
      country,
      city,
      value,
    ];
  }
}
