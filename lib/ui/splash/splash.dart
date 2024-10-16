import 'package:flutter/material.dart';
import 'package:todolist/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black_color,
        body: Center(child: _buildBodyPage()));
  }

  Widget _buildBodyPage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIconSplash(),
        _buildTextSplash(),
      ],
    );
  }

  Widget _buildIconSplash() {
    return Image.asset(
      AppImages.splash_icon,
      width: 95.03,
      height: 80.46,
      fit: BoxFit.contain,
    );
  }

  Widget _buildTextSplash() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Text(
        AppTexts.appName,
        style: TextStyle(
            fontSize: 40,
            color: AppColors.white_color,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
