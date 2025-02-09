import 'package:dartz/dartz.dart';
import '../repositories/character_repository.dart';
import '../exceptions/server_exception.dart';

class GetFavorites {
  final CharacterRepository repository;

  GetFavorites(this.repository);

  Future<Either<ServerException, List<int>>> call() async {
    try {
      final favorites = await repository.getFavorites();
      return Right(favorites);
    } catch (e) {
      return Left(ServerException("Error al obtener los favoritos."));
    }
  }
}
