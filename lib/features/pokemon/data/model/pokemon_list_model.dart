import 'package:app_studies/base/model/model.dart';
import 'package:app_studies/features/pokemon/data/model/pokemon_model.dart';
import 'package:app_studies/features/pokemon/domain/entities/pokemon.dart';
import 'package:app_studies/features/pokemon/domain/entities/pokemon_list.dart';

class PokemonListModel extends PokemonList implements Model {
  PokemonListModel(
    final List<Pokemon> pokemon,
  ) : super(pokemon);

  @override
  Map<String, dynamic> toMap() {
    return {
      'pokemon': pokemon
          .map((pokemon) => PokemonModel.copy(pokemon).toMap())
          .toList()
    };
  }

  @override
  factory PokemonListModel.fromJson(List json) {
    return PokemonListModel(
      json.map((json) => PokemonModel.fromJson(json)).toList(),
    );
  }

  factory PokemonListModel.copy(PokemonList pokemonList) {
    return PokemonListModel(
      pokemonList.pokemon,
    );
  }
}