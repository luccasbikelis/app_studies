import 'package:app_studies/features/home/domain/entities/pokemon.dart';
import 'package:app_studies/features/home/domain/repository/pokemon_repository.dart';

abstract class PokemonUseCase {
  Future<Pokemon> call();
}

class PokemonUseCaseImpl implements PokemonUseCase {
  final PokemonRepository repository;

  PokemonUseCaseImpl(this.repository);
  @override
  Future<Pokemon> call() async {
    return await repository();
  }
}
