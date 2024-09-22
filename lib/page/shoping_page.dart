import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_app/coffe_app.dart';

import 'package:flutter/material.dart';

class ShoppingPage extends ConsumerWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CoffeModel?> basketProduct = ref.watch(basketProvider);
    final List<CoffeModel?> addedProduct = ref.watch(basketProvider);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Sepetim",
          style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: context.tapPadding + 56),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown, Colors.white],
          ),
        ),
        child: basketProduct.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: basketProduct.length,
                itemBuilder: (context, index) {
                  CoffeModel? product = basketProduct[index];
                  var countController =
                      ref.read(counterProvider(product?.id).notifier);
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: const [BoxShadow()],
                            gradient: const LinearGradient(
                                colors: [Colors.white, Colors.brown])),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              width: 120,
                              height: 100,
                              child: Hero(
                                tag: product?.image ?? "",
                                child: CachedNetworkImage(
                                  imageUrl: product?.image ?? "",
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${basketProduct[index]?.name}",
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      "${basketProduct[index]?.recipeIngredient}",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Text(
                                      "${ref.watch(counterProvider(product?.id))}",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        countController.state += 1;
                                        if (ref.read(
                                                counterProvider(product?.id)) >
                                            0) {
                                          ref
                                              .read(basketProvider.notifier)
                                              .state = {
                                            ...ref.read(basketProvider),
                                            product!
                                          }.toList();
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        if (ref.read(
                                                counterProvider(product?.id)) >
                                            0) {
                                          ref
                                              .read(counterProvider(product?.id)
                                                  .notifier)
                                              .state--;
                                        }
                                        if (ref.read(
                                                counterProvider(product?.id)) ==
                                            0) {
                                          addedProduct.remove(product);
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  );
                },
              )
            : const Center(
                child: Text(
                  "Sepetiniz Boş Görünüyor...",
                  style: TextStyle(color: Colors.black, fontSize: 26),
                ),
              ),
      ),
    );
  }
}
