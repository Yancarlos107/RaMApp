# Rick and Morty Flutter App

**Versión de Flutter:** 3.13.9  
**Versión de Dart:** 3.1.5

Aplicación creada para una prueba técnica en Flutter utilizando la **API de Rick and Morty**. La app permite visualizar y gestionar información sobre personajes, ubicaciones y episodios de la serie _Rick and Morty_. El proyecto fue desarrollado siguiendo **Clean Architecture**, con **BLoC** para el manejo de estados y **Dio** para la gestión de peticiones HTTP.

## **Características**

- Visualización de personajes, ubicaciones y episodios.
- Clean Architecture para una estructura modular y mantenible.
- Manejo de estados con **BLoC**.
- Peticiones HTTP gestionadas con **Dio**.
- Paginación para la carga de datos.
- Almacenamiento local usando **SharedPreferences**.

---

## **Instrucciones de Instalación**

### **Requisitos Previos**

- Flutter 3.13.9
- Dart 3.1.5
- Tener Flutter instalado en tu sistema: Instrucciones de instalación de Flutter

### **Clonar el Repositorio**

`git clone https://github.com/tuusuario/rick-and-morty-flutter-app.git
cd rick-and-morty-flutter-app`

### **Instalar Dependencias**

Ejecuta el siguiente comando para instalar las dependencias:

`flutter pub get`

### **Ejecutar el Proyecto**

Para ejecutar la aplicación en modo debug:

`flutter run`

---

## **Detalles Técnicos**

- **Arquitectura:** Clean Architecture
- **Manejo de Estado:** BLoC
- **HTTP Client:** Dio
- **Almacenamiento Local:** SharedPreferences

Se implementaron todas las funcionalidades solicitadas en la prueba técnica y se extendió el proyecto para trabajar con **locations** y **episodes**, no solo con personajes.

---

## **Posibles Mejoras**

1.  **Colores y estilos:** Centralizar algunos estilos en constantes para mejorar la reutilización y legibilidad del código.
2.  **Bug en la lista de personajes:** Corregir el bug que causa que se cargue toda la lista al hacer scroll para cargar más personajes.
3.  **Scroll infinito:** Implementar scroll infinito para las secciones de **locations** y **episodes**.
4.  **Sistema de autenticación:** Agregar autenticación con **Google Firebase**, aunque para esto sería necesario agregar la firma SHA-1 del dispositivo.
5.  **Sistema de favoritos:** Añadir un sistema de favoritos para **locations** y **episodes**.
6.  **Splash Screen nativo:** Reemplazar la pantalla de splash transitoria por una nativa definida en el archivo `AndroidManifest.xml`.
7.  **Compatibilidad multiplataforma:** Extender la compatibilidad a iOS y web.

---

## **Decisiones Técnicas**

1.  **Arquitectura Clean Architecture:** Aunque tengo más experiencia trabajando con MVC, decidí usar **Clean Architecture** siguiendo las recomendaciones de la guía de la prueba. Pasé una parte importante del primer día estudiando este patrón antes de implementarlo.
2.  **Función para agregar imágenes de personajes:** Creé una función adicional para generar las URLs de las imágenes de los personajes asociados a episodios y ubicaciones, ya que la API no proporciona estas imágenes de manera nativa. Esto permitió enriquecer la experiencia del usuario mostrando más información visual.
3.  **Lógica de favoritos:** Inicialmente, la lógica de favoritos estaba solo en personajes. Sin embargo, surgió un bug al ingresar a la pantalla de detalles, lo que me llevó a separar la lógica y dejarla preparada para futuras implementaciones en **locations** y **episodes**.
4.  **SharedPreferences:** Utilicé **SharedPreferences** para el almacenamiento local por su facilidad de uso. En un proyecto más grande o con datos más complejos, optaría por **SQLite** para mayor rendimiento y robustez.
5.  **Splash Screen:** Utilicé una pantalla transitoria como splash en lugar de una nativa para ahorrar tiempo en la implementación.
6.  **Package oficial de la API:** Descubrí que la documentación oficial de la API ofrece un package que podría haber simplificado parte del código, reduciendo la complejidad y mejorando la legibilidad.

---

## **Cómo Contribuir**

1.  Haz un fork del proyecto.
2.  Crea una nueva rama para tu feature (`git checkout -b feature/nueva-feature`).
3.  Haz commit de tus cambios (`git commit -m 'Agregada nueva feature'`).
4.  Haz push a la rama (`git push origin feature/nueva-feature`).
5.  Abre un Pull Request.

---

## **Licencia**

Este proyecto está licenciado bajo la **MIT License**. Consulta el archivo `LICENSE` para más información.

---

## **Contacto**

Si tienes preguntas o sugerencias, no dudes en contactarme a través de [tu correo] o abrir un issue en el repositorio.
