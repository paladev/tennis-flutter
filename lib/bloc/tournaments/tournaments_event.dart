import 'package:equatable/equatable.dart';

abstract class TournamentsEvent extends Equatable{}

class FetchTournamentsEvent extends TournamentsEvent {
  @override
  List<Object> get props => null;
}