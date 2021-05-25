import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc_login/repository/clubs_repository.dart';
import 'package:bloc_login/model/clubs.dart';
import 'package:bloc_login/bloc/clubs/clubs_event.dart';
import 'package:bloc_login/bloc/clubs/clubs_state.dart';

class ClubsBloc extends Bloc<ClubsEvent, ClubsState> {

  ClubsRepository repository;
  ClubsBloc({@required this.repository}): assert(ClubsRepository != null),
        super(ClubsLoadingState());

  @override
  ClubsState get initialState => ClubsInitialState();

  @override
  Stream<ClubsState> mapEventToState(ClubsEvent event) async* {

    if (event is FetchClubsEvent) {
      yield ClubsLoadingState();
      try {
        List<Clubs> clubs = await repository.getClubs();
        yield ClubsLoadedState(clubs: clubs);
      } catch (e) {
        yield ClubsErrorState(message: e.toString());
      }
    }
  }

}