import 'package:flutter/material.dart';
import '../../domain/entities/character.dart';
import '../../domain/entities/episode.dart';
import '../../domain/entities/location.dart';
import '../pages/home_page.dart';
import '../pages/character_list_page.dart';
import '../pages/character_detail_page.dart';
import '../pages/location_list_page.dart';
import '../pages/location_detail_page.dart';
import '../pages/episode_list_page.dart';
import '../pages/episode_detail_page.dart';

class AppRoutes {
  // Nombres de las rutas
  static const String home = '/';
  static const String characters = '/characters';
  static const String characterDetail = '/character_detail';
  static const String locations = '/locations';
  static const String locationDetail = '/location_detail';
  static const String episodes = '/episodes';
  static const String episodeDetail = '/episode_detail';

  // Mapa de rutas
  static Map<String, Widget Function(BuildContext context, Object? arguments)>
      get routes {
    return {
      home: (context, _) => const HomePage(),
      characters: (context, _) => const CharacterListPage(),
      characterDetail: (context, arguments) {
        final character = arguments as Character?;
        return CharacterDetailPage(character: character);
      },
      locations: (context, _) => const LocationListPage(),
      locationDetail: (context, arguments) => LocationDetailPage(
            location: ModalRoute.of(context)!.settings.arguments as Location,
          ),
      episodes: (context, _) => const EpisodeListPage(),
      episodeDetail: (context, arguments) => EpisodeDetailPage(
            episode: arguments as Episode,
          ),
    };
  }

  static void navigateTo(BuildContext context, String routeName,
      {Object? arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }
}
