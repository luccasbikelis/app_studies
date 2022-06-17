import 'package:app_studies/features/home/domain/entities/pokemon.dart';
import 'package:app_studies/presenters/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = '/home_view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bloc = GetIt.I<HomeBloc>();

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: StreamBuilder<Pokemon>(
                stream: bloc.resultStream,
                builder: (context, snapshot) {
                  final text = snapshot.data?.slug;
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child:  Center(child: Text(text ?? '')),
                  );
                }),
          )
        ],
      ),
    );
  }
}
