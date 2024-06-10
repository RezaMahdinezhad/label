// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UploadTrackModel extends Equatable {
  String? track_name;
  int? genre_id;
  String? genre_name;
  int? is_album;
  String? album_name;
  String? language;
  String? track;
  String? cover;
  String? track_tag;
  String? sec_artists_name;
  String? lyrics;
  String? lyrics_by;
  String? produced_by;
  String? composer;
  int? spotify;
  int? apple_music;
  int? amazon_music;
  int? instagram;
  int? facebook;
  String? melody;
  int? youtube_music;
  UploadTrackModel({
    this.track_name,
    this.genre_id,
    this.genre_name,
    this.is_album,
    this.album_name,
    this.language,
    this.track,
    this.cover,
    this.track_tag,
    this.sec_artists_name,
    this.lyrics,
    this.lyrics_by,
    this.produced_by,
    this.composer,
    this.spotify,
    this.apple_music,
    this.amazon_music,
    this.instagram,
    this.facebook,
    this.melody,
    this.youtube_music,
  });

  UploadTrackModel copyWith({
    String? track_name,
    int? genre_id,
    String? genre_name,
    int? is_album,
    String? album_name,
    String? language,
    String? track,
    String? cover,
    String? track_tag,
    String? sec_artists_name,
    String? lyrics,
    String? lyrics_by,
    String? produced_by,
    String? composer,
    int? spotify,
    int? apple_music,
    int? amazon_music,
    int? instagram,
    int? facebook,
    String? melody,
    int? youtube_music,
  }) {
    return UploadTrackModel(
      track_name: track_name ?? this.track_name,
      genre_id: genre_id ?? this.genre_id,
      genre_name: genre_name ?? this.genre_name,
      is_album: is_album ?? this.is_album,
      album_name: album_name ?? this.album_name,
      language: language ?? this.language,
      track: track ?? this.track,
      cover: cover ?? this.cover,
      track_tag: track_tag ?? this.track_tag,
      sec_artists_name: sec_artists_name ?? this.sec_artists_name,
      lyrics: lyrics ?? this.lyrics,
      lyrics_by: lyrics_by ?? this.lyrics_by,
      produced_by: produced_by ?? this.produced_by,
      composer: composer ?? this.composer,
      spotify: spotify ?? this.spotify,
      apple_music: apple_music ?? this.apple_music,
      amazon_music: amazon_music ?? this.amazon_music,
      instagram: instagram ?? this.instagram,
      facebook: facebook ?? this.facebook,
      melody: melody ?? this.melody,
      youtube_music: youtube_music ?? this.youtube_music,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'track_name': track_name,
      'genre_id': genre_id,
      'genre_name': genre_name,
      'is_album': is_album,
      'album_name': album_name,
      'language': language,
      'track': track,
      'cover': cover,
      'track_tag': track_tag,
      'sec_artists_name': sec_artists_name,
      'lyrics': lyrics,
      'lyrics_by': lyrics_by,
      'produced_by': produced_by,
      'composer': composer,
      'spotify': spotify,
      'apple_music': apple_music,
      'amazon_music': amazon_music,
      'instagram': instagram,
      'facebook': facebook,
      'melody': melody,
      'youtube_music': youtube_music,
    };
  }

  factory UploadTrackModel.fromMap(Map<String, dynamic> map) {
    return UploadTrackModel(
      track_name:
          map['track_name'] != null ? map['track_name'] as String : null,
      genre_id: map['genre_id'] != null ? map['genre_id'] as int : null,
      genre_name:
          map['genre_name'] != null ? map['genre_name'] as String : null,
      is_album: map['is_album'] != null ? map['is_album'] as int : null,
      album_name:
          map['album_name'] != null ? map['album_name'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
      track: map['track'] != null ? map['track'] as String : null,
      cover: map['cover'] != null ? map['cover'] as String : null,
      track_tag: map['track_tag'] != null ? map['track_tag'] as String : null,
      sec_artists_name: map['sec_artists_name'] != null
          ? map['sec_artists_name'] as String
          : null,
      lyrics: map['lyrics'] != null ? map['lyrics'] as String : null,
      lyrics_by: map['lyrics_by'] != null ? map['lyrics_by'] as String : null,
      produced_by:
          map['produced_by'] != null ? map['produced_by'] as String : null,
      composer: map['composer'] != null ? map['composer'] as String : null,
      spotify: map['spotify'] != null ? map['spotify'] as int : null,
      apple_music:
          map['apple_music'] != null ? map['apple_music'] as int : null,
      amazon_music:
          map['amazon_music'] != null ? map['amazon_music'] as int : null,
      instagram: map['instagram'] != null ? map['instagram'] as int : null,
      facebook: map['facebook'] != null ? map['facebook'] as int : null,
      melody: map['melody'] != null ? map['melody'] as String : null,
      youtube_music:
          map['youtube_music'] != null ? map['youtube_music'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadTrackModel.fromJson(String source) =>
      UploadTrackModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      track_name,
      genre_id,
      genre_name,
      is_album,
      album_name,
      language,
      track,
      cover,
      track_tag,
      sec_artists_name,
      lyrics,
      lyrics_by,
      produced_by,
      composer,
      spotify,
      apple_music,
      amazon_music,
      instagram,
      facebook,
      melody,
      youtube_music,
    ];
  }
}
