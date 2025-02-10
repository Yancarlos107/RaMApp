abstract class CharacterEvent {}

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
