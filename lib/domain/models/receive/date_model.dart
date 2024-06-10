// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class DateModel extends Equatable {
  DateTime? date;
  int? listen;
  DateModel({
    this.date,
    this.listen,
  });

  DateModel copyWith({
    DateTime? date,
    int? listen,
  }) {
    return DateModel(
      date: date ?? this.date,
      listen: listen ?? this.listen,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date?.millisecondsSinceEpoch,
      'listen': listen,
    };
  }

  factory DateModel.fromMap(Map<String, dynamic> map) {
    return DateModel(
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
          : null,
      listen: map['listen'] != null ? map['listen'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DateModel.fromJson(String source) =>
      DateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [date, listen];
}
