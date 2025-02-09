import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<void> saveFavorite(int id);
  Future<dynamic> getFavorites();
  Future<void> deleteFavorite(int id);
  Future<void> saveSearchHistory(String key, String query);
  Future<List<String>> getSearchHistory(String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String _favoritesKey = 'favorites';
  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveFavorite(int characterId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    if (!favorites.contains(characterId)) {
      favorites.add(characterId);
      await prefs.setStringList(
          _favoritesKey, favorites.map((id) => id.toString()).toList());
    }
  }

  @override
  Future<List<int>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_favoritesKey) ?? [];
    return favorites.map((id) => int.parse(id)).toList();
  }

  @override
  Future<void> deleteFavorite(int characterId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    favorites.remove(characterId);
    await prefs.setStringList(
        _favoritesKey, favorites.map((id) => id.toString()).toList());
  }

  @override
  Future<void> saveSearchHistory(String key, String query) async {
    final history = sharedPreferences.getStringList(key) ?? [];
    if (!history.contains(query)) {
      history.add(query);
      await sharedPreferences.setStringList(key, history);
    }
  }

  @override
  Future<List<String>> getSearchHistory(String key) async {
    return sharedPreferences.getStringList(key) ?? [];
  }

  Future<bool> isFavorite(int characterId) async {
    final favorites = await getFavorites();
    return favorites.contains(characterId);
  }
}
