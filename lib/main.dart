import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "dart:convert";
import "package:cached_network_image/cached_network_image.dart";
import "package:flutter_card_swiper/flutter_card_swiper.dart";
import 'package:link_text/link_text.dart';

class Cat {
  final String imageUrl;
  final String breed;
  final String temperament;
  final String origin;
  final String lifespan;
  final String wikiUrl;

  const Cat({
    this.imageUrl = "",
    this.breed = "",
    this.temperament = "",
    this.origin = "",
    this.lifespan = "",
    this.wikiUrl = "",
  });
}

void main() {
  runApp(const CatApp());
}

class DetailsTextRow extends StatelessWidget {
  final String paramName;
  final String paramValue;

  const DetailsTextRow({
    super.key,
    required this.paramName,
    required this.paramValue,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: const TextStyle(fontSize: 18, color: Colors.white),
        children: <TextSpan>[
          TextSpan(
            text: paramName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: paramValue),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Cat catInfo;

  const DetailsScreen({super.key, required this.catInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: catInfo.imageUrl,
              placeholder:
                  (context, url) =>
              const CircularProgressIndicator(
                padding: EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 100,
                ),
                color: Colors.white54,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.5,
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
                  LinkText(
                    "You can find out more on ${catInfo.wikiUrl}",
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    linkStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                    shouldTrimParams: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CatApp extends StatelessWidget {
  const CatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CatTinder",
      // theme: ThemeData(primarySwatch: Colors.white),
      home: const CatScreen(),
    );
  }
}

class CatScreen extends StatefulWidget {
  const CatScreen({super.key});

  @override
  _CatScreenState createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  final String apiUrl =
      "https://api.thecatapi.com/v1/images/search?has_breeds=1&api_key=live_uHeuuoBoUxmYqUUumf4Tv5TALNoSyfJGX5Au8u0V8jUbuXbDwS4et2aot3COVHhn";
  CardSwiperController controller = CardSwiperController();
  int likeCount = 0;

  List<Future<CatCard>> cards = List<Future<CatCard>>.empty(growable: true);
  final List<CatCard> fixedCards = [
    CatCard(catInfo: Cat(
      imageUrl: "https://static.cdnbridge.com/resources/18/160536/picture/3F/85445183.jpg",)),
    CatCard(catInfo: Cat(
        imageUrl: "https://www.wallpaperflare.com/static/450/825/286/kitten-cute-animals-grass-5k-wallpaper.jpg")),
    CatCard(catInfo: Cat(
        imageUrl: "https://islam.ru/sites/default/files/addimg/kittens_00.jpg")),
  ];

  @override
  void initState() {
    super.initState();
    cards.add(fetchCat());
    cards.add(fetchCat());
    cards.add(fetchCat());
  }

  Future<CatCard> fetchCat() async {
    late String imageUrl;
    late String wikiUrl;
    String breed = "Unknown";
    String temperament = "Unknown";
    String origin = "Unknown";
    String lifespan = "Unknown";

    try {
      final response = await http.get(Uri.parse(apiUrl));
      final data = jsonDecode(response.body)[0];
      setState(() {
        imageUrl = data["url"] ?? "";

        if (data["breeds"] == null || data["breeds"].isEmpty) {
          return;
        }

        breed = data["breeds"][0]["name"];
        temperament = data["breeds"][0]["temperament"];
        origin = data["breeds"][0]["origin"];
        lifespan = data["breeds"][0]["life_span"];

        wikiUrl = data["breeds"][0]["wikipedia_url"] ?? "";
      });
    } catch (e) {
      print("Error fetching cat: $e");
      // throw Future.error("Error fetching cat: $e");
    }
    print("Breed: $breed");
    return CatCard(
      catInfo: Cat(
        imageUrl: imageUrl,
        breed: breed,
        temperament: temperament,
        origin: origin,
        lifespan: lifespan,
        wikiUrl: wikiUrl,
      ),
    );
  }

  bool _onSwipe(int previousIndex,
      int? currentIndex,
      CardSwiperDirection direction,) {
    // cards[(previousIndex + cards.length - 1) % 2] = fetchCat();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                duration: const Duration(milliseconds: 50),
                initialIndex: 0,
                cardsCount: 3,
                controller: controller,
                cardBuilder:
                    (context, index, percentThresholdX, percentThresholdY) =>
                        FutureBuilder(
                          future: cards[index],
                          builder: (context, snapshot) {
                            final data = snapshot.data;

                            if (data != null) {
                              return data;
                            }

                            if (snapshot.hasError) {
                              return const Text('Error');
                            }

                            return Container(
                              height: 500,
                              width: 500,
                              color: Colors.red,
                            );
                          },
                        ),
                // cardBuilder: (context, index, percentThresholdX,
                //     percentThresholdY) => fixedCards[index],
                numberOfCardsDisplayed: 3,
                onSwipe: _onSwipe,
                maxAngle: 30,
                allowedSwipeDirection: AllowedSwipeDirection.only(
                  left: true,
                  right: true,
                ),
                isLoop: true,
              ),
            ),
            Text(
              "Cute cats liked: $likeCount",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LikeButton(
                  cardController: controller,
                  callback: () {
                    setState(() {
                      likeCount++;
                    });
                  },
                ),
                DislikeButton(cardController: controller),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DislikeButton extends StatelessWidget {
  final CardSwiperController cardController;

  const DislikeButton({super.key, required this.cardController});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        cardController.swipe(CardSwiperDirection.left);
      },
      icon: Icon(Icons.thumb_down_off_alt_rounded, size: 40),
    );
  }
}

class LikeButton extends StatelessWidget {
  final CardSwiperController cardController;
  final VoidCallback callback;

  const LikeButton({
    super.key,
    required this.cardController,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        print("Button pressed!");
        cardController.swipe(CardSwiperDirection.right);
        callback();
      },
      icon: Icon(Icons.thumb_up_off_alt_rounded, size: 40),
    );
  }
}

class CatCard extends StatelessWidget {
  final Cat catInfo;

  const CatCard({super.key, required this.catInfo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.5,
      child: Card(
        elevation: 4,
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(catInfo: catInfo),
                  ),
                );
              },
              child: CachedNetworkImage(
                imageUrl: catInfo.imageUrl,
                placeholder:
                    (context, url) =>
                const CircularProgressIndicator(
                  padding: EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 100,
                  ),
                  color: Colors.white54,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.5,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black.withAlpha(202),
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.095,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Breed: ${catInfo.breed}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "Origin: ${catInfo.origin}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
