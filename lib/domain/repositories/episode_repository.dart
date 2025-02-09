import '../entities/episode.dart';

abstract class EpisodeRepository {
  Future<List<Episode>> getEpisodes({int page = 1});
  Future<List<Episode>> searchEpisodes(String query);
}
