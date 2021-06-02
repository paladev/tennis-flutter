import 'package:bloc_login/home/screens/score/score.dart';
import 'package:bloc_login/repository/score_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/bloc/score/score_bloc.dart';
import 'package:bloc_login/model/tournaments.dart';

class ScoreScreen extends StatelessWidget {
  int id;
  ScoreScreen({this.id});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => ScoreBloc(repository: ScoreRepository(gid: id)),
        child: ScoreListScreen(),
      ),
    );
  }
}
