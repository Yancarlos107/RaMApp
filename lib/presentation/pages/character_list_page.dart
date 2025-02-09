import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/character_bloc/character_bloc.dart';
import '../blocs/character_bloc/character_event.dart';
import '../blocs/character_bloc/character_state.dart';
import '../widgets/character_list_tile.dart';
import '../widgets/search_bar.dart' as searchbar;

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  _CharacterListPageState createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isSearching = false; // Indica si estamos en modo búsqueda

  @override
  void initState() {
    super.initState();
    context.read<CharacterBloc>().add(FetchCharacters(page: _currentPage));
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
      context.read<CharacterBloc>().add(FetchCharacters(page: _currentPage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personajes')),
      body: Column(
        children: [
          // SearchBar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: searchbar.SearchBar(
              onSearch: (query) {
                setState(() {
                  _isSearching = true; // Activar modo búsqueda
                  _currentPage = 1; // Reiniciar la paginación
                });
                context.read<CharacterBloc>().add(SearchCharacter(query));
              },
              onCancel: () {
                setState(() {
                  _isSearching = false; // Desactivar modo búsqueda
                  _currentPage = 1; // Reiniciar la paginación
                });
                context
                    .read<CharacterBloc>()
                    .add(FetchCharacters(page: _currentPage));
              },
            ),
          ),
          // Lista de personajes
          Expanded(
            child: BlocBuilder<CharacterBloc, CharacterState>(
              builder: (context, state) {
                if (state is CharacterLoading && _currentPage == 1) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CharacterLoaded) {
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: state.characters.length +
                        (_currentPage > 1 && !_isSearching ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < state.characters.length) {
                        return CharacterListTile(
                            character: state.characters[index]);
                      } else {
                        // Mostrar un indicador de carga al final de la lista
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                  );
                } else if (state is CharacterError) {
                  return const Center(
                      child: Text('Error al cargar personajes'));
                } else if (state is CharacterEmpty) {
                  return const Center(
                      child: Text('No hay personajes disponibles'));
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
