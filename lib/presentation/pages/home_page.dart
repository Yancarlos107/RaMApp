import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Rick and Morty',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/portal.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonHome(
                  route: 'character.png',
                  title: 'Personajes',
                  onTap: () =>
                      AppRoutes.navigateTo(context, AppRoutes.characters)),
              CustomButtonHome(
                  route: 'location.png',
                  title: 'Ubicaciones',
                  onTap: () =>
                      AppRoutes.navigateTo(context, AppRoutes.locations)),
              CustomButtonHome(
                  route: 'episodes.jpeg',
                  title: 'Episodios',
                  onTap: () =>
                      AppRoutes.navigateTo(context, AppRoutes.episodes)),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButtonHome extends StatelessWidget {
  final String route;
  final String title;
  final VoidCallback onTap;

  const CustomButtonHome({
    super.key,
    required this.route,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20),
        width: 200,
        height: 80, // Altura ajustada
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20), // Bordes redondeados
        ),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.5, // Transparencia de la imagen de fondo
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    20), // Asegura que la imagen también tenga bordes redondeados
                child: Image.asset(
                  "assets/$route",
                  fit: BoxFit.cover,
                  width: 200,
                  height: 80,
                ),
              ),
            ),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
