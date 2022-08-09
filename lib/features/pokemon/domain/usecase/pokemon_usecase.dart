import 'package:app_studies/features/pokemon/domain/entities/pokemon_list.dart';
import 'package:app_studies/features/pokemon/domain/repository/pokemon_repository.dart';

abstract class PokemonUseCase {
  Future<PokemonList> call();
}

class PokemonUseCaseImpl implements PokemonUseCase {
  final PokemonRepository repository;

  PokemonUseCaseImpl(this.repository);
  @override
  Future<PokemonList> call() async {
    return await repository();
  }
}
