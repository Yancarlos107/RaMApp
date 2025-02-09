abstract class CharacterEvent {}

class CheckIsFavorite extends CharacterEvent {
  final int characterId;

  CheckIsFavorite(this.characterId);
}

class ToggleFavorites extends CharacterEvent {
  final int characterId;

  ToggleFavorites(this.characterId);
}

class CancelSearch extends CharacterEvent {}

class FetchCharacters extends CharacterEvent {
  final int page;

  FetchCharacters({this.page = 1});
}

class RefreshCharacters extends CharacterEvent {}

class SearchCharacter extends CharacterEvent {
  final String query;

  SearchCharacter(this.query);
}
