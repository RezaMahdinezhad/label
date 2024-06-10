// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class RequestModel extends Equatable {
  String? name;
  String? email;
  String? phonenumber;
  String? social;
  RequestModel({
    this.name,
    this.email,
    this.phonenumber,
    this.social,
  });

  RequestModel copyWith({
    String? name,
    String? email,
    String? phonenumber,
    String? social,
  }) {
    return RequestModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phonenumber: phonenumber ?? this.phonenumber,
      social: social ?? this.social,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phonenumber': phonenumber,
      'social': social,
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    return RequestModel(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phonenumber:
          map['phonenumber'] != null ? map['phonenumber'] as String : null,
      social: map['social'] != null ? map['social'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) =>
      RequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, email, phonenumber, social];
}
