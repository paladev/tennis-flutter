import 'package:bloc_login/home/screens/games/games.dart';
import 'package:bloc_login/model/filter.dart';
import 'package:bloc_login/repository/games_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/bloc/games/games_bloc.dart';
import 'package:bloc_login/model/games.dart';

class GamesScreen extends StatelessWidget {
  int tournament;
  gtype data;
  GamesScreen({this.tournament, this.data});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => GamesBloc(repository: GamesRepository(tournament: tournament, data: data)),
        child: GamesListScreen(tid: tournament),
      ),
    );
  }
}
