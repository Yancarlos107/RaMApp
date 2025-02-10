import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/episode_bloc/episode_bloc.dart';
import '../blocs/episode_bloc/episode_event.dart';
import '../blocs/episode_bloc/episode_state.dart';
import '../widgets/episode_list_tile.dart';
import '../widgets/search_bar.dart' as searchbar;

class EpisodeListPage extends StatefulWidget {
  const EpisodeListPage({super.key});

  @override
  State<EpisodeListPage> createState() => _EpisodeListPageState();
}

class _EpisodeListPageState extends State<EpisodeListPage> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  final bool _isSearching = false;

  @override
  void initState() {
    super.initState();

    context.read<EpisodeBloc>().add(FetchEpisodes(page: _currentPage));
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
      context.read<EpisodeBloc>().add(FetchEpisodes(page: _currentPage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: const Text(
            'Episodios',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Column(
        children: [
          searchbar.SearchBar(
            onSearch: (query) {
              context.read<EpisodeBloc>().add(SearchEpisode(query));
            },
            onCancel: () {},
          ),
          Expanded(
            child: BlocBuilder<EpisodeBloc, EpisodeState>(
              builder: (context, state) {
                if (state is EpisodeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is EpisodeLoaded) {
                  return ListView.builder(
                    itemCount: state.episodes.length,
                    itemBuilder: (context, index) {
                      return EpisodeListTile(episode: state.episodes[index]);
                    },
                  );
                } else if (state is EpisodeError) {
                  return const Center(child: Text('Error al cargar episodios'));
                } else if (state is EpisodeEmpty) {
                  return const Center(
                      child: Text('No se encontraron episodios'));
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
