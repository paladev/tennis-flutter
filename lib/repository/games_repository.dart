import 'dart:async';
import 'package:bloc_login/model/api_model.dart';
import 'package:bloc_login/model/games.dart';
import 'package:bloc_login/model/tournaments.dart';

import 'package:bloc_login/api_connection/api_connection.dart';
import 'package:bloc_login/dao/user_dao.dart';

class GamesRepository {
  int tournament;
  int first;
  int second;
  int type;
  GamesRepository({this.tournament,this.first,this.second,this.type});

  Future<List<Games>> getClubs () async {
    GamesRepository data = GamesRepository(
      tournament: tournament,
      first: first,
      second: second,
      type: type,
    );
    print("turnir id " +"data.$tournament");
    print("first id " +"$data.$first");
    print("second id " +"$data.second");
    print("type id " +"$data.$type");
    List<Games> games = await fetchGames(data);
    return games;
  }

  Map <String, dynamic> toDatabaseJson() => {
    "pid1": this.first,
    "pid2": this.second,
    "ptype": this.type,
  };

}



