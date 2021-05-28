import 'package:equatable/equatable.dart';

abstract class FilterEvent extends Equatable{}

class FetchFilterEvent extends FilterEvent {
  @override
  List<Object> get props => null;
}