import 'dart:async';
import 'package:bloc_login/model/tournaments.dart';

import 'package:bloc_login/api_connection/api_connection.dart';
import 'package:bloc_login/dao/user_dao.dart';

class TournamentsRepository {
  int id;
  TournamentsRepository({this.id});

  Future<List<Tournaments>> getClubs () async {
    List<Tournaments> tournaments = await fetchTournaments(id);
    return tournaments;
  }

}



