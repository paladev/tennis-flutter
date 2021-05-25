import 'dart:async';
import 'package:bloc_login/model/tournament_model.dart';
import 'package:bloc_login/model/user_model.dart';
import 'package:meta/meta.dart';
import 'package:bloc_login/model/api_model.dart';
import 'package:bloc_login/api_connection/api_connection.dart';
import 'package:bloc_login/dao/user_dao.dart';

class TournamentsRepository {
  final userDao = UserDao();

  Future<List<Tournaments>> getTournaments () async {
    Info info = await userDao.getInfo(0);
    List<Tournaments> tournaments = await fetchTournaments(info);
    return tournaments;
  }

}



