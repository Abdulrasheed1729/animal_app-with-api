import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:animal_repository/animal_repository.dart';

import '../models/models.dart';

part 'animal_state.dart';

class AnimalCubit extends Cubit<AnimalState> {
  final HTTPRequest httpRequest;
  AnimalCubit(this.httpRequest) : super(AnimalLoading());
  List<Animal> animals = [];

  Future<void> loadAnimalList() async {
    try {
      animals = await httpRequest.execute();
      emit(AnimalLoaded(animals));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> reloadAnimalList() async {
    emit(AnimalLoading());
    try {
      animals = await httpRequest.execute();
      emit(AnimalLoaded(animals));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
