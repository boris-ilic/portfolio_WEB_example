import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';

class PlainWhiteButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const PlainWhiteButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 200;
        final isMediumScreen =
            constraints.maxWidth <= 1024 && constraints.maxWidth > 600;
        final horizontalPadding = isSmallScreen ? Sizes.size16 : Sizes.size42;
        final verticalPadding = isSmallScreen ? Sizes.size12 : 19.0;
        final fontSize = isSmallScreen ? 14.0 : 16.0;
        final borderRadius = isSmallScreen ? Sizes.size16 : Sizes.size20;
        final scaleFactor = isSmallScreen
            ? 0.6
            : isMediumScreen
                ? 0.8
                : 1.0;
        final containerHeight = isSmallScreen ? 40.0 : 50.0 * scaleFactor;

        return SizedBox(
          height: containerHeight,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              foregroundColor: ColorPalette.purple10,
              backgroundColor: ColorPalette.purple10,
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              label,
              style: FontStyles.fontBold16.copyWith(
                color: ColorPalette.black,
                fontSize: fontSize,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
