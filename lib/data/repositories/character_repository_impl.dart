import '../../domain/entities/character.dart';
import '../../domain/exceptions/server_exception.dart';
import '../../domain/repositories/character_repository.dart';
import '../datasources/remote_data_source.dart';
import '../datasources/local_data_source.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  CharacterRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Character>> getCharacters({int page = 1}) async {
    try {
      final response = await remoteDataSource.getCharacters(page: page);

      return response
          .map((model) => Character(
                id: model.id,
                name: model.name,
                status: model.status,
                species: model.species,
                image: model.image,
              ))
          .toList();
    } catch (e) {
      throw ServerException("Error al obtener personajes.");
    }
  }

  @override
  Future<List<Character>> searchCharacters(String query) async {
    try {
      return await remoteDataSource.searchCharacters(query);
    } catch (e) {
      throw ServerException("Error al buscar personajes.");
    }
  }

  @override
  Future<void> saveFavorite(int id) async {
    try {
      await localDataSource.saveFavorite(id);
    } catch (e) {
      throw Exception("Error al guardar el personaje como favorito.");
    }
  }

  @override
  Future<List<int>> getFavorites() async {
    try {
      return await localDataSource.getFavorites();
    } catch (e) {
      throw Exception("Error al obtener los favoritos.");
    }
  }

  @override
  Future<void> deleteFavorite(int id) async {
    try {
      await localDataSource.deleteFavorite(id);
    } catch (e) {
      throw Exception("Error al eliminar el personaje de favoritos.");
    }
  }

  @override
  Future<bool> isFavorite(int characterId) async {
    final favorites = await getFavorites();
    return favorites.contains(characterId);
  }
}
