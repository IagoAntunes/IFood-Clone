import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../core/theme/app_typography.dart';

class FiltersComponent extends StatelessWidget {
  const FiltersComponent({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _FiltersComponentDelegate(
        'location',
      ),
    );
  }
}

class _FiltersComponentDelegate extends SliverPersistentHeaderDelegate {
  final String location;

  _FiltersComponentDelegate(this.location);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.white,
      height: 54,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const [
          SizedBox(width: 16),
          FilterItemComponent(
            label: 'Ordenar',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Pra retirar',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Entra grátis',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Vale refeição',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Distancia',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Entrega Parceira',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Filtros',
            icon: AppIcons.arrowDown,
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 54;

  @override
  double get minExtent => 54;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class FilterItemComponent extends StatelessWidget {
  const FilterItemComponent({
    super.key,
    this.icon,
    required this.label,
  });
  final String label;
  final String? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, right: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: AppColors.white,
          border: Border.all(color: AppColors.grey2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Text(
                label,
                style: AppTypography.filterItemStyle(context).copyWith(
                  color: AppColors.grey7,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: AppIcon(
                    icon: icon!,
                    size: const Size(14, 14),
                    color: AppColors.grey7,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
