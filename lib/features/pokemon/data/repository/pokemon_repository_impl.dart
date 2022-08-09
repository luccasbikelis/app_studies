import 'package:app_studies/base/datasource/datasource.dart';
import 'package:app_studies/features/pokemon/data/model/pokemon_model.dart';
import 'package:app_studies/features/pokemon/domain/entities/pokemon_list.dart';
import 'package:app_studies/features/pokemon/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final DataSource dataSource;

  PokemonRepositoryImpl(this.dataSource);
  @override
  Future<PokemonList> call() async {
    return await dataSource(fromJson: (json) => PokemonModel.fromJson(json));
  }
}
