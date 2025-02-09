import 'package:dartz/dartz.dart';
import '../repositories/episode_repository.dart';
import '../entities/episode.dart';
import '../exceptions/server_exception.dart';

class SearchEpisodes {
  final EpisodeRepository repository;

  SearchEpisodes(this.repository);

  Future<Either<ServerException, List<Episode>>> call(String query) async {
    try {
      final episodes = await repository.searchEpisodes(query);
      return Right(episodes);
    } catch (e) {
      return Left(ServerException("Error al buscar episodios."));
    }
  }
}
