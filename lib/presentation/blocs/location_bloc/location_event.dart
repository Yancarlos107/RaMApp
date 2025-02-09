abstract class LocationEvent {}

class FetchLocations extends LocationEvent {
  final int page;

  FetchLocations({this.page = 1});
}

class SearchLocation extends LocationEvent {
  final String query;

  SearchLocation(this.query);
}
