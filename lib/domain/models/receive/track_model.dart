// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class TrackModel extends Equatable {
  int? track_id;
  String? track_name;
  String? album_name;
  String? picture_url;
  String? artist_name;
  int? listen_counter;
  int? like_counter;
  TrackModel({
    this.track_id,
    this.track_name,
    this.album_name,
    this.picture_url,
    this.artist_name,
    this.listen_counter,
    this.like_counter,
  });

  TrackModel copyWith({
    int? track_id,
    String? track_name,
    String? album_name,
    String? picture_url,
    String? artist_name,
    int? listen_counter,
    int? like_counter,
  }) {
    return TrackModel(
      track_id: track_id ?? this.track_id,
      track_name: track_name ?? this.track_name,
      album_name: album_name ?? this.album_name,
      picture_url: picture_url ?? this.picture_url,
      artist_name: artist_name ?? this.artist_name,
      listen_counter: listen_counter ?? this.listen_counter,
      like_counter: like_counter ?? this.like_counter,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'track_id': track_id,
      'track_name': track_name,
      'album_name': album_name,
      'picture_url': picture_url,
      'artist_name': artist_name,
      'listen_counter': listen_counter,
      'like_counter': like_counter,
    };
  }

  factory TrackModel.fromMap(Map<String, dynamic> map) {
    return TrackModel(
      track_id: map['track_id'] != null ? map['track_id'] as int : null,
      track_name:
          map['track_name'] != null ? map['track_name'] as String : null,
      album_name:
          map['album_name'] != null ? map['album_name'] as String : null,
      picture_url:
          map['picture_url'] != null ? map['picture_url'] as String : null,
      artist_name:
          map['artist_name'] != null ? map['artist_name'] as String : null,
      listen_counter:
          map['listen_counter'] != null ? map['listen_counter'] as int : null,
      like_counter:
          map['like_counter'] != null ? map['like_counter'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackModel.fromJson(String source) =>
      TrackModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      track_id,
      track_name,
      album_name,
      picture_url,
      artist_name,
      listen_counter,
      like_counter,
    ];
  }
}
