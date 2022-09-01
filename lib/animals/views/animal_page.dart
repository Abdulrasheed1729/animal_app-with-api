import 'package:animal_app/animals/cubit/animal_cubit.dart';
import 'package:animal_repository/animal_repository.dart';
import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class AnimalPage extends StatelessWidget {
  const AnimalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AnimalCubit(
        AnimalRepository(
          apiClient: ApiClient(
            Client(),
          ),
        ),
      ),
      child: const AnimalView(),
    );
  }
}

class AnimalView extends StatefulWidget {
  const AnimalView({Key? key}) : super(key: key);

  @override
  State<AnimalView> createState() => _AnimalViewState();
}

class _AnimalViewState extends State<AnimalView> {
  @override
  void initState() {
    context.read<AnimalCubit>().loadAnimalList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal App'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          context.read<AnimalCubit>().reloadAnimalList();
        },
      ),
      body: Center(
        child: BlocBuilder<AnimalCubit, AnimalState>(
          builder: (context, state) {
            if (state is AnimalLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AnimalLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 20.0),
                shrinkWrap: true,
                itemCount: state.animalList.length,
                itemBuilder: (context, index) {
                  List<Animal> animalList = state.animalList;
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 300,
                        width: 250,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        animalList[index].imageLink),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Text(
                                'Name:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(animalList[index].name),
                              const Text(
                                'Latin Name:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(animalList[index].latinName),
                              const Text(
                                'Habitat:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  animalList[index].habitat,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
