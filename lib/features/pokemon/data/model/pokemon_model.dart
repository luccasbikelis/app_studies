import 'package:app_studies/base/model/model.dart';
import 'package:app_studies/features/pokemon/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon implements Model {
  PokemonModel(
      List<dynamic> abilities,
      String detailPageURL,
      int weight,
      List<dynamic> weakness,
      String number,
      int height,
      String collectiblesSlug,
      String featured,
      String slug,
      String description,
      String name,
      String thumbnailAltText,
      String thumbnailImage,
      int id,
      List<dynamic> type)
      : super(
            abilities,
            detailPageURL,
            weight,
            weakness,
            number,
            height,
            collectiblesSlug,
            featured,
            slug,
            description,
            name,
            thumbnailAltText,
            thumbnailImage,
            id,
            type);

  @override
  Map<String, dynamic> toMap() {
    return {
      'abilities': abilities,
      'detailPageURL': detailPageURL,
      'weight': weight,
      'weakness': weakness,
      'number': number,
      'height': height,
      'collectiblesSlug': collectiblesSlug,
      'featured': featured,
      'slug': slug,
      'description': description,
      'name': name,
      'thumbnailAltText': thumbnailAltText,
      'thumbnailImage': thumbnailImage,
      'id': id,
      'type': type,
    };
  }

  @override
  factory PokemonModel.fromJson(Map json) {
    return PokemonModel(
      json['abilities'] ?? [],
      json['detailPageURL'] ?? '',
      json['weight'] ?? 0,
      json['weakness'] ?? [],
      json['number'] ?? '',
      json['height'] ?? 0,
      json['collectiblesSlug'] ?? '',
      json['featured'] ?? '',
      json['slug'] ?? '',
      json['description'] ?? '',
      json['name'] ?? '',
      json['thumbnailAltText'] ?? '',
      json['thumbnailImage'] ?? '',
      json['id'] ?? 0,
      json['type'] ?? [],
    );
  }

  factory PokemonModel.copy(Pokemon pokemon) {
    return PokemonModel(
        pokemon.abilities,
        pokemon.detailPageURL,
        pokemon.weight,
        pokemon.weakness,
        pokemon.number,
        pokemon.height,
        pokemon.collectiblesSlug,
        pokemon.featured,
        pokemon.slug,
        pokemon.description,
        pokemon.name,
        pokemon.thumbnailAltText,
        pokemon.thumbnailImage,
        pokemon.id,
        pokemon.type);
  }
}
