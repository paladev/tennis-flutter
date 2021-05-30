import 'package:bloc_login/home/screens/tournaments/tournaments.dart';
import 'package:bloc_login/repository/tournaments_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/bloc/tournaments/tournaments_bloc.dart';
import 'package:bloc_login/model/tournaments.dart';

class GamesScreen extends StatelessWidget {
  String playerOne;
  String playerTwo;
  int type;
  GamesScreen({this.playerOne, this.playerTwo, this.type});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => TournamentsBloc(repository: GamesRepository(id: club)),
        child: GamesListScreen(),
      ),
    );
  }
}
