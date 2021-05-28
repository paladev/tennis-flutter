import 'package:bloc_login/home/screens/filter/filter.dart';
import 'package:bloc_login/repository/filter_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/bloc/filter/filter_bloc.dart';

class FilterScreen extends StatelessWidget {
  int tournament;
  FilterScreen({this.tournament});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => FilterBloc(repository: FilterRepository(id: tournament)),
        child: FilterPlayersScreen(),
      ),
    );
  }
}
