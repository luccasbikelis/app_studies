import 'package:app_studies/dependency_injection/injector.dart';
import 'package:flutter/material.dart';

class AppController with ChangeNotifier {
  AppController();

  void loadDependencyInjection() {
    Injector()();
  }

  call() async {
    loadDependencyInjection();
  }
}
