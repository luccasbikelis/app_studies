import 'package:app_studies/base/model/model.dart';
import 'package:app_studies/features/home/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon implements Model {
  PokemonModel(
      List<String> abilities,
      String detailPageURL,
      int weight,
      List<String> weakness,
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
      List<String> type)
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

  factory PokemonModel.copy(PokemonModel pokemonModel) {
    return PokemonModel(
        pokemonModel.abilities,
        pokemonModel.detailPageURL,
        pokemonModel.weight,
        pokemonModel.weakness,
        pokemonModel.number,
        pokemonModel.height,
        pokemonModel.collectiblesSlug,
        pokemonModel.featured,
        pokemonModel.slug,
        pokemonModel.description,
        pokemonModel.name,
        pokemonModel.thumbnailAltText,
        pokemonModel.thumbnailImage,
        pokemonModel.id,
        pokemonModel.type);
  }
}
