import 'package:equatable/equatable.dart';

abstract class ScoreEvent extends Equatable{}

class FetchScoreEvent extends ScoreEvent {
  @override
  List<Object> get props => null;
}