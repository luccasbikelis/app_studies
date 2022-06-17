import 'dart:async';

import 'package:app_studies/features/home/domain/entities/pokemon.dart';
import 'package:app_studies/features/home/domain/usecase/pokemon_usecase.dart';

class HomeBloc {
  final PokemonUseCase pokemonUseCase;

  HomeBloc(this.pokemonUseCase);

  final StreamController<Pokemon> resultController = StreamController();
  Stream<Pokemon> get resultStream => resultController.stream;

  loadResults() async {
    final result = await pokemonUseCase();
    resultController.add(result);
  }

  dispose() {
    resultController.close();
  }
}
