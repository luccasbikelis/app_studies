import 'package:app_studies/base/http/http_facade.dart';
import 'package:app_studies/features/home/data/datasource/pokemon_datasource.dart';
import 'package:app_studies/features/home/data/repository/pokemon_repository_impl.dart';
import 'package:app_studies/features/home/domain/repository/pokemon_repository.dart';
import 'package:app_studies/features/home/domain/usecase/pokemon_usecase.dart';
import 'package:app_studies/presenters/home/bloc/home_bloc.dart';
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

    GetIt.I.registerFactory<HomeBloc>(() => HomeBloc(
          GetIt.I<PokemonUseCase>(),
        ));
  }
}
