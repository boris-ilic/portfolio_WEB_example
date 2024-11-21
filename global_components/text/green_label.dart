import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';

class GreenText extends StatelessWidget {
  const GreenText({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Sizes.size12),
      padding: const EdgeInsets.symmetric(vertical: Sizes.size6, horizontal: Sizes.size16),
      decoration: BoxDecoration(
        color: ColorPalette.green,
        borderRadius: BorderRadius.circular(Sizes.size32), // Rounded corners
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: ColorPalette.black, // Text color
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
