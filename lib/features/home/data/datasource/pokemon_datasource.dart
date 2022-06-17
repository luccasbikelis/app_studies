import 'dart:convert';

import 'package:app_studies/base/datasource/datasource.dart';
import 'package:app_studies/base/http/http_facade.dart';
import 'package:app_studies/features/home/domain/entities/pokemon.dart';

class PokemonDataSource implements DataSource {
  final HttpFacade httpFacade;

  PokemonDataSource(this.httpFacade);

  @override
  Future<Pokemon> call(
      {Map<String, dynamic>? param, FromJson? fromJson}) async {
    var url = 'http://104.131.18.84/pokemon/?limit=50&page=0';

    final response = await httpFacade.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      return fromJson!(json);
    } else {
      throw Exception('Error');
    }
  }
}
