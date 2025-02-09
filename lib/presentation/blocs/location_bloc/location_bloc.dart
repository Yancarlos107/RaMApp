import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_locations.dart';
import '../../../domain/usecases/search_locations.dart';
import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocations getLocations;
  final SearchLocations searchLocations;

  LocationBloc({
    required this.getLocations,
    required this.searchLocations,
  }) : super(LocationInitial()) {
    on<FetchLocations>((event, emit) async {
      emit(LocationLoading());
      final result = await getLocations.call(page: event.page);
      result.fold(
        (failure) => emit(LocationError()),
        (locations) {
          if (locations.isEmpty) {
            emit(LocationEmpty());
          } else {
            emit(LocationLoaded(locations));
          }
        },
      );
    });

    on<SearchLocation>((event, emit) async {
      emit(LocationLoading());
      final result = await searchLocations.call(event.query);
      result.fold(
        (failure) => emit(LocationError()),
        (locations) {
          if (locations.isEmpty) {
            emit(LocationEmpty());
          } else {
            emit(LocationLoaded(locations));
          }
        },
      );
    });
  }
}
