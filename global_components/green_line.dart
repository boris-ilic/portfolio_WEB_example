import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';

class HorizontalGreenLine extends StatelessWidget {
  final List<String> items;
  const HorizontalGreenLine({
    this.items = const [
      "Android apps",
      "IOS apps",
      "Web apps",
      "Interview services",
      "Consultant services",
      "Publishing apps"
    ],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final height = screenWidth < 600 ? Sizes.size80 : Sizes.size60;

    return Container(
      width: double.maxFinite,
      height: height,
      color: ColorPalette.green,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: items.map((item) => GreenLineItem(label: item)).toList(),
        ),
      ),
    );
  }
}

class GreenLineItem extends StatelessWidget {
  final String label;

  const GreenLineItem({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth < 600 ? 18.0 : 24.0;
    final iconSize = screenWidth < 600 ? 20.0 : 24.0;
    final spacing = screenWidth < 600 ? Sizes.size42 : Sizes.size80;

    return Row(
      children: [
        SizedBox(width: screenWidth < 600 ? Sizes.size16 : Sizes.size24),
        Icon(Icons.stars_sharp, size: iconSize),
        const SizedBox(width: Sizes.size12),
        Text(
          label,
          style: FontStyles.fontBold24.copyWith(
            color: ColorPalette.black,
            fontSize: fontSize,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(width: spacing),
      ],
    );
  }
}
