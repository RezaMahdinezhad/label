// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LabelAllArtists extends Equatable {
  String? name;
  int? artist_id;
  String? picture_url;
  LabelAllArtists({
    this.name,
    this.artist_id,
    this.picture_url,
  });

  LabelAllArtists copyWith({
    String? name,
    int? artist_id,
    String? picture_url,
  }) {
    return LabelAllArtists(
      name: name ?? this.name,
      artist_id: artist_id ?? this.artist_id,
      picture_url: picture_url ?? this.picture_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'artist_id': artist_id,
      'picture_url': picture_url,
    };
  }

  factory LabelAllArtists.fromMap(Map<String, dynamic> map) {
    return LabelAllArtists(
      name: map['name'] != null ? map['name'] as String : null,
      artist_id: map['artist_id'] != null ? map['artist_id'] as int : null,
      picture_url:
          map['picture_url'] != null ? map['picture_url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LabelAllArtists.fromJson(String source) =>
      LabelAllArtists.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, artist_id, picture_url];
}
