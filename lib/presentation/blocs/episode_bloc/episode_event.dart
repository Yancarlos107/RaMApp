abstract class EpisodeEvent {}

class FetchEpisodes extends EpisodeEvent {
  final int page;

  FetchEpisodes({this.page = 1});
}

class SearchEpisode extends EpisodeEvent {
  final String query;

  SearchEpisode(this.query);
}
