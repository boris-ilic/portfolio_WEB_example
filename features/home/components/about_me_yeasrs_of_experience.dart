import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';

class AboutMeYearsOfExperienceWidget extends StatelessWidget {
  const AboutMeYearsOfExperienceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.size350,
      height: Sizes.size400,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorPalette.white,
          width: 0,
        ),
        color: ColorPalette.purple,
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.size16),
        ),
      ),
      child: Stack(
        children: <Widget>[
          const Positioned(
            top: Sizes.size10,
            left: -25,
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                'BORIS  ILIC',
                style: TextStyle(
                  color: ColorPalette.white,
                  fontSize: Sizes.size60, // Adjust font size as necessary
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 0, // Adjust positioning as needed
            right: -20, // Adjust positioning as needed
            child: Text(
              '6',
              style: TextStyle(
                color: Colors.white,
                fontSize: Sizes.size300, // Adjust font size as necessary
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: Sizes.size20, // Adjust positioning as needed
            right: Sizes.size24, // Adjust positioning as needed
            child: Text(
              'Years of Experience',
              style: FontStyles.fontRegular24.copyWith(color: ColorPalette.white),
            ),
          ),
        ],
      ),
    );
  }
}
