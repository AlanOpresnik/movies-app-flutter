import 'package:cinema_pedia/config/constants/enviroment.dart';
import 'package:cinema_pedia/config/domain/datasources/movies_datasource.dart';
import 'package:cinema_pedia/config/domain/entities/movie.dart';
import 'package:cinema_pedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinema_pedia/infrastructure/models/movieDb/movie_db_response.dart';
import 'package:cinema_pedia/infrastructure/models/movieDb/movie_detailes.dart';
import 'package:dio/dio.dart';

class MovieDbDataSource extends MovieDataSource {
  final dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environment.movieDbKey,
    'languague': "es-MX",
  }));

  List<Movie> _jsonToMovie(Map<String, dynamic> json) {
    final movieDbResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDbResponse.results
        .where((movie) => movie.posterPath != "no-poster")
        .map((movie) => MovieMapper.movieDbToEntity(movie))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      "page": page,
    });
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {"page": page});

    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {"page": page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getUpComming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {"page": page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200)
      throw Exception("Movie with id $id not found");

    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;
  }
}
