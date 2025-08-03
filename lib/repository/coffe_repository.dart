import 'package:coffe_app/coffe_app.dart';
import 'package:coffe_app/core/utils/endpoint.dart';

class CoffeRepository {
  final BaseRepository _baseRepository;

  static final CoffeRepository _instance = CoffeRepository._internal();

  factory CoffeRepository() {
    return _instance;
  }
  CoffeRepository._internal() : _baseRepository = BaseRepository();

  Future<List<CoffeModel>> getRecipes() async {
    Response response =
        await _baseRepository.executeRequest(RequestType.get, getCoffeURL());

    return (response.data as List)
        .map((element) => CoffeModel.fromJson(element))
        .toList();
  }
}
