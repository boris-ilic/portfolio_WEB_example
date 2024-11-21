import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';

class FooterLabel extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const FooterLabel({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: FontStyles.fontRegular14.copyWith(
            color: ColorPalette.gray30,
            height: 1.5,
          ),

          // softWrap: true,
        ),
      ),
    );
  }
}
