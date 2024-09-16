import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_app/coffe_app.dart';

import 'package:flutter/material.dart';

class ShoppingPage extends ConsumerStatefulWidget {
  const ShoppingPage({super.key});

  @override
  ShoppingPageState createState() => ShoppingPageState();
}

class ShoppingPageState extends ConsumerState<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    final List<CoffeModel?> basketProduct = ref.watch(basketProvider);
    final List<CoffeModel>? suggestionProduct =
        ref.watch(homeControllerProvider);
    final List<CoffeModel>? productsByCategoryState =
        ref.watch(productsByCategoryProvider);
    final List<CoffeModel?> addedProduct = ref.watch(basketProvider);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.brown, Colors.white],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const Text(
                        "Sepetim",
                        style: TextStyle(
                            fontSize: 25, fontStyle: FontStyle.italic),
                      ),
                      const Icon(Icons.menu)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: basketProduct.length,
                    itemBuilder: (context, index) {
                      CoffeModel? element = basketProduct[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            height: 90,
                            child: ListTile(
                              dense: true,
                              leading: Hero(
                                tag: basketProduct[index]?.image ?? "",
                                child: CachedNetworkImage(
                                  imageUrl: basketProduct[index]?.image ?? "",
                                ),
                              ),
                              title: Text(
                                "${basketProduct[index]?.name}",
                                style: const TextStyle(fontSize: 14),
                              ),
                              subtitle: Text(
                                "${basketProduct[index]?.recipeIngredient}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              trailing: Text(
                                  "${ref.watch(counterProvider(element?.id))}"),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      CoffeModel? randomProduct = suggestionProduct?[index];
                      CoffeModel? element = productsByCategoryState?[index];
                      var countController =
                          ref.read(counterProvider(element?.id).notifier);
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: CachedNetworkImage(
                                height: 100,
                                imageUrl: randomProduct?.image ?? ""),
                          ),
                          Text(
                            "${randomProduct?.name}",
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    countController.state += 1;
                                    if (ref.read(counterProvider(element?.id)) >
                                        0) {
                                      ref.read(basketProvider.notifier).state =
                                          {
                                        ...ref.read(basketProvider),
                                        element!
                                      }.toList();
                                    }
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    if (ref.read(counterProvider(element?.id)) >
                                        0) {
                                      ref
                                          .read(counterProvider(element?.id)
                                              .notifier)
                                          .state--;
                                    }
                                    if (ref.read(
                                            counterProvider(element?.id)) ==
                                        0) {
                                      addedProduct.remove(element);
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
