import "package:flutter/material.dart";
import "package:cached_network_image/cached_network_image.dart";

import "package:cat_tinder/src/models/cat.dart";
import "package:cat_tinder/src/widgets/details/text_row.dart";

class DetailsScreen extends StatelessWidget {
  final Cat catInfo;

  const DetailsScreen({super.key, required this.catInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: catInfo.imageUrl,
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
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: Text(
                  catInfo.breed,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(height: 1, thickness: 1, color: Colors.white),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      catInfo.description,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    DetailsTextRow(
                      paramName: "Origin: ",
                      paramValue: catInfo.origin,
                    ),
                    DetailsTextRow(
                      paramName: "Temperament: ",
                      paramValue: catInfo.temperament,
                    ),
                    DetailsTextRow(
                      paramName: "Lifespan: ",
                      paramValue: "${catInfo.lifespan} years",
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
