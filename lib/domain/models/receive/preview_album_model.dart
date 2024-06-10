// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PreviewAlbumModel extends Equatable {
  String? name;
  String? picture_url;
  String? artist_name;
  PreviewAlbumModel({
    this.name,
    this.picture_url,
    this.artist_name,
  });

  PreviewAlbumModel copyWith({
    String? name,
    String? picture_url,
    String? artist_name,
  }) {
    return PreviewAlbumModel(
      name: name ?? this.name,
      picture_url: picture_url ?? this.picture_url,
      artist_name: artist_name ?? this.artist_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'picture_url': picture_url,
      'artist_name': artist_name,
    };
  }

  factory PreviewAlbumModel.fromMap(Map<String, dynamic> map) {
    return PreviewAlbumModel(
      name: map['name'] != null ? map['name'] as String : null,
      picture_url:
          map['picture_url'] != null ? map['picture_url'] as String : null,
      artist_name:
          map['artist_name'] != null ? map['artist_name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PreviewAlbumModel.fromJson(String source) =>
      PreviewAlbumModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, picture_url, artist_name];
}
