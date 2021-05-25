import 'package:bloc_login/home/screens/addgame/addgame.dart';
import 'package:bloc_login/model/tournament_model.dart';
import 'package:bloc_login/repository/tournaments_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/bloc/tournaments/tournaments_bloc.dart';
import 'package:bloc_login/bloc/tournaments/tournaments_event.dart';
import 'package:bloc_login/bloc/tournaments/tournaments_state.dart';

class ClubsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => TournamentsBloc(repository: TournamentsRepository()),
        child: MainScreen56(),
      ),
    );
  }
}
