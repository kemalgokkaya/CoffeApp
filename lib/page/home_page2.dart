import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:coffe_app/coffe_app.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class HomeePage extends ConsumerStatefulWidget {
  const HomeePage({super.key});

  @override
  ConsumerState<HomeePage> createState() => _HomeePageState();
}

class _HomeePageState extends ConsumerState<HomeePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ref.read(homeControllerProvider.notifier).getRecipes();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categoryState = ref.watch(categoriesProvider);
    final List<CoffeModel>? state = ref.watch(homeControllerProvider);
    final List<CoffeModel>? productsByCategoryState =
        ref.watch(productsByCategoryProvider);
    final List<CoffeModel?> addedProduct = ref.watch(basketProvider);

    void showCoffeeInfo(BuildContext context, CoffeModel? element) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(110, 63, 0, 1),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        child: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  Text(
                    "${element?.name}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "${element?.category}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontStyle: FontStyle.italic),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Hero(
                      tag: element?.image ?? "",
                      child: CachedNetworkImage(
                        imageUrl: element?.image ?? "",
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Step 1 -" "${element?.recipeIngredient?[0]}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "Step 2 -" "${element?.recipeIngredient?[1]}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "Step 3 - " "${element?.recipeIngredient?[2]},",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "Step 4 -" "${element?.recipeIngredient?[3]}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Text(
                    "${element?.description}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.brown, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Kahve İçmek İçin",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(),
                        child: const Icon(
                          Icons.notifications,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Harika Bir Gün",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Search bar
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 20),
                    child: TypeAheadField<CoffeModel>(
                      builder: (context, controller, focusNode) => TextField(
                        controller: controller,
                        focusNode: focusNode,
                        autofocus: false,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Ne İçmek İstersin?...",
                        ),
                      ),
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion.name ?? ""),
                        );
                      },
                      // Tıklandığında olacak işlem
                      onSelected: (suggestion) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        return showCoffeeInfo(context, suggestion);
                      },
                      //Öneri listesi göster
                      suggestionsCallback: (pattern) async {
                        return ref
                            .read(homeControllerProvider.notifier)
                            .searchProduct(pattern);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 280),
                    child: const Text(
                      "Categoriler",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Kategoriler
                  Container(
                    height: 50,
                    color: Colors.transparent,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryState.length,
                      itemBuilder: (context, index) {
                        String category = categoryState[index];
                        return Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              List<CoffeModel>? newList = state
                                  ?.where((data) => data.category == category)
                                  .toList();
                              ref
                                  .read(productsByCategoryProvider.notifier)
                                  .state = newList;
                            },
                            child: Text(
                              category,
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Ürünler
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 15,
                        crossAxisCount: 2,
                      ),
                      itemCount: productsByCategoryState?.length ?? 0,
                      itemBuilder: (context, index) {
                        CoffeModel? element = productsByCategoryState?[index];
                        int count = ref.watch(
                          counterProvider(element?.id),
                        );
                        var countController =
                            ref.read(counterProvider(element?.id).notifier);
                        return Stack(
                          children: [
                            InkWell(
                              onTap: () => showCoffeeInfo(context, element),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: InkWell(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Hero(
                                            tag: element?.image ?? "",
                                            child: CachedNetworkImage(
                                              imageUrl: element?.image ?? "",
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(
                                          element?.name ?? "No Name",
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (ref.read(counterProvider(
                                                      element?.id)) >
                                                  0) {
                                                ref
                                                    .read(counterProvider(
                                                            element?.id)
                                                        .notifier)
                                                    .state--;
                                              }
                                              if (ref.read(counterProvider(
                                                      element?.id)) ==
                                                  0) {
                                                addedProduct.remove(element);
                                              }
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: const BoxDecoration(
                                                color: Colors.brown,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                ),
                                              ),
                                              child: const Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: count > 0
                                                  ? const Color.fromARGB(
                                                      31, 197, 192, 192)
                                                  : Colors.white,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(30),
                                              ),
                                            ),
                                            child: count == 0
                                                ? const SizedBox.shrink()
                                                : Text(
                                                    count.toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              countController.state += 1;
                                              if (ref.read(counterProvider(
                                                      element?.id)) >
                                                  0) {
                                                ref
                                                    .read(
                                                        basketProvider.notifier)
                                                    .state = {
                                                  ...ref.read(basketProvider),
                                                  element!
                                                }.toList();
                                              }
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: const BoxDecoration(
                                                color: Colors.brown,
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(20),
                                                ),
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 130),
                                  child: IconButton(
                                    onPressed: () {
                                      ref
                                          .read(favoriteProvider.notifier)
                                          .state = ref.read(favoriteProvider);
                                    },
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 121, 85, 72),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(
                  colors: [Colors.brown, Colors.white],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(1, 1),
                    blurRadius: 3,
                  ),
                ],
              ),
              margin: const EdgeInsets.only(bottom: 40),
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShoppingPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavoritePage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.brown,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
