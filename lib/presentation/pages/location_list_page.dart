import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/location_bloc/location_bloc.dart';
import '../blocs/location_bloc/location_event.dart';
import '../blocs/location_bloc/location_state.dart';
import '../widgets/location_list_tile.dart';
import '../widgets/search_bar.dart' as searchbar;

class LocationListPage extends StatefulWidget {
  const LocationListPage({super.key});

  @override
  State<LocationListPage> createState() => _LocationListPageState();
}

class _LocationListPageState extends State<LocationListPage> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  final bool _isSearching = false;

  @override
  void initState() {
    super.initState();

    context.read<LocationBloc>().add(FetchLocations(page: _currentPage));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_isSearching &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      _currentPage++;
      context.read<LocationBloc>().add(FetchLocations(page: _currentPage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Ubicaciones',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          searchbar.SearchBar(
            onSearch: (query) {
              context.read<LocationBloc>().add(SearchLocation(query));
            },
            onCancel: () {},
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
                      child: Text(
                    'Error al cargar ubicaciones',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ));
                } else if (state is LocationEmpty) {
                  return const Center(
                    child: Text(
                      'No se encontraron ubicaciones',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
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
