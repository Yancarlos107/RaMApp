import 'package:flutter/material.dart';
import '../../../domain/entities/episode.dart';

class EpisodeListTile extends StatelessWidget {
  final Episode episode;

  const EpisodeListTile({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(episode.name),
      subtitle: Text('${episode.episodeCode} - ${episode.airDate}'),
      onTap: () {
        Navigator.pushNamed(context, '/episode_detail', arguments: episode);
      },
    );
  }
}
