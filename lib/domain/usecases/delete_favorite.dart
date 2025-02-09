import 'package:dartz/dartz.dart';
import '../repositories/character_repository.dart';
import '../exceptions/server_exception.dart';

class DeleteFavorite {
  final CharacterRepository repository;

  DeleteFavorite(this.repository);

  Future<Either<ServerException, void>> call(int id) async {
    try {
      await repository.deleteFavorite(id);
      return const Right(null); // No hay datos que devolver
    } catch (e) {
      return Left(
          ServerException("Error al eliminar el personaje de favoritos."));
    }
  }
}
