import 'dart:convert';

class Envelope {
  final dynamic item;

  Envelope(this.item);

  factory Envelope.fromJson(Map<String, dynamic> json) {
    return Envelope(json['item']);
  }

  Map<String, dynamic> toJson() {
    return {'item': item};
  }
}