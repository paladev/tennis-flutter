import 'dart:async';
import 'dart:math';

import 'package:bloc_login/model/filter.dart';

class BackendService {
  static Future<List<Map<String, String>>> getSuggestions(String query) async {
    await Future.delayed(Duration(seconds: 1));

    return List.generate(3, (index) {
      return {
        'name': query + index.toString(),
      };
    });
  }
}

class FilterPlayer {
  static List<String> getSuggestions(List<FilterPlayers> players,String query) {
    if (query.length >= 3){
      List<String> matches = <String>[];
      for( var i = 0 ; i < players.length; i++ ) {
        matches.add(players[i].name);
      }
      matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
      return matches;
    }
  }
  static int getSuggestionsId(List<FilterPlayers> players,String name) {
    FilterPlayers matchingName;
      List<String> matches = <String>[];
    for( var i = 0 ; i < players.length; i++ ) {
      if (players[i].name == name){
        return players[i].id;
      }
    }
  }
}
