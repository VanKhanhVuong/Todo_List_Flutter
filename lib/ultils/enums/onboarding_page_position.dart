import 'package:todolist/constants/constants.dart';

enum OnboardingPagePosition {
  page1,
  page2,
  page3,
}

extension OnboardingPagePositionExtension on OnboardingPagePosition {
  String onboardingPageImage() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return AppImages.onboarding_image_1;
      case OnboardingPagePosition.page2:
        return AppImages.onboarding_image_2;
      case OnboardingPagePosition.page3:
        return AppImages.onboarding_image_3;
    }
  }

  String onboardingPageTitle() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return AppTexts.title_1;
      case OnboardingPagePosition.page2:
        return AppTexts.title_2;
      case OnboardingPagePosition.page3:
        return AppTexts.title_3;
    }
  }

  String onboardingPageContent() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return AppTexts.content_1;
      case OnboardingPagePosition.page2:
        return AppTexts.content_2;
      case OnboardingPagePosition.page3:
        return AppTexts.content_3;
    }
  }
}
