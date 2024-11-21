import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/helpers/responsive.dart';
import 'package:flutter/material.dart';

class ServiceContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String subTitle;
  final IconData icon;

  const ServiceContainer({
    required this.onTap,
    required this.title,
    required this.subTitle,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = ResponsiveWidget.isSmallScreen(context)
            ? Sizes.size250
            : ResponsiveWidget.isMediumScreen(context)
                ? Sizes.size250
                : Sizes.size250;

        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size32,
            horizontal: Sizes.size20,
          ),
          width: width,
          height: Sizes.size300,
          decoration: BoxDecoration(
            color: ColorPalette.purple30,
            borderRadius: BorderRadius.circular(Sizes.size150),
            // Optional: Add subtle shadow for depth
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: ColorPalette.white,
                size: Sizes.size50,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: FontStyles.fontRegular14.copyWith(
                  color: ColorPalette.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size12,
                ),
                child: Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: FontStyles.fontRegular14.copyWith(
                    color: ColorPalette.white,
                    height: 1.2,
                  ),
                ),
              ),
              if (onTap != null)
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Learn more →",
                      style: FontStyles.fontRegular14
                          .copyWith(color: ColorPalette.gray10),
                    ),
                  ),
                )
              else
                const SizedBox(height: 20)
            ],
          ),
        );
      },
    );
  }
}
