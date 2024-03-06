
import 'package:cinema_pedia/config/domain/entities/movie.dart';

  abstract class MovieRepository {
 Future<List<Movie>> getNowPlaying({int page = 1});
  }