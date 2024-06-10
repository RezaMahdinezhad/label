// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  int? followers;
  int? id;
  int? total_play;
  String? description;
  String? instagram_url;
  String? youtube_url;
  String? facebook_url;
  String? color1;
  String? color2;
  String? message;
  dynamic total_income;
  dynamic bank;
  dynamic threshold;
  ProfileModel({
    this.followers,
    this.id,
    this.total_play,
    this.description,
    this.instagram_url,
    this.youtube_url,
    this.facebook_url,
    this.color1,
    this.color2,
    this.message,
    required this.total_income,
    required this.bank,
    required this.threshold,
  });

  ProfileModel copyWith({
    int? followers,
    int? id,
    int? total_play,
    String? description,
    String? instagram_url,
    String? youtube_url,
    String? facebook_url,
    String? color1,
    String? color2,
    String? message,
    dynamic total_income,
    dynamic bank,
    dynamic threshold,
  }) {
    return ProfileModel(
      followers: followers ?? this.followers,
      id: id ?? this.id,
      total_play: total_play ?? this.total_play,
      description: description ?? this.description,
      instagram_url: instagram_url ?? this.instagram_url,
      youtube_url: youtube_url ?? this.youtube_url,
      facebook_url: facebook_url ?? this.facebook_url,
      color1: color1 ?? this.color1,
      color2: color2 ?? this.color2,
      message: message ?? this.message,
      total_income: total_income ?? this.total_income,
      bank: bank ?? this.bank,
      threshold: threshold ?? this.threshold,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'followers': followers,
      'id': id,
      'total_play': total_play,
      'description': description,
      'instagram_url': instagram_url,
      'youtube_url': youtube_url,
      'facebook_url': facebook_url,
      'color1': color1,
      'color2': color2,
      'message': message,
      'total_income': total_income,
      'bank': bank,
      'threshold': threshold,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      followers: map['followers'] != null ? map['followers'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      total_play: map['total_play'] != null ? map['total_play'] as int : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      instagram_url:
          map['instagram_url'] != null ? map['instagram_url'] as String : null,
      youtube_url:
          map['youtube_url'] != null ? map['youtube_url'] as String : null,
      facebook_url:
          map['facebook_url'] != null ? map['facebook_url'] as String : null,
      color1: map['color1'] != null ? map['color1'] as String : null,
      color2: map['color2'] != null ? map['color2'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      total_income: map['total_income'] as dynamic,
      bank: map['bank'] as dynamic,
      threshold: map['threshold'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      followers,
      id,
      total_play,
      description,
      instagram_url,
      youtube_url,
      facebook_url,
      color1,
      color2,
      message,
      total_income,
      bank,
      threshold,
    ];
  }
}
