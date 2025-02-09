import 'package:dartz/dartz.dart';
import '../repositories/location_repository.dart';
import '../entities/location.dart';
import '../exceptions/server_exception.dart';

class SearchLocations {
  final LocationRepository repository;

  SearchLocations(this.repository);

  Future<Either<ServerException, List<Location>>> call(String query) async {
    try {
      final locations = await repository.searchLocations(query);
      return Right(locations);
    } catch (e) {
      return Left(ServerException("Error al buscar ubicaciones."));
    }
  }
}
