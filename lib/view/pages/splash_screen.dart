import 'package:figma_design_clone/core/constents/app_colors.dart';
import 'package:figma_design_clone/view/pages/onboarding.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primery,
      body: Center(
        child: Text(
          'Expenzia',
          style: TextStyle(
            fontWeight: .bold,
            fontSize: 30,
            color: AppColors.bgColor,
          ),
        ),
      ),
    );
  }
}
