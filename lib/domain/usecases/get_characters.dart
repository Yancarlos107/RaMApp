import 'package:dartz/dartz.dart';
import '../repositories/character_repository.dart';
import '../entities/character.dart';
import '../exceptions/server_exception.dart';

class GetCharacters {
  final CharacterRepository repository;

  GetCharacters(this.repository);

  Future<Either<ServerException, List<Character>>> call({int page = 1}) async {
    try {
      final characters = await repository.getCharacters(page: page);
      return Right(characters);
    } catch (e) {
      return Left(ServerException());
    }
  }
}
