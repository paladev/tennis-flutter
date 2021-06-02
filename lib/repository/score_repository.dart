import 'dart:async';
import 'package:bloc_login/model/score_model.dart';

import 'package:bloc_login/api_connection/api_connection.dart';


class ScoreRepository {
  int gid;
  ScoreRepository({this.gid});

  Future<ScoreRoundFull> getClubs () async {
    ScoreRoundFull score = await fetchScore(gid);
    return score;
  }
}



