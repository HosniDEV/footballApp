// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Rounds {
  List<String>? response;
  Rounds({
    this.response,
  });

  factory Rounds.fromJson(Map<String, dynamic> json) {
    return Rounds(
      response: json['response'] != null
          ? List<String>.from((json['response']))
          : null,
    );
  }
}
