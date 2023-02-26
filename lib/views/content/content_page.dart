import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/core/theme/app_typography.dart';
import 'package:ifood/views/content/components/header_local_component.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderLocationComponent(
              location: 'Rua das Flroes do Campo, 10'),
          TabBar(
            indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            padding: const EdgeInsets.only(left: 16, right: 230),
            labelColor: AppColors.black,
            unselectedLabelColor: AppColors.black54,
            labelStyle:
                AppTypography.bodyText(context).copyWith(color: Colors.black),
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
        ],
      ),
    );
  }
}
