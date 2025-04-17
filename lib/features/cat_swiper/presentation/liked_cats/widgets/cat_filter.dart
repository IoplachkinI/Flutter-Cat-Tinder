import 'package:cat_tinder/core/utils/values/colors.dart';
import 'package:flutter/material.dart';

import 'package:cat_tinder/features/cat_swiper/presentation/liked_cats/liked_cats_viewmodel.dart';

class CatFilter extends StatelessWidget {
  const CatFilter({
    super.key,
    required this.viewModel,
    required this.selected,
    required this.breeds,
  });

  final LikedCatsViewModel viewModel;
  final String selected;
  final List<String> breeds;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
      child: DropdownButton<String>(
        dropdownColor: AppColors.primary,
        style: const TextStyle(color: AppColors.secondary, fontSize: 17),
        iconEnabledColor: AppColors.secondary,
        alignment: AlignmentDirectional.bottomEnd,
        isExpanded: true,
        value: selected != "" ? selected : 'All',
        items:
            ['All', ...breeds].map((breed) {
              return DropdownMenuItem(value: breed, child: Text(breed));
            }).toList(),
        onChanged: (value) {
          if (value == 'All') {
            viewModel.applyBreedFilter("");
          } else if (value != null) {
            viewModel.applyBreedFilter(value);
          }
        },
      ),
    );
  }
}
