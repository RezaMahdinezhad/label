// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ArtistStaticsModel extends Equatable {
  String? artist_name;
  String? picture_url;
  int? listen_counter;
  int? download_counter;
  int? total_listener;
  int? like_counter;
  dynamic bank;
  dynamic total_incom;
  ArtistStaticsModel({
    this.artist_name,
    this.picture_url,
    this.listen_counter,
    this.download_counter,
    this.total_listener,
    this.like_counter,
    required this.bank,
    required this.total_incom,
  });

  ArtistStaticsModel copyWith({
    String? artist_name,
    String? picture_url,
    int? listen_counter,
    int? download_counter,
    int? total_listener,
    int? like_counter,
    dynamic bank,
    dynamic total_incom,
  }) {
    return ArtistStaticsModel(
      artist_name: artist_name ?? this.artist_name,
      picture_url: picture_url ?? this.picture_url,
      listen_counter: listen_counter ?? this.listen_counter,
      download_counter: download_counter ?? this.download_counter,
      total_listener: total_listener ?? this.total_listener,
      like_counter: like_counter ?? this.like_counter,
      bank: bank ?? this.bank,
      total_incom: total_incom ?? this.total_incom,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'artist_name': artist_name,
      'picture_url': picture_url,
      'listen_counter': listen_counter,
      'download_counter': download_counter,
      'total_listener': total_listener,
      'like_counter': like_counter,
      'bank': bank,
      'total_incom': total_incom,
    };
  }

  factory ArtistStaticsModel.fromMap(Map<String, dynamic> map) {
    return ArtistStaticsModel(
      artist_name:
          map['artist_name'] != null ? map['artist_name'] as String : null,
      picture_url:
          map['picture_url'] != null ? map['picture_url'] as String : null,
      listen_counter:
          map['listen_counter'] != null ? map['listen_counter'] as int : null,
      download_counter: map['download_counter'] != null
          ? map['download_counter'] as int
          : null,
      total_listener:
          map['total_listener'] != null ? map['total_listener'] as int : null,
      like_counter:
          map['like_counter'] != null ? map['like_counter'] as int : null,
      bank: map['bank'] as dynamic,
      total_incom: map['total_incom'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtistStaticsModel.fromJson(String source) =>
      ArtistStaticsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      artist_name,
      picture_url,
      listen_counter,
      download_counter,
      total_listener,
      like_counter,
      bank,
      total_incom,
    ];
  }
}
