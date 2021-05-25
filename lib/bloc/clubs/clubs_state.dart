import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc_login/model/tournament_model.dart';

abstract class ClubsState extends Equatable {}

class ClubsInitialState extends ClubsState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class ClubsLoadingState extends ClubsState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ClubsLoadedState extends ClubsState {

  List<Clubs> clubs;

  ClubsLoadedState({@required this.clubs});

  @override
  List<Object> get props => [clubs];
}

class ClubsErrorState extends ClubsState {

  String message;

  ClubsErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

