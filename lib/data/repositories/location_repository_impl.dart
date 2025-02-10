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
      final response = await remoteDataSource.getLocations(page: page);

      return response
          .map((model) => Location(
                id: model.id,
                name: model.name,
                type: model.type,
                dimension: model.dimension,
                residents: model.residents,
              ))
          .toList();
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
