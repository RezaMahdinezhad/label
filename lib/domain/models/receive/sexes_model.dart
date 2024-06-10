// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SexesModel extends Equatable {
  String? percent;
  String? sex;
  SexesModel({
    this.percent,
    this.sex,
  });

  SexesModel copyWith({
    String? percent,
    String? sex,
  }) {
    return SexesModel(
      percent: percent ?? this.percent,
      sex: sex ?? this.sex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'percent': percent,
      'sex': sex,
    };
  }

  factory SexesModel.fromMap(Map<String, dynamic> map) {
    return SexesModel(
      percent: map['percent'] != null ? map['percent'] as String : null,
      sex: map['sex'] != null ? map['sex'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SexesModel.fromJson(String source) =>
      SexesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [percent, sex];
}
