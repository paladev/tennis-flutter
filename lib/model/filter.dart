import 'package:equatable/equatable.dart';

class FilterPlayers {
  final int id;
  final String name;
  final int type;

  FilterPlayers({this.id, this.name, this.type});

  factory FilterPlayers.fromJson(Map<String, dynamic> json) {
    return FilterPlayers(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as int,
    );
  }

}