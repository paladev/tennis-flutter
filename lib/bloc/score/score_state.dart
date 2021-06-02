import 'package:bloc_login/model/score_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ScoreState extends Equatable {}

class ScoreInitialState extends ScoreState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class ScoreLoadingState extends ScoreState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ScoreLoadedState extends ScoreState {

  ScoreRoundFull score;

  ScoreLoadedState({@required this.score});

  @override
  List<Object> get props => [score];
}

class ScoreErrorState extends ScoreState {

  String message;

  ScoreErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

