import 'package:figma_design_clone/core/constents/app_colors.dart';
import 'package:figma_design_clone/core/widgets/app_button.dart';
import 'package:figma_design_clone/view/pages/main_page.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/specular.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Spent Smarter\n   Save More',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight(600),
                color: AppColors.primery,
              ),
            ),
            SizedBox(height: 25,),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: AppButton(
                ontap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainPage()));
                },
                text: 'Get Started',
                style: TextStyle(
                  fontWeight: .bold,
                  color: AppColors.bgColor,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
