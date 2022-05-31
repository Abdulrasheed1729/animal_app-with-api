import '../data_providers/data_provider.dart';
import '../models/animal.dart';
import 'base_request.dart';
import 'constants.dart';

class AnimalRepository implements HTTPRequest<List<Animal>> {
  final ApiClient apiClient;
  const AnimalRepository({required this.apiClient});

  final url = apiUri;

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
