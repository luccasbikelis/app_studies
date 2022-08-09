import 'package:app_studies/design_system/appbar/app_bar_widget.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);
  static const routeName = '/second_screen';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
          title: 'Perfil', backgroundColor: Colors.greenAccent),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
              // child: Container(
              //   width: 100,
              //   height: 100,
              //   color: Colors.red,
              //   child: const Center(child: Text('Second Screen')),
              // ),
              )
        ],
      ),
    );
  }
}
