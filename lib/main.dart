import 'package:animal_app/bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AnimalObserver(),
  );
}
