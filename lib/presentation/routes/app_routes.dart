import 'package:flutter/material.dart';
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
  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      home: (context) => const HomePage(),
      characters: (context) => CharacterListPage(),
      characterDetail: (context) => CharacterDetailPage(
            character: ModalRoute.of(context)!.settings.arguments as Character,
          ),
      locations: (context) => LocationListPage(),
      locationDetail: (context) => LocationDetailPage(
            location: ModalRoute.of(context)!.settings.arguments as Location,
          ),
      episodes: (context) => EpisodeListPage(),
      episodeDetail: (context) => EpisodeDetailPage(
            episode: ModalRoute.of(context)!.settings.arguments as Episode,
          ),
    };
  }

  // Método para navegar a una ruta con argumentos
  static void navigateTo(BuildContext context, String routeName,
      {Object? arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }
}
