import '../../../domain/entities/character.dart';

abstract class CharacterEvent {}

class FetchCharacters extends CharacterEvent {
  final int page;

  FetchCharacters({this.page = 1});
}

class SearchCharacters extends CharacterEvent {
  final String query;

  SearchCharacters(this.query);
}

class AddToFavorites extends CharacterEvent {
  final Character character;

  AddToFavorites(this.character);
}
