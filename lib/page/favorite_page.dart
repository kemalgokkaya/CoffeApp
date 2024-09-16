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
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown, Colors.white],
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeePage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 90),
                    child: const Text(
                      "Favorilerim",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            favoriteProduct.isNotEmpty
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: favoriteProduct.length,
                      itemBuilder: (BuildContext context, int index) {
                        CoffeModel favProduct = favoriteProduct[index];
                        return SizedBox(
                          child: Text("${favProduct.name}"),
                        );
                      },
                    ),
                  )
                : const Center(
                    child: Text("Favori Listeniz Boş..."),
                  )
          ],
        ),
      ),
    );
  }
}
