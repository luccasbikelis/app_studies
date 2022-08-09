import 'package:app_studies/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget({Key? key, this.item}) : super(key: key);

  final Pokemon? item;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        title: Text(item!.name),
        leading: Image.network(item!.thumbnailImage),
        trailing:
            Text('#${item!.number}', style: TextStyle(color: Colors.grey[500])),
        onTap: () {
          descriptionPokemon(context);
        },
      ),
    );
  }

  void descriptionPokemon(BuildContext context) {
    showDialog(
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Dialog(
            child: SizedBox(
              height: 160,
              width: 160,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(item!.description),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
