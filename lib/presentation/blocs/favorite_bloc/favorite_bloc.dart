import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/toggle_favorites.dart';
import '../../../domain/usecases/validate_favorite.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final IsFavorite isFavorite;
  final ToggleFavorite toggleFavorite;

  FavoriteBloc({
    required this.isFavorite,
    required this.toggleFavorite,
  }) : super(FavoriteInitial()) {
    on<CheckIsFavorite>((event, emit) async {
      emit(FavoriteLoading());

      final result = await isFavorite.call(event.characterId);
      result.fold(
        (failure) => emit(FavoriteError()),
        (isFavorite) => emit(FavoriteStatus(isFavorite)),
      );
    });

    on<ToggleFavorites>((event, emit) async {
      emit(FavoriteLoading());

      final result = await toggleFavorite.call(event.characterId);
      result.fold(
        (failure) => emit(FavoriteError()),
        (isFavorite) => emit(FavoriteStatus(isFavorite)),
      );
    });
  }
}
