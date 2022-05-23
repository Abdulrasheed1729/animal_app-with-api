part of 'animal_cubit.dart';

abstract class AnimalState extends Equatable {}

class AnimalLoading extends AnimalState {
  @override
  List<Object?> get props => [];
}

class AnimalLoaded extends AnimalState {
  final List<Animal> animalList;
  AnimalLoaded(this.animalList);
  @override
  List<Object?> get props => [animalList];
}
