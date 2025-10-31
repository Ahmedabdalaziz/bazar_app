import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LocalAutoSlideBanner extends StatefulWidget {
  final List<String> imageAssets;
  final Duration slideDuration;

  const LocalAutoSlideBanner({
    Key? key,
    required this.imageAssets,
    this.slideDuration = const Duration(seconds: 3),
  }) : super(key: key);

  @override
  State<LocalAutoSlideBanner> createState() => _LocalAutoSlideBannerState();
}

class _LocalAutoSlideBannerState extends State<LocalAutoSlideBanner> {
  int _currentPage = 0;
  final SwiperController _swiperController = SwiperController();

  @override
  void dispose() {
    _swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 127 / 198,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Swiper(
              controller: _swiperController,
              itemCount: widget.imageAssets.length,
              autoplay: true,
              autoplayDelay: widget.slideDuration.inMilliseconds,
              duration: 400,
              curve: Curves.easeInOut,
              onIndexChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.imageAssets[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, url, error) =>
                      const Icon(Icons.image_not_supported, color: Colors.grey),
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 8.h,
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: _currentPage,
                count: widget.imageAssets.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: theme.colorScheme.primary,
                  dotColor: theme.colorScheme.secondary,
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                  expansionFactor: 3,
                  spacing: 8.w,
                ),
                onDotClicked: (index) {
                  _swiperController.move(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
