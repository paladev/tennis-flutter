import 'package:bloc_login/home/screens/addgame/addgame.dart';
import 'package:bloc_login/repository/clubs_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/bloc/clubs/clubs_bloc.dart';


class ClubsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => ClubsBloc(repository: ClubsRepository()),
        child: ClubsListScreen(),
      ),
    );
  }
}
