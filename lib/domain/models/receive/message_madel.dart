// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  dynamic messageText;
  dynamic messageNumber;
  MessageModel({
    this.messageText,
    this.messageNumber,
  });

  MessageModel copyWith({
    dynamic messageText,
    dynamic messageNumber,
  }) {
    return MessageModel(
      messageText: messageText ?? this.messageText,
      messageNumber: messageNumber ?? this.messageNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messageText': messageText,
      'messageNumber': messageNumber,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      messageText: map['messageText'] as dynamic,
      messageNumber: map['messageNumber'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [messageText, messageNumber];
}
