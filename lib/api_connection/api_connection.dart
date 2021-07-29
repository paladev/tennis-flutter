import 'dart:async';
import 'dart:convert';
import 'package:bloc_login/dao/user_dao.dart';
import 'package:bloc_login/model/filter.dart';
import 'package:bloc_login/model/tournaments.dart';
import 'package:bloc_login/repository/games_repository.dart';
import 'package:bloc_login/repository/tournaments_repository.dart';
import 'package:http/http.dart' as http;
import 'package:bloc_login/model/api_model.dart';
import 'package:bloc_login/model/games.dart';
import 'package:bloc_login/model/clubs.dart';
import 'package:bloc_login/model/score_model.dart';
import 'dart:developer';

final _base = "https://api.tennis-network.com";

class ApiResultModel {
  // String status;
  // int totalResults;
  List<Clubs> clubs;

  ApiResultModel({this.clubs});

  ApiResultModel.fromJson(List<dynamic> json) {
    // status = json['status'];
    // totalResults = json['totalResults'];
    clubs = new List<Clubs>();

    for (var i=0; i<json.length; i++) {
      clubs.add(new Clubs.fromJson(json[i]));
    }
  }
}

class TournamentsResultModel {
  // String status;
  // int totalResults;
  List<Tournaments> tournaments;

  TournamentsResultModel({this.tournaments});

  TournamentsResultModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      tournaments = new List<Tournaments>();
      json['items'].forEach((v) {
      tournaments.add(new Tournaments.fromJson(v));
    });
    }
  }
}

class PlayersResultModel {
  // String status;
  // int totalResults;
  List<FilterPlayers> players;

  PlayersResultModel({this.players});

  PlayersResultModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      players = new List<FilterPlayers>();
      json['items'].forEach((v) {
        players.add(new FilterPlayers.fromJson(v));
      });
    }
  }
}
class GamesResultModel {

  List<Games> games;

  GamesResultModel({this.games});

  GamesResultModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      games = new List<Games>();
      json['items'].forEach((v) {
        games.add(new Games.fromJson(v));
      });
    }
  }
}

Future<Token> getToken(UserLogin userLogin) async {
  final _tokenEndpoint = "/player/login";
  final _tokenURL = _base + _tokenEndpoint;

  final http.Response response = await http.post(
    _tokenURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {

    return Token.fromJson(json.decode(response.body));
  } else {
    // print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<List<Clubs>> fetchClubs(Info info) async {
  final _clubsUrl = _base + "/player/" + info.uid + "/clubs";
  print(_clubsUrl);
  final http.Response response = await http.get(
    _clubsUrl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(json.decode(response.body).toString());
    var parsed = json.decode(response.body);
    print(parsed[0]['name'].toString());
    List<Clubs> clubs = ApiResultModel.fromJson(parsed).clubs;
    return clubs;
  } else {
    // print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<List<Tournaments>> fetchTournaments(int id) async {
  final _clubsUrl = _base + "/club/" + "$id" + "/tournaments";
  final http.Response response = await http.get(
    _clubsUrl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(json.decode(response.body).toString());
    var parsed = json.decode(response.body);
    // print(parsed[0]['name'].toString());
    List<Tournaments> tournaments = TournamentsResultModel.fromJson(parsed).tournaments;
    return tournaments;
  } else {
    // print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}


Future<List<FilterPlayers>> fetchPlayers(int id) async {
  final _clubsUrl = _base + "/tournament/" + "$id" + "/participants";
  final http.Response response = await http.get(
    _clubsUrl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(json.decode(response.body).toString());
    var parsed = json.decode(response.body);
    // print(parsed[0]['name'].toString());
    List<FilterPlayers> players = PlayersResultModel.fromJson(parsed).players;
    return players;
  } else {
    // print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<List<Games>> fetchGames(int tid, gtype data) async {
  final _clubsUrl = _base + "/tournament/" + "$tid" + "/participants/games";
  print(_clubsUrl);
  final http.Response response = await http.post(
    _clubsUrl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data.toJson()),

  );
  if (response.statusCode == 200) {
    print(json.decode(response.body).toString());
    var parsed = json.decode(response.body);
    // print(parsed[0]['name'].toString());
    List<Games> games = GamesResultModel.fromJson(parsed).games;
    return games;
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}


Future<ScoreRoundFull> fetchScore(int gid) async {
  final _clubsUrl = _base + "/game/" + "$gid" + "?expand=round,tournament,rule,brief1,brief2";
  print(_clubsUrl);
  final http.Response response = await http.get(
    _clubsUrl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(json.decode(response.body).toString());
    var parsed = json.decode(response.body);
    ScoreRoundFull score = ScoreRoundFull.fromJson(parsed);
    print(score);
    return score;
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future SendResults(int gid, List results) async {
  final userDao = UserDao();
  Info info = await userDao.getInfo(0);
  final _clubsUrl = _base + "/game/" + "$gid" + "?access-token="+info.token.toString()+"&uid="+info.uid.toString();
  print(_clubsUrl);

  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['result'] = results;
  final http.Response response = await http.patch(
    _clubsUrl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data)
  );
  if (response.statusCode == 200) {
    print(json.decode(response.body).toString());
    var parsed = json.decode(response.body);
    print(parsed);
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
