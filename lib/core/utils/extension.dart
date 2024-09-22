import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_app/coffe_app.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get tapPadding => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  double get leftPadding => MediaQuery.of(this).padding.left;
  double get rightPadding => MediaQuery.of(this).padding.right;
}

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: element?.recipeIngredient?.length,
                itemBuilder: (context, index) {
                  var recipe = element?.recipeIngredient?[index];
                  return Text(
                    "Step ${index + 1} - $recipe",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontStyle: FontStyle.italic),
                  );
                },
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
