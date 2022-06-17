import 'package:app_studies/features/home/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Pokemon> call();
}
