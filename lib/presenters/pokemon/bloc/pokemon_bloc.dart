import 'dart:async';
import 'package:app_studies/features/pokemon/domain/entities/pokemon_list.dart';
import 'package:app_studies/features/pokemon/domain/usecase/pokemon_usecase.dart';



class PokemonBloc {
  final PokemonUseCase pokemonUseCase;

  PokemonBloc(this.pokemonUseCase);

  final StreamController<PokemonList> resultController = StreamController.broadcast();
  Stream<PokemonList> get resultStream => resultController.stream;

   final StreamController<bool> _controllerLoading =
      StreamController.broadcast();
  Stream<bool> get controllerLoadingStream => _controllerLoading.stream;

bool loading = false;

  loadResults() async {
    loading = true;
    _controllerLoading.sink.add(loading);

    final result = await pokemonUseCase();
    resultController.add(result);

    loading = false;
    _controllerLoading.sink.add(loading);
  }

  dispose() {
    resultController.close();
  }
}
