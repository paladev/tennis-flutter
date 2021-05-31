import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc_login/model/games.dart';

abstract class GamesState extends Equatable {}

class GamesInitialState extends GamesState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class GamesLoadingState extends GamesState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GamesLoadedState extends GamesState {

  List<Games> games;

  GamesLoadedState({@required this.games});

  @override
  List<Object> get props => [games];
}

class GamesErrorState extends GamesState {

  String message;

  GamesErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

