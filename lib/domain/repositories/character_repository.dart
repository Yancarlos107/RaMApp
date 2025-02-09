import '../entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters({int page = 1});
  Future<List<Character>> searchCharacters(String query);
  Future<void> saveFavorite(int id);
  Future<List<int>> getFavorites();
  Future<void> deleteFavorite(int id);
  Future<bool> isFavorite(int id);
}
