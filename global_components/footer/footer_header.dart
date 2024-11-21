import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';

class FooterHeader extends StatelessWidget {
  final String subtitle;
  final String titleBlack;
  final String titlePurple;
  const FooterHeader(
      {required this.subtitle,
      required this.titleBlack,
      required this.titlePurple,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size60, vertical: Sizes.size24),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: "$titleBlack ",
              style: FontStyles.fontBold24
                  .copyWith(color: ColorPalette.black, fontSize: Sizes.size42),
              children: [
                TextSpan(
                  text: titlePurple,
                  style: FontStyles.fontBold24.copyWith(
                      color: ColorPalette.purple, fontSize: Sizes.size42),
                ),
                TextSpan(
                  text: " $subtitle",
                  style: FontStyles.fontBold24.copyWith(
                      color: ColorPalette.black, fontSize: Sizes.size42),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
