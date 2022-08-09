import 'package:app_studies/design_system/appbar/app_bar_widget.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);
  static const routeName = '/first_screen';

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Home',
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Center(
          //     child: Container(
          //   width: 100,
          //   height: 100,
          //   color: Colors.green,
          //   child: const Center(child: Text('First Screen')),
          // ))
        ],
      ),
    );
  }
}
