import "package:flutter/material.dart";

import 'package:cat_tinder/core/utils/values/colors.dart';

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
        style: const TextStyle(fontSize: 18, color: AppColors.secondary),
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
