import 'package:flutter/material.dart';
import 'presentation/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rick And Morty',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.home,
        onGenerateRoute: (settings) {
          final routes = AppRoutes.routes;
          final widgetBuilder = routes[settings.name];
          if (widgetBuilder != null) {
            return MaterialPageRoute(
                builder: (context) => widgetBuilder(context));
          }
          return null;
        });
  }
}
