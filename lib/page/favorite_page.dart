import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_app/coffe_app.dart';
import 'package:flutter/material.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  ConsumerState<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favoriteProduct = ref.watch(favoriteProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: const Text("Favorilerim"),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown, Colors.white],
          ),
        ),
        child: favoriteProduct.isNotEmpty
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                itemCount: favoriteProduct.length,
                itemBuilder: (BuildContext context, int index) {
                  CoffeModel favProduct = favoriteProduct[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Hero(
                            tag: favProduct.image ?? "",
                            child: CachedNetworkImage(
                              imageUrl: favProduct.image ?? "",
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              ref.read(favoriteProvider.notifier).state =
                                  favoriteProduct
                                      .where((element) => element != favProduct)
                                      .toList();
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${favProduct.name}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  );
                },
              )
            : const Center(
                child: Text(
                  "Favori Listeniz Boş...",
                ),
              ),
      ),
    );
  }
}
