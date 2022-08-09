import 'package:app_studies/features/pokemon/domain/entities/pokemon_list.dart';

abstract class PokemonRepository {
  Future<PokemonList> call();
}
