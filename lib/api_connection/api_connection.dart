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
