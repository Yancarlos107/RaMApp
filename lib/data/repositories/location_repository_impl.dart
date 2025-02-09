import '../../domain/entities/location.dart';
import '../../domain/exceptions/server_exception.dart';
import '../../domain/repositories/location_repository.dart';
import '../datasources/remote_data_source.dart';

class LocationRepositoryImpl implements LocationRepository {
  final RemoteDataSource remoteDataSource;

  LocationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Location>> getLocations({int page = 1}) async {
    try {
      return await remoteDataSource.getLocations(page: page);
    } catch (e) {
      throw ServerException("Error al obtener ubicaciones.");
    }
  }

  @override
  Future<List<Location>> searchLocations(String query) async {
    try {
      return await remoteDataSource.searchLocations(query);
    } catch (e) {
      throw ServerException("Error al buscar ubicaciones.");
    }
  }
}
