import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_login/model/api_model.dart';
import 'package:bloc_login/model/tournament_model.dart';
import 'dart:developer';

final _base = "https://api.tennis-network.com";

class ApiResultModel {
  // String status;
  // int totalResults;
  List<Tournaments> tournaments;

  ApiResultModel({this.tournaments});

  ApiResultModel.fromJson(List<dynamic> json) {
    // status = json['status'];
    // totalResults = json['totalResults'];
    tournaments = new List<Tournaments>();

    for (var i=0; i<json.length; i++) {
      tournaments.add(new Tournaments.fromJson(json[i]));
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

Future<List<Tournaments>> fetchTournaments(Info info) async {
  final _tournamentsUrl = _base + "/player/" + info.uid + "/clubs";
  print(_tournamentsUrl);
  final http.Response response = await http.get(
    _tournamentsUrl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(json.decode(response.body).toString());
    var parsed = json.decode(response.body);
    print(parsed[0]['name'].toString());
    List<Tournaments> tournaments = ApiResultModel.fromJson(parsed).tournaments;
    return tournaments;
  } else {
    // print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
