// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ArtistdataModel extends Equatable {
  int? rank;
  int? followers;
  String? name;
  int? id;
  int? total_play;
  String? picture_url;
  int? likes;
  int? monthly_listener;
  int? totla_listener;
  int? live_listen;
  dynamic bank;
  dynamic total_income;
  ArtistdataModel({
    this.rank,
    this.followers,
    this.name,
    this.id,
    this.total_play,
    this.picture_url,
    this.likes,
    this.monthly_listener,
    this.totla_listener,
    this.live_listen,
    this.bank,
    this.total_income,
  });

  ArtistdataModel copyWith({
    int? rank,
    int? followers,
    String? name,
    int? id,
    int? total_play,
    String? picture_url,
    int? likes,
    int? monthly_listener,
    int? totla_listener,
    int? live_listen,
    dynamic bank,
    dynamic total_income,
  }) {
    return ArtistdataModel(
      rank: rank ?? this.rank,
      followers: followers ?? this.followers,
      name: name ?? this.name,
      id: id ?? this.id,
      total_play: total_play ?? this.total_play,
      picture_url: picture_url ?? this.picture_url,
      likes: likes ?? this.likes,
      monthly_listener: monthly_listener ?? this.monthly_listener,
      totla_listener: totla_listener ?? this.totla_listener,
      live_listen: live_listen ?? this.live_listen,
      bank: bank ?? this.bank,
      total_income: total_income ?? this.total_income,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rank': rank,
      'followers': followers,
      'name': name,
      'id': id,
      'total_play': total_play,
      'picture_url': picture_url,
      'likes': likes,
      'monthly_listener': monthly_listener,
      'totla_listener': totla_listener,
      'live_listen': live_listen,
      'bank': bank,
      'total_income': total_income,
    };
  }

  factory ArtistdataModel.fromMap(Map<String, dynamic> map) {
    return ArtistdataModel(
      rank: map['rank'] != null ? map['rank'] as int : null,
      followers: map['followers'] != null ? map['followers'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      total_play: map['total_play'] != null ? map['total_play'] as int : null,
      picture_url:
          map['picture_url'] != null ? map['picture_url'] as String : null,
      likes: map['likes'] != null ? map['likes'] as int : null,
      monthly_listener: map['monthly_listener'] != null
          ? map['monthly_listener'] as int
          : null,
      totla_listener:
          map['totla_listener'] != null ? map['totla_listener'] as int : null,
      live_listen:
          map['live_listen'] != null ? map['live_listen'] as int : null,
      bank: map['bank'] as dynamic,
      total_income: map['total_income'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtistdataModel.fromJson(String source) =>
      ArtistdataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      rank,
      followers,
      name,
      id,
      total_play,
      picture_url,
      likes,
      monthly_listener,
      totla_listener,
      live_listen,
      bank,
      total_income,
    ];
  }
}
