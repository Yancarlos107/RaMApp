import '../entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters({int page = 1});
  Future<List<Character>> searchCharacters(String query);
  Future<void> saveFavorite(Character character);
  Future<List<Character>> getFavorites();
  Future<void> deleteFavorite(int id);
}
