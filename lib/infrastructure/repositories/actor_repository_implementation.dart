

import 'package:cinema_pedia/config/domain/datasources/actors_datasources.dart';
import 'package:cinema_pedia/config/domain/entities/actor.dart';
import 'package:cinema_pedia/config/domain/respositories/actors_respotory.dart';

class ActorRepositoryImplementation extends ActorsRespositorys {

  final ActorsDataSource dataSource;

  ActorRepositoryImplementation({required this.dataSource}); 
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
   return dataSource.getActorsByMovie(movieId);
  }

}