import 'package:digital_test/presentation/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/injection/injection.dart';
import 'presentation/blocs/character_bloc/character_bloc.dart';
import 'presentation/blocs/episode_bloc/episode_bloc.dart';
import 'presentation/blocs/location_bloc/location_bloc.dart';
import 'presentation/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.initialize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Color de la barra de estado
    statusBarIconBrightness: Brightness
        .light, // Iconos de la barra de estado (light = blanco, dark = negro)
    systemNavigationBarColor: Colors.black, // Color de la barra de navegación
    systemNavigationBarIconBrightness:
        Brightness.light, // Color de los íconos de la barra de navegación
  ));
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CharacterBloc>(
            create: (_) => DependencyInjection.characterBloc(),
          ),
          BlocProvider<LocationBloc>(
            create: (_) => DependencyInjection.locationBloc(),
          ),
          BlocProvider<EpisodeBloc>(
            create: (_) => DependencyInjection.episodeBloc(),
          ),
          BlocProvider<FavoriteBloc>(
            create: (_) => DependencyInjection.favoriteBloc(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Rick And Morty',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: AppRoutes.splash,
            onGenerateRoute: (settings) {
              final routes = AppRoutes.routes;
              final widgetBuilder = routes[settings.name];
              if (widgetBuilder != null) {
                return MaterialPageRoute(
                    builder: (context) =>
                        widgetBuilder(context, settings.arguments));
              }
              return null;
            }));
  }
}
