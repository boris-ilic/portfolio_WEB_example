import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/global_components/buttons/section_button.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String subtitle;
  final String titleWhite;
  final String titleGreen;
  final String buttonLabel;
  final VoidCallback? onTap;

  const SectionHeader({
    required this.subtitle,
    required this.titleWhite,
    required this.titleGreen,
    required this.buttonLabel,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isSmallScreen = screenWidth < 600;
        final isMediumScreen = screenWidth < 900;

        // Calculate responsive values
        final horizontalPadding = _getResponsivePadding(screenWidth);
        final titleFontSize = _getResponsiveFontSize(screenWidth);
        final subtitleFontSize = titleFontSize * 0.38;

        // For small screens, we'll stack the content vertically
        if (isSmallScreen) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: horizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleText(
                  subtitleFontSize: subtitleFontSize,
                  titleFontSize: titleFontSize,
                ),
                if (onTap != null) ...[
                  const SizedBox(height: 20),
                  SectionButton(
                    label: buttonLabel,
                    onTap: onTap!,
                    isBlack: false,
                  ),
                ],
              ],
            ),
          );
        }

        // For medium and large screens
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: horizontalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: isMediumScreen ? 2 : 3,
                child: _buildTitleText(
                  subtitleFontSize: subtitleFontSize,
                  titleFontSize: titleFontSize,
                ),
              ),
              if (onTap != null) ...[
                SizedBox(width: isMediumScreen ? 20 : 40),
                SectionButton(
                  label: buttonLabel,
                  onTap: onTap!,
                  isBlack: false,
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildTitleText({
    required double subtitleFontSize,
    required double titleFontSize,
  }) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        text: subtitle.isNotEmpty ? "- " : "",
        style: TextStyle(
          fontSize: subtitleFontSize,
          fontWeight: FontWeight.w600,
          color: ColorPalette.green,
        ),
        children: [
          TextSpan(
            text: subtitle,
            style: TextStyle(
              fontSize: subtitleFontSize,
              fontWeight: FontWeight.normal,
              color: ColorPalette.white,
            ),
          ),
          TextSpan(
            text: titleWhite,
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: ColorPalette.white,
            ),
          ),
          TextSpan(
            text: titleGreen,
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: ColorPalette.green,
            ),
          ),
        ],
      ),
    );
  }

  double _getResponsivePadding(double screenWidth) {
    if (screenWidth > 1200) {
      return 60;
    } else if (screenWidth > 900) {
      return 45;
    } else if (screenWidth > 600) {
      return 30;
    } else {
      return 20;
    }
  }

  double _getResponsiveFontSize(double screenWidth) {
    if (screenWidth > 1200) {
      return 42;
    } else if (screenWidth > 900) {
      return 36;
    } else if (screenWidth > 600) {
      return 30;
    } else {
      return 24;
    }
  }
}
