import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';

class SectionButton extends StatelessWidget {
  final String label;
  final bool isBlack;
  final bool isBack;
  final VoidCallback onTap;

  const SectionButton({
    required this.label,
    required this.onTap,
    this.isBlack = true,
    super.key,
    this.isBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: Sizes.size6),
      decoration: BoxDecoration(
        color: isBlack ? ColorPalette.black : ColorPalette.white,
        borderRadius: BorderRadius.circular(Sizes.size32),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: isBlack
                    ? ColorPalette.white
                    : ColorPalette.purple, // Color for the circle
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(
                  Sizes.size6), // Padding inside the circle
              child: Icon(isBack ? Icons.arrow_back : Icons.arrow_forward,
                  color: isBlack
                      ? ColorPalette.black
                      : ColorPalette.white), // Icon and color inside the circle
            ),
            const SizedBox(width: Sizes.size10),
            Container(
              padding: const EdgeInsets.all(Sizes.size12),
              decoration: BoxDecoration(
                color: ColorPalette.green,
                borderRadius:
                    BorderRadius.circular(Sizes.size32), // Rounded corners
              ),
              child: Text(
                label,
                style: const TextStyle(
                  color: ColorPalette.black, // Text color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
