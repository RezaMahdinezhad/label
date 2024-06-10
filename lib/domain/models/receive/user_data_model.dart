// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserdataModel extends Equatable {
  String? username;
  String? name;
  String? email;
  String? cover_url;
  String? picture_url;
  UserdataModel({
    this.username,
    this.name,
    this.email,
    this.cover_url,
    this.picture_url,
  });

  UserdataModel copyWith({
    String? username,
    String? name,
    String? email,
    String? cover_url,
    String? picture_url,
  }) {
    return UserdataModel(
      username: username ?? this.username,
      name: name ?? this.name,
      email: email ?? this.email,
      cover_url: cover_url ?? this.cover_url,
      picture_url: picture_url ?? this.picture_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'name': name,
      'email': email,
      'cover_url': cover_url,
      'picture_url': picture_url,
    };
  }

  factory UserdataModel.fromMap(Map<String, dynamic> map) {
    return UserdataModel(
      username: map['username'] != null ? map['username'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      cover_url: map['cover_url'] != null ? map['cover_url'] as String : null,
      picture_url:
          map['picture_url'] != null ? map['picture_url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserdataModel.fromJson(String source) =>
      UserdataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      username,
      name,
      email,
      cover_url,
      picture_url,
    ];
  }
}
