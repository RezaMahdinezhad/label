// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class EditProfileModelSend extends Equatable {
  String? username;
  String? email;
  String? bio;
  String? instagram_url;
  String? youtube_url;
  String? facebook_url;
  String? color1;
  String? color2;
  EditProfileModelSend({
    this.username,
    this.email,
    this.bio,
    this.instagram_url,
    this.youtube_url,
    this.facebook_url,
    this.color1,
    this.color2,
  });

  EditProfileModelSend copyWith({
    String? username,
    String? email,
    String? bio,
    String? instagram_url,
    String? youtube_url,
    String? facebook_url,
    String? color1,
    String? color2,
  }) {
    return EditProfileModelSend(
      username: username ?? this.username,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      instagram_url: instagram_url ?? this.instagram_url,
      youtube_url: youtube_url ?? this.youtube_url,
      facebook_url: facebook_url ?? this.facebook_url,
      color1: color1 ?? this.color1,
      color2: color2 ?? this.color2,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'bio': bio,
      'instagram_url': instagram_url,
      'youtube_url': youtube_url,
      'facebook_url': facebook_url,
      'color1': color1,
      'color2': color2,
    };
  }

  factory EditProfileModelSend.fromMap(Map<String, dynamic> map) {
    return EditProfileModelSend(
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
      instagram_url:
          map['instagram_url'] != null ? map['instagram_url'] as String : null,
      youtube_url:
          map['youtube_url'] != null ? map['youtube_url'] as String : null,
      facebook_url:
          map['facebook_url'] != null ? map['facebook_url'] as String : null,
      color1: map['color1'] != null ? map['color1'] as String : null,
      color2: map['color2'] != null ? map['color2'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EditProfileModelSend.fromJson(String source) =>
      EditProfileModelSend.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      username,
      email,
      bio,
      instagram_url,
      youtube_url,
      facebook_url,
      color1,
      color2,
    ];
  }
}
