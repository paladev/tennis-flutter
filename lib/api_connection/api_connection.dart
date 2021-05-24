import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_login/model/api_model.dart';
import 'package:bloc_login/model/tournament_model.dart';

final _base = "https://api.tennis-network.com";


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
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<Token> getTournaments(Info info) async {
  final _tournamentsUrl = "/player/" + "$info.uid" + "/clubs";
  final http.Response response = await http.get(
    _tournamentsUrl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Tournaments>((json) => Tournaments.fromJson(json)).toList();
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
