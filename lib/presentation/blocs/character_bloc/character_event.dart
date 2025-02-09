import '../../../domain/entities/character.dart';

abstract class CharacterEvent {}

class CancelSearch extends CharacterEvent {}

class FetchCharacters extends CharacterEvent {
  final int page;

  FetchCharacters({this.page = 1});
}

class SearchCharacter extends CharacterEvent {
  final String query;

  SearchCharacter(this.query);
}

class AddToFavorites extends CharacterEvent {
  final Character character;

  AddToFavorites(this.character);
}
