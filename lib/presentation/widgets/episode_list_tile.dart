import 'package:flutter/material.dart';
import '../../../domain/entities/episode.dart';

class EpisodeListTile extends StatelessWidget {
  final Episode episode;

  const EpisodeListTile({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(episode.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      subtitle: Text('${episode.episodeCode} - ${episode.airDate}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          )),
      onTap: () {
        Navigator.pushNamed(context, '/episode_detail', arguments: episode);
      },
    );
  }
}
