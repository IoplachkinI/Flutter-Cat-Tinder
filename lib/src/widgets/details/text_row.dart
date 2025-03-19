import "package:flutter/material.dart";

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
