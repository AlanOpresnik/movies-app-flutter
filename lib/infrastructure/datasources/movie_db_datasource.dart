import 'package:cinema_pedia/config/constants/enviroment.dart';
import 'package:cinema_pedia/config/domain/datasources/movies_datasource.dart';
import 'package:cinema_pedia/config/domain/entities/movie.dart';
import 'package:cinema_pedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinema_pedia/infrastructure/models/movieDb/movie_db_response.dart';
import 'package:dio/dio.dart';

class MovieDbDataSource extends MovieDataSource {
  final dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environment.movieDbKey,
    'languague': "es-MX",
  }));
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      "page": page,
    });
    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
        .where((movie) => movie.posterPath != "no-poster")
        .map((movie) => MovieMapper.movieDbToEntity(movie))
        .toList();
    return movies;
  }
}
