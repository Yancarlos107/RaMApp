import '../../domain/entities/location.dart';

class LocationModel extends Location {
  LocationModel({
    required super.id,
    required super.name,
    required super.type,
    required super.dimension,
    required super.residents,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      dimension: json['dimension'],
      residents: List<String>.from(json['residents']),
    );
  }
}
