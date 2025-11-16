import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AutoSlideBanner extends StatefulWidget {
  final List<String> imageAssets;
  final Duration slideDuration;

  const AutoSlideBanner({
    Key? key,
    required this.imageAssets,
    this.slideDuration = const Duration(seconds: 3),
  }) : super(key: key);

  @override
  State<AutoSlideBanner> createState() => _AutoSlideBannerState();
}

class _AutoSlideBannerState extends State<AutoSlideBanner> {
  final ValueNotifier<int> currentPage = ValueNotifier(0);
  final SwiperController swiperController = SwiperController();

  @override
  void dispose() {
    currentPage.dispose();
    swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 127 / 198,
      child: Column(
        children: [
          SizedBox(
            height: 128.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Swiper(
                controller: swiperController,
                itemCount: widget.imageAssets.length,
                autoplay: true,
                autoplayDelay: widget.slideDuration.inMilliseconds,
                duration: 400,
                curve: Curves.easeInOut,
                onIndexChanged: (index) => currentPage.value = index,
                itemBuilder: (context, index) {
                  return Image.asset(
                    widget.imageAssets[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, url, error) => const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          verticalSpace(8),
          ValueListenableBuilder<int>(
            valueListenable: currentPage,
            builder: (context, value, _) {
              return AnimatedSmoothIndicator(
                activeIndex: value,
                count: widget.imageAssets.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: theme.colorScheme.primary,
                  dotColor: theme.colorScheme.secondary,
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                  expansionFactor: 3,
                  spacing: 8.w,
                ),
                onDotClicked: (index) => swiperController.move(index),
              );
            },
          ),
        ],
      ),
    );
  }
}
