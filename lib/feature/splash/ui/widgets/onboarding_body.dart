import 'package:bazar_app/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_routes/routes_strings.dart';
import '../../../../core/helpers/shared_preference/local_storage.dart';
import '../../../../core/widgets/spaces.dart';
import '../../../../generated/l10n.dart';
import '../screens/onboarding_screen.dart';
import 'onboarding_actions.dart';
import 'onboarding_image.dart';
import 'onboarding_texts.dart';
import 'skip_button.dart';

class OnboardingBody extends StatelessWidget {
  final PageController pageController;
  final int currentIndex;

  const OnboardingBody({
    super.key,
    required this.pageController,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final list = onboardingList(context);
    final onboardingData = list[currentIndex];
    final isLast = currentIndex == list.length - 1;
    final OnboardingStorage storage = OnboardingStorage();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            SkipButton(
              onPressed: () async {
                await storage.saveSeen(true);
                context.pushReplacementNamed(Routing.loginScreen);
              },
              label: s.skipButton,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: OnboardingImage(
                  imagePath: onboardingData.image,
                  width: 0.8.sw,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OnboardingTexts(
                    title: onboardingData.title,
                    description: onboardingData.description,
                  ),
                  verticalSpace(10),

                  PrimaryActionButton(
                    label: isLast ? s.getStartedButton : s.nextButton,
                    onPressed: () async {
                      if (isLast) {
                        await storage.saveSeen(true);
                        context.pushReplacementNamed(Routing.loginScreen);
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                  ),

                  verticalSpace(10),
                  SignInActionButton(
                    label: s.signInButton,
                    onPressed: () {
                      context.pushReplacementNamed(Routing.signupScreen);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
