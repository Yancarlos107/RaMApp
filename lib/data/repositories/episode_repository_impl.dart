import 'package:dartz/dartz.dart';
import '../../domain/entities/episode.dart';
import '../../domain/exceptions/server_exception.dart';
import '../../domain/repositories/episode_repository.dart';
import '../datasources/remote_data_source.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final RemoteDataSource remoteDataSource;

  EpisodeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Episode>> getEpisodes({int page = 1}) async {
    try {
      return await remoteDataSource.getEpisodes(page: page);
    } catch (e) {
      throw ServerException("Error al obtener episodios.");
    }
  }

  @override
  Future<List<Episode>> searchEpisodes(String query) async {
    try {
      return await remoteDataSource.searchEpisodes(query);
    } catch (e) {
      throw ServerException("Error al buscar episodios.");
    }
  }
}
