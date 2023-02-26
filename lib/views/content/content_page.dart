import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/core/theme/app_icons.dart';
import 'package:ifood/core/theme/app_typography.dart';
import 'package:ifood/models/category.dart';
import 'package:ifood/views/content/components/bottom_navigator_component.dart';
import 'package:ifood/views/content/components/category_item_component.dart';
import 'package:ifood/views/content/components/header_local_component.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../controllers/content_controller.dart';
import 'components/content_tab_bar_component.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  final controller = ContentController();
  List<Category> categorys = [];
  @override
  void initState() {
    super.initState();
    categorys = controller.getCategorys();
    tabController = TabController(length: 2, vsync: this);
  }

  int currentIndexi = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              HeaderLocationComponent(location: 'Rua Flores do Campo,10'),
              ContentTabBarComponent(
                tabController: tabController,
                onTap: (index) {},
              ),
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    return await Future.value();
                  },
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 86,
                          child: ListView.builder(
                            itemCount: categorys.length,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: index == 0 ? 16 : 0,
                                    right: index == categorys.length - 1
                                        ? 16
                                        : 10),
                                child: CategoryItemComponent(
                                  category: categorys[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomNavigatorComponent(
                currentIndex: currentIndexi,
                onTap: (index) {
                  setState(() {
                    currentIndexi = index;
                  });
                },
                items: const [
                  BottomNavigatorItemComponent(
                    label: 'Inicio',
                    activeIcon: AppIcons.homeActive,
                    icon: AppIcons.home,
                  ),
                  BottomNavigatorItemComponent(
                    label: 'Busca',
                    activeIcon: AppIcons.searchActive,
                    icon: AppIcons.search,
                  ),
                  BottomNavigatorItemComponent(
                    label: 'Pedidos',
                    activeIcon: AppIcons.ordersActive,
                    icon: AppIcons.orders,
                  ),
                  BottomNavigatorItemComponent(
                    label: 'Perfil',
                    activeIcon: AppIcons.profileActive,
                    icon: AppIcons.profile,
                  ),
                ],
              ),
            ],
          ),

          // Column(
          //   children: [
          //     Expanded(
          //       child: Column(
          //         children: [
          //           const HeaderLocationComponent(
          //               location: 'Rua das Flroes do Campo, 10'),
          //           ContentTabBarComponent(
          //             tabController: tabController,
          //             onTap: (index) {},
          //           )
          //         ],
          //       ),
          //     ),
          // BottomNavigatorComponent(
          //   currentIndex: currentIndexi,
          //   onTap: (index) {
          //     setState(() {
          //       currentIndexi = index;
          //     });
          //   },
          //   items: const [
          //     BottomNavigatorItemComponent(
          //       label: 'Inicio',
          //       activeIcon: AppIcons.homeActive,
          //       icon: AppIcons.home,
          //     ),
          //     BottomNavigatorItemComponent(
          //       label: 'Busca',
          //       activeIcon: AppIcons.searchActive,
          //       icon: AppIcons.search,
          //     ),
          //     BottomNavigatorItemComponent(
          //       label: 'Pedidos',
          //       activeIcon: AppIcons.ordersActive,
          //       icon: AppIcons.orders,
          //     ),
          //     BottomNavigatorItemComponent(
          //       label: 'Perfil',
          //       activeIcon: AppIcons.profileActive,
          //       icon: AppIcons.profile,
          //     ),
          //   ],
          // ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
