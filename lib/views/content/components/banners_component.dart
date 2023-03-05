import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';

class BannersComponent extends StatefulWidget {
  const BannersComponent({
    super.key,
    required this.list,
  });

  final List<BannerItemComponent> list;

  @override
  State<BannersComponent> createState() => _BannersComponentState();
}

class _BannersComponentState extends State<BannersComponent> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(onChangePage);
  }

  void onChangePage() {
    setState(() {
      _currentIndex = _pageController.page!.round();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.removeListener(onChangePage);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: PageView(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: widget.list,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.list
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: AnimatedContainer(
                        height: 6,
                        width: 5,
                        duration: const Duration(milliseconds: 150),
                        decoration: BoxDecoration(
                          color: widget.list.indexOf(e) == _currentIndex
                              ? AppColors.grey7
                              : AppColors.grey2,
                          shape: BoxShape.circle,
                        ),
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

class BannerItemComponent extends StatelessWidget {
  const BannerItemComponent({
    super.key,
    required this.imagePath,
  });
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: 140,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
