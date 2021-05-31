import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc_login/bloc/games/games_event.dart';
import 'package:bloc_login/bloc/games/games_state.dart';
import 'package:bloc_login/model/games.dart';
import 'package:bloc_login/repository/games_repository.dart';


class GamesBloc extends Bloc<GamesEvent, GamesState> {

  GamesRepository repository;
  GamesBloc({@required this.repository}): assert(GamesRepository != null),
        super(GamesLoadingState());

  @override
  GamesState get initialState => GamesInitialState();

  @override
  Stream<GamesState> mapEventToState(GamesEvent event) async* {

    if (event is FetchGamesEvent) {
      yield GamesLoadingState();
      try {
        List<Games> games = await repository.getClubs();
        yield GamesLoadedState(games: games);
      } catch (e) {
        yield GamesErrorState(message: e.toString());
      }
    }
  }

}