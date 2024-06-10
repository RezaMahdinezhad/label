// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ReviewTrackModel extends Equatable {
  String? album_name;
  String? name;
  String? track_name;
  String? track_url;
  int? track_id;
  String? picture_url;
  String? artist_name;
  ReviewTrackModel({
    this.album_name,
    this.name,
    this.track_name,
    this.track_url,
    this.track_id,
    this.picture_url,
    this.artist_name,
  });

  ReviewTrackModel copyWith({
    String? album_name,
    String? name,
    String? track_name,
    String? track_url,
    int? track_id,
    String? picture_url,
    String? artist_name,
  }) {
    return ReviewTrackModel(
      album_name: album_name ?? this.album_name,
      name: name ?? this.name,
      track_name: track_name ?? this.track_name,
      track_url: track_url ?? this.track_url,
      track_id: track_id ?? this.track_id,
      picture_url: picture_url ?? this.picture_url,
      artist_name: artist_name ?? this.artist_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'album_name': album_name,
      'name': name,
      'track_name': track_name,
      'track_url': track_url,
      'track_id': track_id,
      'picture_url': picture_url,
      'artist_name': artist_name,
    };
  }

  factory ReviewTrackModel.fromMap(Map<String, dynamic> map) {
    return ReviewTrackModel(
      album_name:
          map['album_name'] != null ? map['album_name'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      track_name:
          map['track_name'] != null ? map['track_name'] as String : null,
      track_url: map['track_url'] != null ? map['track_url'] as String : null,
      track_id: map['track_id'] != null ? map['track_id'] as int : null,
      picture_url:
          map['picture_url'] != null ? map['picture_url'] as String : null,
      artist_name:
          map['artist_name'] != null ? map['artist_name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewTrackModel.fromJson(String source) =>
      ReviewTrackModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      album_name,
      name,
      track_name,
      track_url,
      track_id,
      picture_url,
      artist_name,
    ];
  }
}
