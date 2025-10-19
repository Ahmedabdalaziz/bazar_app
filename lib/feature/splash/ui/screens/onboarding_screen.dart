import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../generated/l10n.dart';
import '../../data/onboarding_model.dart';
import '../widgets/onboarding_body.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: onboardingList(context).length,
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
        itemBuilder: (context, index) {
          return OnboardingBody(
            pageController: pageController,
            currentIndex: index,
          );
        },
      ),
    );
  }
}

List<OnboardingModel> onboardingList(BuildContext context) {
  final s = S.of(context);
  return [
    OnboardingModel(
      image: AppStrings.onboardingImage1,
      title: s.firstOnboardingTitle,
      description: s.firstOnboardingBody,
    ),
    OnboardingModel(
      image: AppStrings.onboardingImage2,
      title: s.secondOnboardingTitle,
      description: s.secondOnboardingBody,
    ),
    OnboardingModel(
      image: AppStrings.onboardingImage3,
      title: s.thirdOnboardingTitle,
      description: s.thirdOnboardingBody,
    ),
  ];
}
