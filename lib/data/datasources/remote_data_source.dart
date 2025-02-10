import 'package:dio/dio.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/entities/location.dart';
import '../../../domain/entities/episode.dart';
import '../../domain/exceptions/server_exception.dart';
import '../models/character_model.dart';
import '../models/location_model.dart';
import '../models/episode_model.dart';

abstract class RemoteDataSource {
  Future<List<Character>> getCharacters({int page = 1});
  Future<List<Character>> searchCharacters(String query);
  Future<List<Location>> getLocations({int page = 1});
  Future<List<Location>> searchLocations(String query);
  Future<List<Episode>> getEpisodes({int page = 1});
  Future<List<Episode>> searchEpisodes(String query);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<List<Character>> getCharacters({int page = 1}) async {
    final response = await dio.get(
      'https://rickandmortyapi.com/api/character',
      queryParameters: {'page': page},
    );
    if (response.statusCode == 200) {
      final results = List<Map<String, dynamic>>.from(response.data['results']);
      return results.map((e) => CharacterModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<Character>> searchCharacters(String query) async {
    final response = await dio
        .get('https://rickandmortyapi.com/api/character', queryParameters: {
      'name': query, /* 'Autorization': 'Bearer token' */
    });
    if (response.statusCode == 200) {
      final results = List<Map<String, dynamic>>.from(response.data['results']);
      return results.map((e) => CharacterModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<Episode>> getEpisodes({int page = 1}) async {
    try {
      final response = await dio
          .get('https://rickandmortyapi.com/api/episode', queryParameters: {
        'page': page, /* 'Autorization': 'Bearer token' */
      });
      if (response.statusCode == 200) {
        final results =
            List<Map<String, dynamic>>.from(response.data['results']);
        return results.map((e) => EpisodeModel.fromJson(e)).toList();
      } else {
        throw ServerException(
            "Error al obtener episodios. Código: ${response.statusCode}");
      }
    } catch (e) {
      throw ServerException("Error desconocido al obtener episodios.");
    }
  }

  @override
  Future<List<Episode>> searchEpisodes(String query) async {
    try {
      final response = await dio.get('https://rickandmortyapi.com/api/episode',
          queryParameters: {'name': query});
      if (response.statusCode == 200) {
        final results =
            List<Map<String, dynamic>>.from(response.data['results']);
        return results.map((e) => EpisodeModel.fromJson(e)).toList();
      } else {
        throw ServerException(
            "Error al buscar episodios. Código: ${response.statusCode}");
      }
    } catch (e) {
      throw ServerException("Error desconocido al buscar episodios.");
    }
  }

  @override
  Future<List<Location>> getLocations({int page = 1}) async {
    try {
      final response = await dio.get('https://rickandmortyapi.com/api/location',
          queryParameters: {'page': page});
      if (response.statusCode == 200) {
        final results =
            List<Map<String, dynamic>>.from(response.data['results']);
        return results.map((e) => LocationModel.fromJson(e)).toList();
      } else {
        throw ServerException(
            "Error al obtener episodios. Código: ${response.statusCode}");
      }
    } catch (e) {
      throw ServerException("Error desconocido al obtener episodios.");
    }
  }

  @override
  Future<List<Location>> searchLocations(String query) async {
    final response = await dio.get('https://rickandmortyapi.com/api/location',
        queryParameters: {'name': query});
    if (response.statusCode == 200) {
      final results = List<Map<String, dynamic>>.from(response.data['results']);
      return results.map((e) => LocationModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }
}
