// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PreviewArtistModel extends Equatable {
  String? name;
  String? description;
  String? picture_url;
  int? listen_counter;
  int? followers;
  int? is_user;
  String? instagram_url;
  String? youtube_url;
  String? facebook_url;
  String? twitter_url;
  String? snapchat_url;
  PreviewArtistModel({
    this.name,
    this.description,
    this.picture_url,
    this.listen_counter,
    this.followers,
    this.is_user,
    this.instagram_url,
    this.youtube_url,
    this.facebook_url,
    this.twitter_url,
    this.snapchat_url,
  });

  PreviewArtistModel copyWith({
    String? name,
    String? description,
    String? picture_url,
    int? listen_counter,
    int? followers,
    int? is_user,
    String? instagram_url,
    String? youtube_url,
    String? facebook_url,
    String? twitter_url,
    String? snapchat_url,
  }) {
    return PreviewArtistModel(
      name: name ?? this.name,
      description: description ?? this.description,
      picture_url: picture_url ?? this.picture_url,
      listen_counter: listen_counter ?? this.listen_counter,
      followers: followers ?? this.followers,
      is_user: is_user ?? this.is_user,
      instagram_url: instagram_url ?? this.instagram_url,
      youtube_url: youtube_url ?? this.youtube_url,
      facebook_url: facebook_url ?? this.facebook_url,
      twitter_url: twitter_url ?? this.twitter_url,
      snapchat_url: snapchat_url ?? this.snapchat_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'picture_url': picture_url,
      'listen_counter': listen_counter,
      'followers': followers,
      'is_user': is_user,
      'instagram_url': instagram_url,
      'youtube_url': youtube_url,
      'facebook_url': facebook_url,
      'twitter_url': twitter_url,
      'snapchat_url': snapchat_url,
    };
  }

  factory PreviewArtistModel.fromMap(Map<String, dynamic> map) {
    return PreviewArtistModel(
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      picture_url:
          map['picture_url'] != null ? map['picture_url'] as String : null,
      listen_counter:
          map['listen_counter'] != null ? map['listen_counter'] as int : null,
      followers: map['followers'] != null ? map['followers'] as int : null,
      is_user: map['is_user'] != null ? map['is_user'] as int : null,
      instagram_url:
          map['instagram_url'] != null ? map['instagram_url'] as String : null,
      youtube_url:
          map['youtube_url'] != null ? map['youtube_url'] as String : null,
      facebook_url:
          map['facebook_url'] != null ? map['facebook_url'] as String : null,
      twitter_url:
          map['twitter_url'] != null ? map['twitter_url'] as String : null,
      snapchat_url:
          map['snapchat_url'] != null ? map['snapchat_url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PreviewArtistModel.fromJson(String source) =>
      PreviewArtistModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      name,
      description,
      picture_url,
      listen_counter,
      followers,
      is_user,
      instagram_url,
      youtube_url,
      facebook_url,
      twitter_url,
      snapchat_url,
    ];
  }
}
