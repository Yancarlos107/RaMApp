import 'package:dartz/dartz.dart';
import '../repositories/location_repository.dart';
import '../entities/location.dart';
import '../exceptions/server_exception.dart';

class GetLocations {
  final LocationRepository repository;

  GetLocations(this.repository);

  Future<Either<ServerException, List<Location>>> call({int page = 1}) async {
    try {
      final locations = await repository.getLocations(page: page);
      return Right(locations);
    } catch (e) {
      return Left(ServerException("Error al obtener ubicaciones."));
    }
  }
}
