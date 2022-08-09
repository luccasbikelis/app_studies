import 'package:app_studies/base/http/http_facade.dart';
import 'package:app_studies/features/pokemon/data/datasource/pokemon_datasource.dart';
import 'package:app_studies/features/pokemon/data/repository/pokemon_repository_impl.dart';
import 'package:app_studies/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:app_studies/features/pokemon/domain/usecase/pokemon_usecase.dart';

import 'package:app_studies/presenters/pokemon/bloc/pokemon_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeInjector {
  call() {
GetIt.I.registerFactory<HttpFacade>(() => HttpFacade());

GetIt.I.registerFactory<PokemonDataSource>(
        () => PokemonDataSource(GetIt.I<HttpFacade>()));

    GetIt.I.registerFactory<PokemonRepository>(
        () => PokemonRepositoryImpl(GetIt.I<PokemonDataSource>()));

    GetIt.I.registerFactory<PokemonUseCase>(
        () => PokemonUseCaseImpl(GetIt.I<PokemonRepository>()));

    GetIt.I.registerFactory<PokemonBloc>(() => PokemonBloc(
          GetIt.I<PokemonUseCase>(),
        ));
  }
}
