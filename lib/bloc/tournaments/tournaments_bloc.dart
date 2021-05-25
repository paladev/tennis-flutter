import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc_login/repository/tournaments_repository.dart';
import 'package:bloc_login/model/tournament_model.dart';
import 'package:bloc_login/bloc/tournaments/tournaments_event.dart';
import 'package:bloc_login/bloc/tournaments/tournaments_state.dart';

class TournamentsBloc extends Bloc<TournamentsEvent, TournamentsState> {

  TournamentsRepository repository;
  TournamentsBloc({@required this.repository}): assert(TournamentsRepository != null),
        super(TournamentsLoadingState());

  @override
  TournamentsState get initialState => TournamentsInitialState();

  @override
  Stream<TournamentsState> mapEventToState(TournamentsEvent event) async* {

    if (event is FetchTournamentsEvent) {
      yield TournamentsLoadingState();
      try {
        List<Tournaments> tournaments = await repository.getTournaments();
        yield TournamentsLoadedState(tournaments: tournaments);
      } catch (e) {
        yield TournamentsErrorState(message: e.toString());
      }
    }
  }

}