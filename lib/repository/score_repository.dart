import 'dart:async';
import 'package:bloc_login/model/api_model.dart';
import 'package:bloc_login/model/games.dart';
import 'package:bloc_login/model/tournaments.dart';

import 'package:bloc_login/api_connection/api_connection.dart';
import 'package:bloc_login/dao/user_dao.dart';

class ScoreRepository {
  int gid;
  GamesRepository({this.gid});

  Future<List<Score>> getClubs () async {
    List<Games> score = await fetchScore(gid);
    return score;
  }

  Map <String, dynamic> toDatabaseJson() => {
    "pid1": this.first,
    "pid2": this.second,
    "ptype": this.type,
  };

}



