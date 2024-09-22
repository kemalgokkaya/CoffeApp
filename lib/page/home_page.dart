import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:coffe_app/coffe_app.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomeePageState();
}

class _HomeePageState extends ConsumerState<HomePage> {
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
    final isLoading = ref.watch(loadingProvider);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Kahve İçmek İçin",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Harika Bir Gün",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
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
                          focusedBorder: UnderlineInputBorder(),
                          border: UnderlineInputBorder(),
                          hintStyle: TextStyle(color: Colors.white),
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
                  const Text(
                    "Kategoriler",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  // Kategoriler
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : Container(
                          height: 50,
                          color: Colors.transparent,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryState.length,
                            itemBuilder: (context, index) {
                              String category = categoryState[index];
                              return Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: () {
                                    List<CoffeModel>? newList = state
                                        ?.where(
                                            (data) => data.category == category)
                                        .toList();
                                    ref
                                        .read(
                                            productsByCategoryProvider.notifier)
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Ürünler",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  // Ürünler
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : Expanded(
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
                              CoffeModel? product =
                                  productsByCategoryState?[index];
                              int count = ref.watch(
                                counterProvider(product?.id),
                              );
                              var countController = ref
                                  .read(counterProvider(product?.id).notifier);
                              return Stack(
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        showCoffeeInfo(context, product),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: InkWell(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Hero(
                                                  tag: product?.image ?? "",
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        product?.image ?? "",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(
                                                product?.name ?? "No Name",
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    if (ref.read(
                                                            counterProvider(
                                                                product?.id)) >
                                                        0) {
                                                      ref
                                                          .read(counterProvider(
                                                                  product?.id)
                                                              .notifier)
                                                          .state--;
                                                    }
                                                    if (ref.read(
                                                            counterProvider(
                                                                product?.id)) ==
                                                        0) {
                                                      addedProduct
                                                          .remove(product);
                                                    }
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.brown,
                                                      borderRadius:
                                                          BorderRadius.only(
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
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    countController.state += 1;
                                                    if (ref.read(
                                                            counterProvider(
                                                                product?.id)) >
                                                        0) {
                                                      ref
                                                          .read(basketProvider
                                                              .notifier)
                                                          .state = {
                                                        ...ref.read(
                                                            basketProvider),
                                                        product!
                                                      }.toList();
                                                    }
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.brown,
                                                      borderRadius:
                                                          BorderRadius.only(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 130),
                                        child: IconButton(
                                          onPressed: () {
                                            var favorites =
                                                ref.read(favoriteProvider);
                                            var favoriteController = ref.read(
                                                favoriteProvider.notifier);
                                            if (!favorites.contains(product)) {
                                              favoriteController.state = [
                                                ...favorites,
                                                product!
                                              ];
                                            } else {
                                              favoriteController.state =
                                                  favorites
                                                      .where((element) =>
                                                          element != product)
                                                      .toList();
                                            }
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: ref
                                                    .watch(favoriteProvider)
                                                    .contains(product)
                                                ? Colors.red
                                                : Colors.white,
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
