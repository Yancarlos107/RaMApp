import 'package:dartz/dartz.dart';
import '../repositories/episode_repository.dart';
import '../entities/episode.dart';
import '../exceptions/server_exception.dart';

class GetEpisodes {
  final EpisodeRepository repository;

  GetEpisodes(this.repository);

  Future<Either<ServerException, List<Episode>>> call({int page = 1}) async {
    try {
      final episodes = await repository.getEpisodes(page: page);
      return Right(episodes);
    } catch (e) {
      return Left(ServerException("Error al obtener episodios."));
    }
  }
}
