import 'package:coffe_app/coffe_app.dart';

class CoffeController extends StateNotifier<List<CoffeModel>?> {
  final Ref ref;
  CoffeController(super.state, this.ref);

  final CoffeRepository _coffeRepository = CoffeRepository();
  List<CoffeModel>? _cachedData;
  bool _isLoading = false;

  Future<void> getRecipes() async {
    if (_isLoading) return;

    _isLoading = true;
    ref.read(loadingProvider.notifier).state = true;

    try {
      if (_cachedData != null) {
        state = _cachedData;
        _updateCategories();
        return;
      }

      final List<CoffeModel> response = await _coffeRepository.getRecipes();
      _cachedData = response;
      state = response;
      _updateCategories();
    } catch (e) {
      // Error handling
      Logger().e('Error fetching recipes: $e');
    } finally {
      _isLoading = false;
      ref.read(loadingProvider.notifier).state = false;
    }
  }

  void _updateCategories() {
    if (state == null) return;

    final Set<String> categories = {};
    for (final data in state!) {
      if (data.category != null && data.category!.isNotEmpty) {
        categories.add(data.category!);
      }
    }
    ref.read(categoriesProvider.notifier).state = categories.toList();
  }

  Future<List<CoffeModel>> searchProduct(String query) async {
    if (state == null || query.isEmpty) return [];

    final lowercaseQuery = query.toLowerCase();
    return state!
        .where((data) =>
            data.name?.toLowerCase().contains(lowercaseQuery) ?? false)
        .toList();
  }

  void clearCache() {
    _cachedData = null;
    state = null;
  }
}

// Optimized providers
final homeControllerProvider =
    StateNotifierProvider<CoffeController, List<CoffeModel>?>(
  (ref) => CoffeController(null, ref),
);

final categoriesProvider = StateProvider<List<String>>((ref) => []);

final productsByCategoryProvider = StateProvider<List<CoffeModel>?>((ref) {
  final allProducts = ref.watch(homeControllerProvider);
  return allProducts;
});

final counterProvider = StateProvider.family<int, String?>((ref, value) => 0);

final loadingProvider = StateProvider<bool>((ref) => true);

final basketProvider = StateProvider<List<CoffeModel>>((ref) => []);

final favoriteProvider = StateProvider<List<CoffeModel>>((ref) => []);

// Computed providers for better performance
final basketItemCountProvider = Provider<int>((ref) {
  final basket = ref.watch(basketProvider);
  return basket.length;
});

final favoriteItemCountProvider = Provider<int>((ref) {
  final favorites = ref.watch(favoriteProvider);
  return favorites.length;
});
