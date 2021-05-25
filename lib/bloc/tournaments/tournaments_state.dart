import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc_login/model/tournament_model.dart';

abstract class TournamentsState extends Equatable {}

class TournamentsInitialState extends TournamentsState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class TournamentsLoadingState extends TournamentsState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TournamentsLoadedState extends TournamentsState {

  List<Tournaments> tournaments;

  TournamentsLoadedState({@required this.tournaments});

  @override
  List<Object> get props => [tournaments];
}

class TournamentsErrorState extends TournamentsState {

  String message;

  TournamentsErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

