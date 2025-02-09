import '../../domain/entities/episode.dart';

class EpisodeModel extends Episode {
  EpisodeModel({
    required super.id,
    required super.name,
    required super.airDate,
    required super.episodeCode,
    required super.characters,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'],
      name: json['name'],
      airDate: json['air_date'],
      episodeCode: json['episode'],
      characters: List<String>.from(json['characters']),
    );
  }
}
