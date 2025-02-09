import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/datasources/local_data_source.dart';
import '../../data/datasources/remote_data_source.dart';
import '../../data/repositories/character_repository_impl.dart';
import '../../data/repositories/episode_repository_impl.dart';
import '../../data/repositories/location_repository_impl.dart';
import '../../presentation/blocs/character_bloc/character_bloc.dart';
import '../../presentation/blocs/episode_bloc/episode_bloc.dart';
import '../../presentation/blocs/location_bloc/location_bloc.dart';
import '../usecases/delete_favorite.dart';
import '../usecases/get_characters.dart';
import '../usecases/get_episodes.dart';
import '../usecases/get_favorites.dart';
import '../usecases/get_locations.dart';
import '../usecases/save_favorites.dart';
import '../usecases/search_characters.dart';
import '../usecases/search_episodes.dart';
import '../usecases/search_locations.dart';

class DependencyInjection {
  // Configuración de fuentes de datos
  static final dio = Dio();
  static late final SharedPreferences sharedPreferences;

  static Future<void> initialize() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static final remoteDataSource = RemoteDataSourceImpl(dio: dio);
  static final localDataSource =
      LocalDataSourceImpl(sharedPreferences: sharedPreferences);
  // Repositorios
  static final characterRepository = CharacterRepositoryImpl(
      remoteDataSource: remoteDataSource, localDataSource: localDataSource);
  static final locationRepository = LocationRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );
  static final episodeRepository = EpisodeRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );

  // UseCases para Personajes
  static final getCharacters = GetCharacters(characterRepository);
  static final searchCharacters = SearchCharacters(characterRepository);
  static final saveFavorite = SaveFavorite(characterRepository);
  static final getFavorites = GetFavorites(characterRepository);
  static final deleteFavorite = DeleteFavorite(characterRepository);

  // UseCases para Ubicaciones
  static final getLocations = GetLocations(locationRepository);
  static final searchLocations = SearchLocations(locationRepository);

  // UseCases para Episodios
  static final getEpisodes = GetEpisodes(episodeRepository);
  static final searchEpisodes = SearchEpisodes(episodeRepository);

  // BLoCs
  static CharacterBloc characterBloc() => CharacterBloc(
        getCharacters:
            getCharacters, /* 
        searchCharacters: searchCharacters,
        saveFavorite: saveFavorite,
        getFavorites: getFavorites,
        deleteFavorite: deleteFavorite, */
      );

  static LocationBloc locationBloc() => LocationBloc(
        getLocations: getLocations,
        searchLocations: searchLocations,
      );

  static EpisodeBloc episodeBloc() => EpisodeBloc(
        getEpisodes: getEpisodes,
        searchEpisodes: searchEpisodes,
      );
}
