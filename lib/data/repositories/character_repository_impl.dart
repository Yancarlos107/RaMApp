import 'package:dartz/dartz.dart';
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
    print("Repositorio: Obteniendo personajes desde remoteDataSource.");
    try {
      final response = await remoteDataSource.getCharacters(page: page);
      print(response);
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
      print("Repositorio: Error al obtener personajes desde remoteDataSource.");
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
  Future<void> saveFavorite(Character character) async {
    try {
      await localDataSource.saveFavorite('favorites', character);
    } catch (e) {
      throw Exception("Error al guardar el personaje como favorito.");
    }
  }

  @override
  Future<List<Character>> getFavorites() async {
    try {
      return await localDataSource.getFavorites('favorites');
    } catch (e) {
      throw Exception("Error al obtener los favoritos.");
    }
  }

  @override
  Future<void> deleteFavorite(int id) async {
    try {
      await localDataSource.deleteFavorite('favorites', id);
    } catch (e) {
      throw Exception("Error al eliminar el personaje de favoritos.");
    }
  }
}
