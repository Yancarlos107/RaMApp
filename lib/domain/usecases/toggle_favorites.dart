import 'package:dartz/dartz.dart';
import '../repositories/character_repository.dart';
import '../exceptions/server_exception.dart';

class ToggleFavorite {
  final CharacterRepository repository;

  ToggleFavorite(this.repository);

  Future<Either<ServerException, bool>> call(int characterId) async {
    try {
      final isFavorite = await repository.isFavorite(characterId);
      if (isFavorite) {
        await repository.deleteFavorite(characterId);
        return const Right(false);
      } else {
        await repository.saveFavorite(characterId);
        return const Right(true);
      }
    } catch (e) {
      return Left(ServerException("Error al alternar el estado de favorito."));
    }
  }
}
