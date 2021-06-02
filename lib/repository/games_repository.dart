import 'dart:async';
import 'package:bloc_login/model/api_model.dart';
import 'package:bloc_login/model/games.dart';
import 'package:bloc_login/model/tournaments.dart';

import 'package:bloc_login/api_connection/api_connection.dart';
import 'package:bloc_login/dao/user_dao.dart';

class GamesRepository {
  int tournament;
  gtype data;
  GamesRepository({this.tournament, this.data});

  Future<List<Games>> getClubs () async {
    List<Games> games = await fetchGames(tournament, data);
    return games;
  }

}



