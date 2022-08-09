import 'package:app_studies/design_system/appbar/app_bar_widget.dart';
import 'package:app_studies/features/pokemon/domain/entities/pokemon_list.dart';
import 'package:app_studies/presenters/pokemon/bloc/pokemon_bloc.dart';
import 'package:app_studies/presenters/pokemon/ui/widget/pokemon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PokemonView extends StatefulWidget {
  const PokemonView({Key? key}) : super(key: key);
  static const routeName = '/pokemon_view';

  @override
  State<PokemonView> createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  final bloc = GetIt.I<PokemonBloc>();

  @override
  void initState() {
    bloc.loadResults();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Pokédex',
        backgroundColor: Colors.lightBlue,
      ),
      body: Stack(
        children: [
          StreamBuilder<PokemonList>(
              stream: bloc.resultStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox.shrink();
                }

                final listPokemon = snapshot.data?.pokemon ?? [];

                return SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  child: ListView.builder(
                      itemCount: listPokemon.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PokemonWidget(
                          item: listPokemon[index],
                        );
                      }),
                );
              }),
          StreamBuilder<bool>(
            stream: bloc.controllerLoadingStream,
            builder: (context, snapshot) {
              final loading = snapshot.data ?? true;
              if (loading) {
                return Container(
                    color: Colors.white.withOpacity(0.5),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: const CircularProgressIndicator(
                      color: Colors.blue,
                    ));
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
