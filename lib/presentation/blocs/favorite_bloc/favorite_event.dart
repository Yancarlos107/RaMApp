abstract class FavoriteEvent {}

class CheckIsFavorite extends FavoriteEvent {
  final int characterId;

  CheckIsFavorite(this.characterId);
}

class ToggleFavorites extends FavoriteEvent {
  final int characterId;

  ToggleFavorites(this.characterId);
}
