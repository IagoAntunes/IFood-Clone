import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';

import '../../../core/theme/app_icons.dart';

class BottomNavigatorComponent extends StatelessWidget {
  const BottomNavigatorComponent({
    super.key,
    required this.items,
    required this.onTap,
    this.currentIndex = 0,
  });
  final List<BottomNavigatorItemComponent> items;
  final int currentIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.white),
      child: Column(
        children: [
          Container(
            height: 1,
            color: AppColors.grey2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items
                  .map<Widget>(
                    (e) => e.copyWith(
                      isActive: items.indexOf(e) == currentIndex,
                      onTap: () => onTap(
                        items.indexOf(e),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigatorItemComponent extends StatelessWidget {
  const BottomNavigatorItemComponent({
    super.key,
    required this.label,
    required this.activeIcon,
    required this.icon,
    this.onTap,
    this.isActive = false,
  });
  final String label;
  final String activeIcon;
  final String icon;
  final bool isActive;
  final Function()? onTap;

  copyWith({
    String? label,
    String? activeIcon,
    String? icon,
    bool? isActive,
    Function()? onTap,
  }) {
    return BottomNavigatorItemComponent(
      activeIcon: activeIcon ?? this.activeIcon,
      label: label ?? this.label,
      icon: icon ?? this.icon,
      isActive: isActive ?? this.isActive,
      onTap: onTap ?? this.onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            AppIcon(icon: isActive ? activeIcon : icon),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
