import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';

class PurplePortfolioButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const PurplePortfolioButton({
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
        final horizontalPadding = isSmallScreen ? Sizes.size8 : Sizes.size16;
        final verticalPadding = isSmallScreen ? Sizes.size12 : Sizes.size18;
        final iconSize = isSmallScreen ? 18.0 : 24.0;
        final fontSize = isSmallScreen ? 14.0 : 16.0;
        final spacerWidth = isSmallScreen ? Sizes.size8 : Sizes.size22;
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
              foregroundColor: ColorPalette.white,
              backgroundColor: ColorPalette.purple,
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    label,
                    style: FontStyles.fontBold16.copyWith(
                      color: ColorPalette.white,
                      fontSize: fontSize,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: spacerWidth),
                Container(
                  width: iconSize,
                  height: iconSize,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorPalette.green,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    size: iconSize * 0.7,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
