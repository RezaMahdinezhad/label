// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginModelSend extends Equatable {
  String? username;
  String? password;
  String? email;
  LoginModelSend({
    this.username,
    this.password,
    this.email,
  });

  LoginModelSend copyWith({
    String? username,
    String? password,
    String? email,
  }) {
    return LoginModelSend(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'email': email,
    };
  }

  factory LoginModelSend.fromMap(Map<String, dynamic> map) {
    return LoginModelSend(
      username: map['username'] != null ? map['username'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModelSend.fromJson(String source) =>
      LoginModelSend.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [username, password, email];
}
