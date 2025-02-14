import '../../../domain/entities/location.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final List<Location> locations;

  LocationLoaded(this.locations);
}

class LocationError extends LocationState {}

class LocationEmpty extends LocationState {}
