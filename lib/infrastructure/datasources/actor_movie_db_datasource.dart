import 'package:cinema_pedia/config/constants/enviroment.dart';
import 'package:cinema_pedia/config/domain/datasources/actors_datasources.dart';
import 'package:cinema_pedia/config/domain/entities/actor.dart';
import 'package:cinema_pedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinema_pedia/infrastructure/models/movieDb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDataSource extends ActorsDataSource {
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final dio = Dio(
        BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
      'api_key': Environment.movieDbKey,
      'languague': "es-MX",
    }));

    final response = await dio.get('/movie/${movieId}/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper().castToEntity(cast))
        .toList();

        return actors;
  }
}
