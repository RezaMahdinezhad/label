// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LabelSingleArtist extends Equatable {
  int? artist_id;
  String? artist_name;
  String? s_picture_url;
  LabelSingleArtist({
    this.artist_id,
    this.artist_name,
    this.s_picture_url,
  });

  LabelSingleArtist copyWith({
    int? artist_id,
    String? artist_name,
    String? s_picture_url,
  }) {
    return LabelSingleArtist(
      artist_id: artist_id ?? this.artist_id,
      artist_name: artist_name ?? this.artist_name,
      s_picture_url: s_picture_url ?? this.s_picture_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'artist_id': artist_id,
      'artist_name': artist_name,
      's_picture_url': s_picture_url,
    };
  }

  factory LabelSingleArtist.fromMap(Map<String, dynamic> map) {
    return LabelSingleArtist(
      artist_id: map['artist_id'] != null ? map['artist_id'] as int : null,
      artist_name:
          map['artist_name'] != null ? map['artist_name'] as String : null,
      s_picture_url:
          map['s_picture_url'] != null ? map['s_picture_url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LabelSingleArtist.fromJson(String source) =>
      LabelSingleArtist.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [artist_id, artist_name, s_picture_url];
}
