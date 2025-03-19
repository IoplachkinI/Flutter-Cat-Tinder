import "package:flutter/material.dart";

class LikeDislikeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String imagePath;

  const LikeDislikeButton({
    super.key,
    required this.onPressed,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.7),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
            BoxShadow(color: Color.fromARGB(255, 202, 202, 202)),
            BoxShadow(color: Colors.white, spreadRadius: -5.0, blurRadius: 5),
          ],
          shape: BoxShape.circle,
        ),
        child: Container(
          padding: EdgeInsets.only(top: 5),
          child: ClipOval(
            child: Image(
              image: ResizeImage(AssetImage(imagePath), height: 60, width: 60),
            ),
          ),
        ),
      ),
    );
  }
}
