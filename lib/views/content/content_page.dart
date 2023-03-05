import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/core/theme/app_icons.dart';
import 'package:ifood/core/theme/app_images.dart';
import 'package:ifood/core/theme/app_typography.dart';
import 'package:ifood/models/category.dart';
import 'package:ifood/views/content/components/banners_component.dart';
import 'package:ifood/views/content/components/bottom_navigator_component.dart';
import 'package:ifood/views/content/components/category_item_component.dart';
import 'package:ifood/views/content/components/filters_component.dart';
import 'package:ifood/views/content/components/header_local_component.dart';

import '../../controllers/content_controller.dart';
import 'components/content_tab_bar_component.dart';
import 'components/restaurants_list_component.dart';

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
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const HeaderLocationComponent(location: 'Rua Flores do Campo,10'),
              ContentTabBarComponent(
                tabController: tabController,
                onTap: (index) {},
              ),
              const FiltersComponent()
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
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      _CategorySession(categorys: categorys),
                      const _BannerSession(),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            bottom: 24,
                          ),
                          child: Text(
                            'Lojas',
                            style: AppTypography.sessionTitle(context),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          restaurants
                              .map(
                                  (e) => RestaurantItemComponent(restaurant: e))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _BottomNavigator(
                currentIndex: currentIndexi,
                onTap: (index) {
                  setState(() {
                    currentIndexi = index;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CategorySession extends StatelessWidget {
  const _CategorySession({
    required this.categorys,
  });
  final List<Category> categorys;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 86,
        child: ListView.builder(
          itemCount: categorys.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  left: index == 0 ? 16 : 0,
                  right: index == categorys.length - 1 ? 16 : 10),
              child: CategoryItemComponent(
                category: categorys[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _BannerSession extends StatelessWidget {
  const _BannerSession();

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 160,
        child: BannersComponent(list: [
          BannerItemComponent(imagePath: AppImages.banner1),
          BannerItemComponent(imagePath: AppImages.banner2),
          BannerItemComponent(imagePath: AppImages.banner3),
          BannerItemComponent(imagePath: AppImages.banner4),
        ]),
      ),
    );
  }
}

class _BottomNavigator extends StatelessWidget {
  const _BottomNavigator({
    required this.currentIndex,
    required this.onTap,
  });
  final Function(int) onTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigatorComponent(
      currentIndex: currentIndex,
      onTap: onTap,
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
    );
  }
}
