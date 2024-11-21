import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/global_components/green_line.dart';
import 'package:flutter/material.dart';

class CreateProjectTile extends StatelessWidget {
  const CreateProjectTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HorizontalGreenLine(),
        const SizedBox(
          height: 15,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "Let's create an ",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Sizes.size80),
              children: [
                TextSpan(
                  text: "\nAmazing Project\n",
                  style: FontStyles.fontBoldPurple16.copyWith(
                    fontSize: Sizes.size80,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(
                  text: "Together!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Sizes.size80),
                ),
              ]),
        ),
        const SizedBox(
          height: 15,
        ),
        const HorizontalGreenLine(),
      ],
    );
  }
}
