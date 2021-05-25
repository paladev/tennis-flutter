import 'package:equatable/equatable.dart';

class Clubs {
  final int id;
  final String name;
  final bool isMain;
  final String role;

  Clubs({this.id, this.name, this.isMain, this.role});

  factory Clubs.fromJson(Map<String, dynamic> json) {
    return Clubs(
      id: json['id'] as int,
      name: json['name'] as String,
      isMain: json['isMain'] as bool,
      role: json['role'] as String,
    );
  }

}