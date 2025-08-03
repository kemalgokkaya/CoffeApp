import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_app/model/coffe_model/coffe_model.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get topPadding => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  double get leftPadding => MediaQuery.of(this).padding.left;
  double get rightPadding => MediaQuery.of(this).padding.right;
}

void showCoffeeInfo(BuildContext context, CoffeModel? element) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(110, 63, 0, 1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.close,
                          color: Colors.white, size: 28),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      element?.name ?? "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (element?.category != null)
                    Center(
                      child: Chip(
                        label: Text(
                          element!.category!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        backgroundColor: Colors.brown.shade400,
                      ),
                    ),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Hero(
                      tag: element?.image ?? "",
                      child: CachedNetworkImage(
                        imageUrl: element?.image ?? "",
                        fit: BoxFit.cover,
                        height: 220,
                        width: double.infinity,
                        placeholder: (context, url) => Container(
                          height: 220,
                          color: Colors.brown.shade200,
                          child: const Center(
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.broken_image, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (element?.recipeIngredient?.isNotEmpty ?? false) ...[
                    const Text(
                      "Hazırlama Adımları:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      itemCount: element!.recipeIngredient!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final step = element.recipeIngredient![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            "• Adım ${index + 1}: $step",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                  if (element?.description != null)
                    Text(
                      element!.description!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
