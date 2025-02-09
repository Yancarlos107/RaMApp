import '../entities/location.dart';

abstract class LocationRepository {
  Future<List<Location>> getLocations({int page = 1});
  Future<List<Location>> searchLocations(String query);
}
