import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                AppRoutes.navigateTo(context, AppRoutes.characters);
              },
              child: const Text('Personajes'),
            ),
            ElevatedButton(
              onPressed: () {
                AppRoutes.navigateTo(context, AppRoutes.locations);
              },
              child: const Text('Ubicaciones'),
            ),
            ElevatedButton(
              onPressed: () {
                AppRoutes.navigateTo(context, AppRoutes.episodes);
              },
              child: const Text('Episodios'),
            ),
          ],
        ),
      ),
    );
  }
}
