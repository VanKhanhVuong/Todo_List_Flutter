// Class con:
import 'package:flutter/material.dart';
import 'package:todolist/constants/constants.dart';
import 'package:todolist/ultils/enums/onboarding_page_position.dart';

class OnboardingChildPage extends StatelessWidget {
  final OnboardingPagePosition onboardingPagePosition;
  final VoidCallback nextOnPressed;
  final VoidCallback backOnPressed;
  final VoidCallback skipOnPressed;

  const OnboardingChildPage(
      {super.key,
      required this.onboardingPagePosition,
      required this.nextOnPressed,
      required this.backOnPressed,
      required this.skipOnPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black_color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                _buildSkipButton(),
                _buildOnboardingImage(),
                _buildOnboardingPageControl(),
                _buildOnboardingTitleAndContent(),
                _buildOnboardingNextAndPrevButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      alignment: AlignmentDirectional.centerStart,
      child: TextButton(
          onPressed: () {
            skipOnPressed.call();
          },
          child: Text(
            AppTexts.skip,
            style: TextStyle(
                fontSize: 16, color: AppColors.white_color.withOpacity(0.44)),
          )),
    );
  }

  Widget _buildOnboardingImage() {
    return Image.asset(
      onboardingPagePosition.onboardingPageImage(),
      height: 296,
      width: 271,
      fit: BoxFit.contain,
    );
  }

  Widget _buildOnboardingPageControl() {
    final pages = OnboardingPagePosition.values;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(pages.length, (index) {
          final page = pages[index];
          return Container(
            height: 4,
            width: 26,
            margin: EdgeInsets.symmetric(horizontal: index == 1 ? 8 : 0),
            decoration: BoxDecoration(
              color: onboardingPagePosition == page
                  ? AppColors.primary_color
                  : AppColors.white_color.withOpacity(0.7),
              borderRadius: BorderRadius.circular(56),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildOnboardingTitleAndContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            onboardingPagePosition.onboardingPageTitle(),
            style: TextStyle(
                color: AppColors.white_color.withOpacity(0.87),
                fontSize: 32,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 42,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            onboardingPagePosition.onboardingPageContent(),
            style: TextStyle(
              color: AppColors.white_color.withOpacity(0.87),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildOnboardingNextAndPrevButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24)
          .copyWith(top: 107, bottom: 24),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              backOnPressed.call();
            },
            child: Text(
              AppTexts.back,
              style: TextStyle(
                  fontSize: 16, color: AppColors.white_color.withOpacity(0.44)),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              nextOnPressed.call();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary_color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                )),
            child: Text(
              onboardingPagePosition == OnboardingPagePosition.page3
                  ? AppTexts.get_started
                  : AppTexts.next,
              style: TextStyle(
                  fontSize: 16, color: AppColors.white_color.withOpacity(0.44)),
            ),
          )
        ],
      ),
    );
  }
}
