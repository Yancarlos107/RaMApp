import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_episodes.dart';
import '../../../domain/usecases/search_episodes.dart';
import 'episode_event.dart';
import 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GetEpisodes getEpisodes;
  final SearchEpisodes searchEpisodes;

  EpisodeBloc({
    required this.getEpisodes,
    required this.searchEpisodes,
  }) : super(EpisodeInitial()) {
    on<FetchEpisodes>((event, emit) async {
      emit(EpisodeLoading());
      final result = await getEpisodes.call(page: event.page);
      result.fold(
        (failure) => emit(EpisodeError()),
        (episodes) {
          if (episodes.isEmpty) {
            emit(EpisodeEmpty());
          } else {
            emit(EpisodeLoaded(episodes));
          }
        },
      );
    });

    on<SearchEpisode>((event, emit) async {
      emit(EpisodeLoading());
      final result = await searchEpisodes.call(event.query);
      result.fold(
        (failure) => emit(EpisodeError()),
        (episodes) {
          if (episodes.isEmpty) {
            emit(EpisodeEmpty());
          } else {
            emit(EpisodeLoaded(episodes));
          }
        },
      );
    });
  }
}
