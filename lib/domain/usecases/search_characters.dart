import 'package:dartz/dartz.dart';
import '../repositories/character_repository.dart';
import '../entities/character.dart';
import '../exceptions/server_exception.dart';

class SearchCharacters {
  final CharacterRepository repository;

  SearchCharacters(this.repository);

  Future<Either<ServerException, List<Character>>> call(String query) async {
    try {
      final characters = await repository.searchCharacters(query);
      return Right(characters);
    } catch (e) {
      return Left(ServerException("Error al buscar personajes."));
    }
  }
}
