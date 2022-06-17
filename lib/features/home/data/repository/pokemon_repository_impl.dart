import 'package:app_studies/base/datasource/datasource.dart';
import 'package:app_studies/features/home/data/model/pokemon_model.dart';
import 'package:app_studies/features/home/domain/entities/pokemon.dart';
import 'package:app_studies/features/home/domain/repository/pokemon_repository.dart';


class PokemonRepositoryImpl implements PokemonRepository{
  final DataSource dataSource;

  PokemonRepositoryImpl(this.dataSource);
  @override
  Future<Pokemon> call() async {
    return await dataSource(fromJson: (json) => PokemonModel.fromJson(json));
  }
}