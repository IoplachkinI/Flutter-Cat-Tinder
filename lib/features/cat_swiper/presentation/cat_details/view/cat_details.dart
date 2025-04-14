import "package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart";
import "package:flutter/material.dart";
import "package:cached_network_image/cached_network_image.dart";

import "package:cat_tinder/features/cat_swiper/data/models/cat_response_model.dart";
import "package:cat_tinder/src/widgets/details/text_row.dart";

class DetailsScreen extends StatelessWidget {
  final CatEntity cat;

  const DetailsScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: cat.imageUrl ?? "",
                placeholder:
                    (context, url) => const SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white54),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 0,
                ),
                child: Text(
                  cat.breed ?? "",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(height: 1, thickness: 1, color: Colors.white),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      cat.description ?? "",
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    DetailsTextRow(
                      paramName: "Origin: ",
                      paramValue: cat.origin ?? "",
                    ),
                    DetailsTextRow(
                      paramName: "Temperament: ",
                      paramValue: cat.temperament ?? "",
                    ),
                    DetailsTextRow(
                      paramName: "Lifespan: ",
                      paramValue: "${cat.lifespan} years",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
