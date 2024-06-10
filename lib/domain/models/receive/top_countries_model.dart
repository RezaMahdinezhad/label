// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class TopCountriesModel extends Equatable {
  String? percent;
  String? country;
  TopCountriesModel({
    this.percent,
    this.country,
  });

  TopCountriesModel copyWith({
    String? percent,
    String? country,
  }) {
    return TopCountriesModel(
      percent: percent ?? this.percent,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'percent': percent,
      'country': country,
    };
  }

  factory TopCountriesModel.fromMap(Map<String, dynamic> map) {
    return TopCountriesModel(
      percent: map['percent'] != null ? map['percent'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TopCountriesModel.fromJson(String source) =>
      TopCountriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [percent, country];
}
