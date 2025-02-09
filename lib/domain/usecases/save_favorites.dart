import 'package:dartz/dartz.dart';
import '../repositories/character_repository.dart';
import '../entities/character.dart';
import '../exceptions/server_exception.dart';

class SaveFavorite {
  final CharacterRepository repository;

  SaveFavorite(this.repository);

  Future<Either<ServerException, void>> call(Character character) async {
    try {
      await repository.saveFavorite(character);
      return const Right(null);
    } catch (e) {
      return Left(ServerException());
    }
  }
}
