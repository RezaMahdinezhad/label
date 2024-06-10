// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CityModel extends Equatable {
  String? percent;
  String? city;
  CityModel({
    this.percent,
    this.city,
  });

  CityModel copyWith({
    String? percent,
    String? city,
  }) {
    return CityModel(
      percent: percent ?? this.percent,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'percent': percent,
      'city': city,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      percent: map['percent'] != null ? map['percent'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [percent, city];
}
