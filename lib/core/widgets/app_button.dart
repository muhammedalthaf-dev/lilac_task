import 'package:figma_design_clone/core/constents/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  final TextStyle style;
  const AppButton({super.key,required this.ontap,required this.text,required this.style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35)
        ),
        backgroundColor: AppColors.primery
      ),
      onPressed: ontap, child: Text(text,style: style,));
  }
}