// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class EditUserModelSend extends Equatable {
  String? username;
  String? email;
  EditUserModelSend({
    this.username,
    this.email,
  });

  EditUserModelSend copyWith({
    String? username,
    String? email,
  }) {
    return EditUserModelSend(
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
    };
  }

  factory EditUserModelSend.fromMap(Map<String, dynamic> map) {
    return EditUserModelSend(
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EditUserModelSend.fromJson(String source) =>
      EditUserModelSend.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [username, email];
}
