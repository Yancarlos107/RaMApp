import 'package:dartz/dartz.dart';
import '../repositories/character_repository.dart';
import '../entities/character.dart';
import '../exceptions/server_exception.dart';

class GetCharacters {
  final CharacterRepository repository;

  GetCharacters(this.repository);

  Future<Either<ServerException, List<Character>>> call({int page = 1}) async {
    print("UseCase: Llamando a CharacterRepository.getCharacters().");
    try {
      final characters = await repository.getCharacters(page: page);
      return Right(characters);
    } catch (e) {
      print("UseCase: Error al obtener personajes desde el repositorio.");
      return Left(ServerException());
    }
  }
}
