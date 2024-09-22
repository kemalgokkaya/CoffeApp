import 'package:coffe_app/coffe_app.dart';

class CoffeController extends StateNotifier<List<CoffeModel>?> {
  final Ref ref;
  CoffeController(super.state, this.ref);

  final CoffeRepository _coffeRepository = CoffeRepository();

  Future getRecipes() async {
    List<String> categories = [];
    List<CoffeModel> response = await _coffeRepository.getRecipes();
    state = response;

    for (CoffeModel data in (state as List)) {
      if (!categories.contains(data.category) && data.category != null) {
        categories.add(data.category!);
      }
    }
    ref.read(categoriesProvider.notifier).state = categories;
    ref.read(loadingProvider.notifier).state = false;
  }

  Future<List<CoffeModel>?> searchProduct(String query) async {
    List<CoffeModel>? searchedList = state
        ?.where((data) =>
            data.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
        .toList();

    return searchedList;
  }
}

final homeControllerProvider =
    StateNotifierProvider<CoffeController, List<CoffeModel>?>(
  (ref) {
    return CoffeController(null, ref);
  },
);
final categoriesProvider = StateProvider<List<String>>(
  (ref) {
    return [];
  },
);
final productsByCategoryProvider = StateProvider<List<CoffeModel>?>(
  (ref) {
    return ref.watch(homeControllerProvider);
  },
);

final counterProvider = StateProvider.family<int, String?>((ref, value) => 0);
final loadingProvider = StateProvider<bool>(
  (ref) => true,
);
final basketProvider = StateProvider<List<CoffeModel>>((ref) => []);
final favoriteProvider = StateProvider<List<CoffeModel>>((ref) => []);
