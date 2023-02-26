import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class ContentTabBarComponent extends StatelessWidget {
  final TabController tabController;
  final Function(int) onTap;
  const ContentTabBarComponent({
    super.key,
    required this.onTap,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _ContentTabBarComponentDelegate(
        onTap: onTap,
        tabController: tabController,
      ),
    );
  }
}

class _ContentTabBarComponentDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final Function(int) onTap;
  _ContentTabBarComponentDelegate({
    required this.onTap,
    required this.tabController,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 230),
      child: TabBar(
        onTap: onTap,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        indicatorPadding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        labelColor: AppColors.primaryColor,
        unselectedLabelColor: AppColors.black54,
        labelStyle: AppTypography.tabBarStyle(context),
        indicator: MaterialIndicator(
          color: AppColors.primaryColor,
          height: 2,
          bottomLeftRadius: 5,
          bottomRightRadius: 5,
        ),
        controller: tabController,
        tabs: [
          Tab(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Restaurantes'),
            ),
          ),
          Tab(
            child: Text('Mercados'),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
