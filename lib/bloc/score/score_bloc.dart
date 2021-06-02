import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc_login/bloc/score/score_event.dart';
import 'package:bloc_login/bloc/score/score_state.dart';
import 'package:bloc_login/model/score_model.dart';
import 'package:bloc_login/repository/score_repository.dart';


class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {

  ScoreRepository repository;
  ScoreBloc({@required this.repository}): assert(ScoreRepository != null),
        super(ScoreLoadingState());

  @override
  ScoreState get initialState => ScoreInitialState();

  @override
  Stream<ScoreState> mapEventToState(ScoreEvent event) async* {

    if (event is FetchScoreEvent) {
      yield ScoreLoadingState();
      try {
        List<Score> score = await repository.getClubs();
        yield ScoreLoadedState(score: score);
      } catch (e) {
        yield ScoreErrorState(message: e.toString());
      }
    }
  }

}