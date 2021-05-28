import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc_login/bloc/filter/filter_event.dart';
import 'package:bloc_login/bloc/filter/filter_state.dart';
import 'package:bloc_login/model/filter.dart';
import 'package:bloc_login/repository/filter_repository.dart';


class FilterBloc extends Bloc<FilterEvent, FilterState> {

  FilterRepository repository;
  FilterBloc({@required this.repository}): assert(FilterRepository != null),
        super(FilterLoadingState());

  @override
  FilterState get initialState => FilterInitialState();

  @override
  Stream<FilterState> mapEventToState(FilterEvent event) async* {

    if (event is FetchFilterEvent) {
      yield FilterLoadingState();
      try {
        List<FilterPlayers> players = await repository.getFilter();
        yield FilterLoadedState(filter: players);
      } catch (e) {
        yield FilterErrorState(message: e.toString());
      }
    }
  }

}