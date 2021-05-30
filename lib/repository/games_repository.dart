import 'dart:async';
import 'package:bloc_login/model/api_model.dart';
import 'package:bloc_login/model/tournaments.dart';

import 'package:bloc_login/api_connection/api_connection.dart';
import 'package:bloc_login/dao/user_dao.dart';

class GamesRepository {
  String first;
  String second;
  int type;
  GamesRepository({this.first,this.second,this.type});

  Future<List<Games>> getClubs () async {
    GamesRepository data = GamesRepository();
    List<Games> games = await fetchGames(GamesRepository());
    return games;
  }

}



