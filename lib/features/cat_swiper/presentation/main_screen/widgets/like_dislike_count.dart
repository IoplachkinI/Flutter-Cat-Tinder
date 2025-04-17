import 'package:flutter/cupertino.dart';

class LikeDislikeCount extends StatelessWidget {
  const LikeDislikeCount({
    super.key,
    required this.dislikeCount,
    required this.likeCount,
  });

  final int dislikeCount;
  final int likeCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$dislikeCount",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 30, 30, 30),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "$likeCount",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 30, 30, 30),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
