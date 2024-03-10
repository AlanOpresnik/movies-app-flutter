import 'package:cinema_pedia/config/domain/entities/actor.dart';
import 'package:cinema_pedia/config/domain/entities/movie.dart';
import 'package:cinema_pedia/infrastructure/models/movieDb/movie_db_response.dart';
import 'package:cinema_pedia/presentations/providers/actors/actors_respository_provider.dart';
import 'package:cinema_pedia/presentations/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorsProvider = ref.watch(actorsRepositoryProvider);
  return ActorsByMovieNotifier(getActors: actorsProvider.getActorsByMovie);
});

typedef GetActorsCallBack = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallBack getActors;
  ActorsByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
