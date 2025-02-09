import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/location_bloc/location_bloc.dart';
import '../blocs/location_bloc/location_event.dart';
import '../blocs/location_bloc/location_state.dart';
import '../widgets/location_list_tile.dart';
import '../widgets/search_bar.dart' as searchbar;

class LocationListPage extends StatelessWidget {
  const LocationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ubicaciones')),
      body: Column(
        children: [
          searchbar.SearchBar(
            onSearch: (query) {
              context.read<LocationBloc>().add(SearchLocation(query));
            },
          ),
          Expanded(
            child: BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {
                if (state is LocationLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LocationLoaded) {
                  return ListView.builder(
                    itemCount: state.locations.length,
                    itemBuilder: (context, index) {
                      return LocationListTile(location: state.locations[index]);
                    },
                  );
                } else if (state is LocationError) {
                  return const Center(
                      child: Text('Error al cargar ubicaciones'));
                } else if (state is LocationEmpty) {
                  return const Center(
                      child: Text('No se encontraron ubicaciones'));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
