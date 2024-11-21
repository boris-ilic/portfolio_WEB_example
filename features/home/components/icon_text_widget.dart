import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final String text;
  final IconData icon;

  const IconTextWidget({
    required this.text,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Sizes.size10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: ColorPalette.white,
            minRadius: Sizes.size10,
            maxRadius: Sizes.size18,
            child: Icon(
              icon,
              color: ColorPalette.purple,
            ),
          ),
          const SizedBox(
            width: Sizes.size20,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
