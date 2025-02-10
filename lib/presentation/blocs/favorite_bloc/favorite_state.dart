abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteStatus extends FavoriteState {
  final bool isFavorite;

  FavoriteStatus(this.isFavorite);
}

class FavoriteError extends FavoriteState {}
