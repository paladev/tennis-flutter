import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc_login/bloc/tournaments/tournaments.dart';
import 'package:bloc_login/repository/tournaments_repository.dart';
import 'package:bloc_login/model/tournament_model.dart';

class TournamentsBloc extends Bloc<TournamentsEvent, TournamentsState> {

  TournamentsRepository repository;

  TournamentsBloc({@required this.repository});

  @override
  ArticleState get initialState => ArticleInitialState();

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is FetchArticlesEvent) {
      yield ArticleLoadingState();
      try {
        List<Articles> articles = await repository.getArticles();
        yield ArticleLoadedState(articles: articles);
      } catch (e) {
        yield ArticleErrorState(message: e.toString());
      }
    }
  }

}