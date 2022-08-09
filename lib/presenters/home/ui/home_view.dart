import 'package:app_studies/presenters/home/bloc/home_bloc.dart';
import 'package:app_studies/presenters/first_screen/ui/first_screen.dart';
import 'package:app_studies/presenters/second_screen/ui/second_screen.dart';
import 'package:app_studies/presenters/pokemon/ui/pokemon_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/tabbar';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final tabs = [
    const FirstScreen(),
    const SecondScreen(),
    const PokemonView(),
  ];
  final bloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: bloc.stream,
      builder: (context, snapshot) {
        final currentPosition = snapshot.data ?? 0;
        return Scaffold(
          extendBody: true,
          body: tabs[currentPosition],
          bottomNavigationBar: BottomNavigationBar(
              key: const Key('bottom_navigator_key'),
              selectedItemColor: Colors.black,
              currentIndex: currentPosition,
              selectedFontSize: 10,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6, top: 6),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset('assets/images/home.png'),
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6, top: 6),
                    child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset('assets/images/pikachu.png')),
                  ),
                  label: 'Perfil',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6, top: 6),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset('assets/images/pokemon_icon.png'),
                    ),
                  ),
                  label: 'Pokédex',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              onTap: bloc.updatePage),
        );
      },
    );
  }
}
