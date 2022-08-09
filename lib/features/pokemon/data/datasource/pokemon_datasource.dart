import 'dart:convert';
import 'package:app_studies/base/datasource/datasource.dart';
import 'package:app_studies/base/http/http_facade.dart';
import 'package:app_studies/features/pokemon/data/model/pokemon_list_model.dart';
import 'package:app_studies/features/pokemon/data/model/pokemon_model.dart';
import 'package:app_studies/features/pokemon/domain/entities/pokemon_list.dart';

class PokemonDataSource implements DataSource {
  final HttpFacade httpFacade;

  PokemonDataSource(this.httpFacade);

  @override
  Future<PokemonList> call(
      {Map<String, dynamic>? param, FromJson? fromJson}) async {
    var url = 'http://104.131.18.84/pokemon/?limit=50&page=0';

    final response = await httpFacade.get(url);

    Map json = const JsonDecoder().convert(response.body);

    final pokemon = (json['data'] as List)
        .map((event) => PokemonModel.fromJson(event))
        .toList();
    final listPokemons = PokemonListModel(pokemon);

    if (response.statusCode == 200) {
      return listPokemons;
    } else {
      throw Exception('Error');
    }
  }
}
