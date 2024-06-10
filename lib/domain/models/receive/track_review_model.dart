// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class TrackReviewModel extends Equatable {
  String? track_name;
  String? track_tag;
  String? artist_name;
  String? sec_artists_name;
  String? genre_name;
  String? album_name;
  String? language;
  String? track_url;
  String? picture_url;
  String? lyrics;
  String? lyrics_by;
  String? produced_by;
  String? melody;
  String? composer;
  String? detailes;
  String? created_at;
  String? updated_at;
  int? id;
  int? is_album;
  int? artist_id;
  int? genre_id;
  int? spotify;
  int? apple_music;
  int? amazon_music;
  int? youtube_muisc;
  int? instagram;
  int? facebook;
  int? approved;
  int? is_upload;
  int? status;
  TrackReviewModel({
    this.track_name,
    this.track_tag,
    this.artist_name,
    this.sec_artists_name,
    this.genre_name,
    this.album_name,
    this.language,
    this.track_url,
    this.picture_url,
    this.lyrics,
    this.lyrics_by,
    this.produced_by,
    this.melody,
    this.composer,
    this.detailes,
    this.created_at,
    this.updated_at,
    this.id,
    this.is_album,
    this.artist_id,
    this.genre_id,
    this.spotify,
    this.apple_music,
    this.amazon_music,
    this.youtube_muisc,
    this.instagram,
    this.facebook,
    this.approved,
    this.is_upload,
    this.status,
  });

  TrackReviewModel copyWith({
    String? track_name,
    String? track_tag,
    String? artist_name,
    String? sec_artists_name,
    String? genre_name,
    String? album_name,
    String? language,
    String? track_url,
    String? picture_url,
    String? lyrics,
    String? lyrics_by,
    String? produced_by,
    String? melody,
    String? composer,
    String? detailes,
    String? created_at,
    String? updated_at,
    int? id,
    int? is_album,
    int? artist_id,
    int? genre_id,
    int? spotify,
    int? apple_music,
    int? amazon_music,
    int? youtube_muisc,
    int? instagram,
    int? facebook,
    int? approved,
    int? is_upload,
    int? status,
  }) {
    return TrackReviewModel(
      track_name: track_name ?? this.track_name,
      track_tag: track_tag ?? this.track_tag,
      artist_name: artist_name ?? this.artist_name,
      sec_artists_name: sec_artists_name ?? this.sec_artists_name,
      genre_name: genre_name ?? this.genre_name,
      album_name: album_name ?? this.album_name,
      language: language ?? this.language,
      track_url: track_url ?? this.track_url,
      picture_url: picture_url ?? this.picture_url,
      lyrics: lyrics ?? this.lyrics,
      lyrics_by: lyrics_by ?? this.lyrics_by,
      produced_by: produced_by ?? this.produced_by,
      melody: melody ?? this.melody,
      composer: composer ?? this.composer,
      detailes: detailes ?? this.detailes,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      id: id ?? this.id,
      is_album: is_album ?? this.is_album,
      artist_id: artist_id ?? this.artist_id,
      genre_id: genre_id ?? this.genre_id,
      spotify: spotify ?? this.spotify,
      apple_music: apple_music ?? this.apple_music,
      amazon_music: amazon_music ?? this.amazon_music,
      youtube_muisc: youtube_muisc ?? this.youtube_muisc,
      instagram: instagram ?? this.instagram,
      facebook: facebook ?? this.facebook,
      approved: approved ?? this.approved,
      is_upload: is_upload ?? this.is_upload,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'track_name': track_name,
      'track_tag': track_tag,
      'artist_name': artist_name,
      'sec_artists_name': sec_artists_name,
      'genre_name': genre_name,
      'album_name': album_name,
      'language': language,
      'track_url': track_url,
      'picture_url': picture_url,
      'lyrics': lyrics,
      'lyrics_by': lyrics_by,
      'produced_by': produced_by,
      'melody': melody,
      'composer': composer,
      'detailes': detailes,
      'created_at': created_at,
      'updated_at': updated_at,
      'id': id,
      'is_album': is_album,
      'artist_id': artist_id,
      'genre_id': genre_id,
      'spotify': spotify,
      'apple_music': apple_music,
      'amazon_music': amazon_music,
      'youtube_muisc': youtube_muisc,
      'instagram': instagram,
      'facebook': facebook,
      'approved': approved,
      'is_upload': is_upload,
      'status': status,
    };
  }

  factory TrackReviewModel.fromMap(Map<String, dynamic> map) {
    return TrackReviewModel(
      track_name:
          map['track_name'] != null ? map['track_name'] as String : null,
      track_tag: map['track_tag'] != null ? map['track_tag'] as String : null,
      artist_name:
          map['artist_name'] != null ? map['artist_name'] as String : null,
      sec_artists_name: map['sec_artists_name'] != null
          ? map['sec_artists_name'] as String
          : null,
      genre_name:
          map['genre_name'] != null ? map['genre_name'] as String : null,
      album_name:
          map['album_name'] != null ? map['album_name'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
      track_url: map['track_url'] != null ? map['track_url'] as String : null,
      picture_url:
          map['picture_url'] != null ? map['picture_url'] as String : null,
      lyrics: map['lyrics'] != null ? map['lyrics'] as String : null,
      lyrics_by: map['lyrics_by'] != null ? map['lyrics_by'] as String : null,
      produced_by:
          map['produced_by'] != null ? map['produced_by'] as String : null,
      melody: map['melody'] != null ? map['melody'] as String : null,
      composer: map['composer'] != null ? map['composer'] as String : null,
      detailes: map['detailes'] != null ? map['detailes'] as String : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      updated_at:
          map['updated_at'] != null ? map['updated_at'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      is_album: map['is_album'] != null ? map['is_album'] as int : null,
      artist_id: map['artist_id'] != null ? map['artist_id'] as int : null,
      genre_id: map['genre_id'] != null ? map['genre_id'] as int : null,
      spotify: map['spotify'] != null ? map['spotify'] as int : null,
      apple_music:
          map['apple_music'] != null ? map['apple_music'] as int : null,
      amazon_music:
          map['amazon_music'] != null ? map['amazon_music'] as int : null,
      youtube_muisc:
          map['youtube_muisc'] != null ? map['youtube_muisc'] as int : null,
      instagram: map['instagram'] != null ? map['instagram'] as int : null,
      facebook: map['facebook'] != null ? map['facebook'] as int : null,
      approved: map['approved'] != null ? map['approved'] as int : null,
      is_upload: map['is_upload'] != null ? map['is_upload'] as int : null,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackReviewModel.fromJson(String source) =>
      TrackReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      track_name,
      track_tag,
      artist_name,
      sec_artists_name,
      genre_name,
      album_name,
      language,
      track_url,
      picture_url,
      lyrics,
      lyrics_by,
      produced_by,
      melody,
      composer,
      detailes,
      created_at,
      updated_at,
      id,
      is_album,
      artist_id,
      genre_id,
      spotify,
      apple_music,
      amazon_music,
      youtube_muisc,
      instagram,
      facebook,
      approved,
      is_upload,
      status,
    ];
  }
}
