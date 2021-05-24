import 'package:equatable/equatable.dart';

class Tournaments {
  final int id;
  final String name;
  final bool isMain;
  final String role;

  Tournaments({this.id, this.name, this.isMain, this.role});

  factory Tournaments.fromJson(Map<String, dynamic> json) {
    return Tournaments(
      id: json['id'] as int,
      name: json['name'] as String,
      isMain: json['isMain'] as bool,
      role: json['role'] as String,
    );
  }

}