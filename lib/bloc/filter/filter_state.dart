import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc_login/model/filter.dart';

abstract class FilterState extends Equatable {}

class FilterInitialState extends FilterState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class FilterLoadingState extends FilterState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FilterLoadedState extends FilterState {

  List<FilterPlayers> filter;

  FilterLoadedState({@required this.filter});

  @override
  List<Object> get props => [filter];
}

class FilterErrorState extends FilterState {

  String message;

  FilterErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

