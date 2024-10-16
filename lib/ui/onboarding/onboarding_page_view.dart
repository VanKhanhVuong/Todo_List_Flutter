// Class cha: Quản lý các page con (Di chuyển các class con)
import 'package:flutter/material.dart';
import 'package:todolist/ui/onboarding/onboarding_child_page.dart';
import 'package:todolist/ultils/enums/onboarding_page_position.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        OnboardingChildPage(
          onboardingPagePosition: OnboardingPagePosition.page1,
          nextOnPressed: () {
            _pageController.jumpToPage(1);
          },
          backOnPressed: () {
            // Nothing
          },
          skipOnPressed: () {
            print("Goto WellCome");
          },
        ),
        OnboardingChildPage(
          onboardingPagePosition: OnboardingPagePosition.page2,
          nextOnPressed: () {
            _pageController.jumpToPage(2);
          },
          backOnPressed: () {
            _pageController.jumpToPage(0);
          },
          skipOnPressed: () {
            print("Goto WellCome");
          },
        ),
        OnboardingChildPage(
          onboardingPagePosition: OnboardingPagePosition.page3,
          nextOnPressed: () {
            print("Goto WellCome");
          },
          backOnPressed: () {
            _pageController.jumpToPage(1);
          },
          skipOnPressed: () {
            print("Goto WellCome");
          },
        ),
      ],
    ));
  }
}
