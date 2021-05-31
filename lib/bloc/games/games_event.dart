import 'package:equatable/equatable.dart';

abstract class GamesEvent extends Equatable{}

class FetchGamesEvent extends GamesEvent {
  @override
  List<Object> get props => null;
}