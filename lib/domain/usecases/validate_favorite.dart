import 'package:dartz/dartz.dart';
import '../exceptions/server_exception.dart';
import '../repositories/character_repository.dart';

class IsFavorite {
  final CharacterRepository repository;

  IsFavorite(this.repository);

  Future<Either<ServerException, bool>> call(int characterId) async {
    try {
      final isFavorite = await repository.isFavorite(characterId);
      return Right(isFavorite);
    } catch (e) {
      return Left(
          ServerException("Error al verificar si el personaje es favorito."));
    }
  }
}
