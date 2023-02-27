import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/core/theme/app_typography.dart';
import 'package:ifood/models/category.dart';

class CategoryItemComponent extends StatelessWidget {
  const CategoryItemComponent({
    super.key,
    required this.category,
  });
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          category.picture,
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            category.name.isNotEmpty ? category.name : '',
            style: AppTypography.small(context).copyWith(color: AppColors.grey),
          ),
        ),
      ],
    );
  }
}
