import 'package:equatable/equatable.dart';

class Tournaments {
  final int id;
  final String name;
  final String start;

  Tournaments({this.id, this.name, this.start});

  factory Tournaments.fromJson(Map<String, dynamic> json) {
    return Tournaments(
      id: json['id'] as int,
      name: json['name'] as String,
      start: json['start_date'] as String,
    );
  }

}