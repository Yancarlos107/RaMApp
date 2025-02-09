import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/character.dart';
import '../../domain/entities/location.dart';
import '../../domain/entities/episode.dart';

abstract class LocalDataSource {
  Future<void> saveFavorite(String key, dynamic item);
  Future<dynamic> getFavorites(String key);
  Future<void> deleteFavorite(String key, int id);
  Future<void> saveSearchHistory(String key, String query);
  Future<List<String>> getSearchHistory(String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveFavorite(String key, dynamic item) async {
    final favorites = sharedPreferences.getStringList(key) ?? [];
    favorites.add(item.toString());
    await sharedPreferences.setStringList(key, favorites);
  }

  @override
  Future<dynamic> getFavorites(String key) async {
    return sharedPreferences.getStringList(key) ?? [];
  }

  @override
  Future<void> deleteFavorite(String key, int id) async {
    final favorites = sharedPreferences.getStringList(key) ?? [];
    favorites.removeWhere((item) => item.contains(id.toString()));
    await sharedPreferences.setStringList(key, favorites);
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
}
