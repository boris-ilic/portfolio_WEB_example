import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';

class DoubleTitle extends StatelessWidget {
  final String subtitle;
  final String titleBlack;
  final String titlePurple;
  final bool isCentered;

  const DoubleTitle({
    required this.subtitle,
    required this.titleBlack,
    required this.titlePurple,
    this.isCentered = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Get screen width
        final screenWidth = MediaQuery.of(context).size.width;

        // Calculate responsive values
        final double horizontalPadding = _getResponsivePadding(screenWidth);
        final double verticalPadding = horizontalPadding * 0.4;
        final double titleFontSize = _getResponsiveFontSize(screenWidth);
        final double subtitleFontSize = titleFontSize * 0.38;

        return isCentered
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "- ",
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          fontWeight: FontWeight.w600,
                          color: ColorPalette.purple,
                        ),
                        children: [
                          TextSpan(
                            text: subtitle,
                            style: TextStyle(
                              fontSize: subtitleFontSize,
                              fontWeight: FontWeight.normal,
                              color: ColorPalette.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: titleBlack,
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.black,
                        ),
                        children: [
                          TextSpan(
                            text: titlePurple,
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: ColorPalette.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: "- ",
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          fontWeight: FontWeight.w600,
                          color: ColorPalette.purple,
                        ),
                        children: [
                          TextSpan(
                            text: subtitle,
                            style: TextStyle(
                              fontSize: subtitleFontSize,
                              fontWeight: FontWeight.normal,
                              color: ColorPalette.black,
                            ),
                          ),
                          TextSpan(
                            text: "\n$titleBlack",
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: ColorPalette.black,
                            ),
                          ),
                          TextSpan(
                            text: titlePurple,
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: ColorPalette.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  double _getResponsivePadding(double screenWidth) {
    if (screenWidth > 1200) {
      return 60;
    } else if (screenWidth > 800) {
      return 40;
    } else if (screenWidth > 600) {
      return 30;
    } else {
      return 20;
    }
  }

  double _getResponsiveFontSize(double screenWidth) {
    if (screenWidth > 1200) {
      return 42;
    } else if (screenWidth > 800) {
      return 36;
    } else if (screenWidth > 600) {
      return 30;
    } else {
      return 24;
    }
  }
}
