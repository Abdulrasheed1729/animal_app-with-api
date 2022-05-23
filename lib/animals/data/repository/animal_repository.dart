import '../data_providers/data_provider.dart';
import '../models/animal.dart';
import 'base_request.dart';

class AnimalRepository implements HTTPRequest<List<Animal>> {
  final ApiClient apiClient;
  const AnimalRepository({required this.apiClient});

  final url = 'https://zoo-animal-api.herokuapp.com/animals/rand/10';

  @override
  Future<List<Animal>> execute() async {
    try {
      final dataFromApi = await apiClient.request(
        url: url,
        method: Method.get,
      );
      final animalList = animalFromJson(dataFromApi);
      return animalList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
