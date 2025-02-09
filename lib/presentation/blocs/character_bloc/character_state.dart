import '../../../domain/entities/character.dart';

abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Character> characters;

  CharacterLoaded(this.characters);
}

class CharacterError extends CharacterState {}

class CharacterEmpty extends CharacterState {}

class FavoriteInitial extends CharacterState {}

class FavoriteLoading extends CharacterState {}

class FavoriteStatus extends CharacterState {
  final bool isFavorite;

  FavoriteStatus(this.isFavorite);
}

class FavoriteError extends CharacterState {}
