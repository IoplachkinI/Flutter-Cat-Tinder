// import "package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart";
// import "package:flutter/material.dart";
// import "package:http/http.dart" as http;
// import "dart:convert";
// import "package:flutter_card_swiper/flutter_card_swiper.dart";
//
// import "package:cat_tinder/features/cat_swiper/data/models/cat_response_model.dart";
// import "package:cat_tinder/src/widgets/main/cat_card.dart";
// import "package:cat_tinder/src/widgets/main/like_dislike_button.dart";
// import "package:cat_tinder/src/screens/details_screen.dart";
// import "package:cat_tinder/core/utils/constants/app_constants.dart";
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});
//
//   @override
//   MainScreenState createState() => MainScreenState();
// }
//
// class MainScreenState extends State<MainScreen> {
//   CardSwiperController controller = CardSwiperController();
//   int likeCount = 0;
//   int dislikeCount = 0;
//   double lastPercentage = 0;
//   double curPercentage = 0;
//
//   List<CatEntity> cats = [];
//
//   @override
//   void initState() {
//     super.initState();
//     initCats();
//   }
//
//   Future<void> initCats() async {
//     List<CatEntity> tmpCats = [];
//     for (int i = 0; i < preloadCatsAmount; ++i) {
//       tmpCats.add(await fetchCat());
//     }
//     setState(() {
//       cats = tmpCats;
//     });
//   }
//
//   Future<Cat> fetchCat() async {
//     late String imageUrl;
//     String breed = "Unknown";
//     String temperament = "Unknown";
//     String origin = "Unknown";
//     String lifespan = "Unknown";
//     late String description;
//
//     final response = await http.get(Uri.parse(apiUrl));
//     final data = jsonDecode(response.body)[0];
//     setState(() {
//       imageUrl = data["url"] ?? "";
//
//       if (data["breeds"] == null || data["breeds"].isEmpty) {
//         return;
//       }
//
//       breed = data["breeds"][0]["name"];
//       temperament = data["breeds"][0]["temperament"];
//       origin = data["breeds"][0]["origin"];
//       lifespan = data["breeds"][0]["life_span"];
//
//       description = data["breeds"][0]["description"] ?? "";
//     });
//
//     return CatEntity(
//       imageUrl: imageUrl,
//       breed: breed,
//       temperament: temperament,
//       origin: origin,
//       lifespan: lifespan,
//       description: description,
//     );
//   }
//
//   Future<void> updateCat(int ind) async {
//     cats[ind] = await fetchCat();
//   }
//
//   bool _onSwipe(
//     int previousIndex,
//     int? currentIndex,
//     CardSwiperDirection direction,
//   ) {
//     updateCat(previousIndex);
//     if (direction == CardSwiperDirection.right) {
//       setState(() {
//         likeCount++;
//         lastPercentage = curPercentage;
//         curPercentage = dislikeCount / (dislikeCount + likeCount);
//       });
//     } else {
//       setState(() {
//         dislikeCount++;
//         lastPercentage = curPercentage;
//         curPercentage = dislikeCount / (dislikeCount + likeCount);
//       });
//     }
//     return true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: const Color.fromARGB(255, 30, 30, 30)),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/background.jpg"),
//             opacity: 0.2,
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Column(
//             children: [
//               Flexible(
//                 flex: 20,
//                 child: CardSwiper(
//                   duration: const Duration(milliseconds: 200),
//                   initialIndex: 0,
//                   backCardOffset: const Offset(0, 0),
//                   cardsCount: catCount,
//                   controller: controller,
//                   cardBuilder:
//                       (context, index, percentThresholdX, percentThresholdY) =>
//                           cats.isEmpty
//                               ? null
//                               : CatCard(
//                                 catInfo: cats[index],
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder:
//                                           (context) => DetailsScreen(
//                                             catInfo: cats[index],
//                                           ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                   numberOfCardsDisplayed: catCount,
//                   onSwipe: _onSwipe,
//                   maxAngle: 30,
//                   allowedSwipeDirection: const AllowedSwipeDirection.only(
//                     left: true,
//                     right: true,
//                   ),
//                   isLoop: true,
//                 ),
//               ),
//               const Flexible(
//                 flex: 1,
//                 child: SizedBox(width: double.infinity, height: 20),
//               ),
//               Flexible(
//                 flex: 3,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     LikeDislikeButton(
//                       onPressed: () {
//                         controller.swipe(CardSwiperDirection.left);
//                       },
//                       imagePath: "assets/images/dislike_icon.png",
//                     ),
//                     LikeDislikeButton(
//                       onPressed: () {
//                         controller.swipe(CardSwiperDirection.right);
//                       },
//                       imagePath: "assets/images/like_icon.png",
//                     ),
//                   ],
//                 ),
//               ),
//               const Flexible(
//                 flex: 1,
//                 child: SizedBox(width: double.infinity, height: 50),
//               ),
//               Flexible(
//                 flex: 1,
//                 child: TweenAnimationBuilder<double>(
//                   duration: const Duration(milliseconds: 300),
//                   curve: Curves.easeInOut,
//                   tween: Tween<double>(
//                     begin: lastPercentage,
//                     end: curPercentage,
//                   ),
//                   builder:
//                       (context, value, _) => LinearProgressIndicator(
//                         value: value,
//                         minHeight: 5,
//                         color: const Color.fromARGB(255, 30, 30, 30),
//                         backgroundColor: Colors.red,
//                       ),
//                 ),
//               ),
//               Flexible(
//                 flex: 5,
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 100,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "$dislikeCount",
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           fontSize: 30,
//                           color: Color.fromARGB(255, 30, 30, 30),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "$likeCount",
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           fontSize: 30,
//                           color: Color.fromARGB(255, 30, 30, 30),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
