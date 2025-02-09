class ServerException implements Exception {
  final String message;

  ServerException([this.message = "Error al comunicarse con el servidor"]);

  @override
  String toString() {
    return message;
  }
}
