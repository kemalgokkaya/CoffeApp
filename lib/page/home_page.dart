import 'package:coffe_app/coffe_app.dart';
import 'package:flutter/material.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF80CEE1),
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF80CEE1),
        title: const Icon(
          Icons.local_cafe,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            child: const Text(
              "Kahve İçin Harika Bir Gün!",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: "Kahveni Seç...",
              hintStyle: TextStyle(color: Colors.white60),
              icon: Icon(Icons.search),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryState.length,
              itemBuilder: (context, index) {
                String category = categoryState[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            ref.watch(selectCategoryProvider) == category
                                ? Colors.grey
                                : Colors.transparent)),
                    onPressed: () {
                      List<CoffeModel>? newList = state
                          ?.where((data) => data.category == category)
                          .toList();
                      ref.read(productsByCategoryProvider.notifier).state =
                          newList;
                      ref.read(selectCategoryProvider.notifier).state =
                          category;
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: productsByCategoryState?.length ?? 0,
                itemBuilder: (context, index) {
                  CoffeModel? element = productsByCategoryState?[index];
                  return Column(
                    children: [
                      Container(
                        width: 160,
                        height: 200,
                        child: Column(
                          children: [
                            Image(
                              image: NetworkImage(element?.image ?? ""),
                            ),
                            Column(
                              children: [
                                Text(
                                  element?.name ?? "No Name",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add,
                                        color: Color.fromARGB(255, 165, 58, 19),
                                      ),
                                    ),
                                    const Text(
                                      "|",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Color.fromARGB(255, 165, 58, 19),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          element?.name ?? "No Name",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.home,
                  size: 35,
                  color: Colors.white,
                ),
                Icon(
                  Icons.favorite,
                  size: 35,
                  color: Colors.white,
                ),
                Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
