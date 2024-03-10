import 'package:cinema_pedia/infrastructure/datasources/actor_movie_db_datasource.dart';
import 'package:cinema_pedia/infrastructure/repositories/actor_repository_implementation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImplementation(dataSource: ActorMovieDbDataSource());
});
