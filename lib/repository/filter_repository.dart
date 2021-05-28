import 'dart:async';
import 'package:bloc_login/model/filter.dart';
import 'package:bloc_login/model/tournaments.dart';

import 'package:bloc_login/api_connection/api_connection.dart';
import 'package:bloc_login/dao/user_dao.dart';

class FilterRepository {
  int id;
  FilterRepository({this.id});

  Future<List<FilterPlayers>> getFilter () async {
    List<FilterPlayers> plyers = await fetchPlayers(id);
    return plyers;
  }

}



