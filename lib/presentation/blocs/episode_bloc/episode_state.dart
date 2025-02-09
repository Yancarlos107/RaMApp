import '../../../domain/entities/episode.dart';

abstract class EpisodeState {}

class EpisodeInitial extends EpisodeState {}

class EpisodeLoading extends EpisodeState {}

class EpisodeLoaded extends EpisodeState {
  final List<Episode> episodes;

  EpisodeLoaded(this.episodes);
}

class EpisodeError extends EpisodeState {}

class EpisodeEmpty extends EpisodeState {}
