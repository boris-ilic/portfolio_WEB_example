import 'package:boris_ilic_portfolio/constants/assets/image_constants.dart';
import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';

class HireMeButton extends StatelessWidget {
  final VoidCallback onTap;
  final double size;
  const HireMeButton({super.key, required this.onTap, this.size = Sizes.size100});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(AppImages.hireMeButton, height: size),
    );
  }
}
