import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../core/theme/app_typography.dart';

class HeaderLocationComponent extends StatelessWidget {
  const HeaderLocationComponent({super.key, required this.location});
  final String location;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      location,
                      style: AppTypography.bodyTextBold(context),
                    ),
                    const AppIcon(
                      icon: AppIcons.arrowDown,
                      size: Size(20, 20),
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
